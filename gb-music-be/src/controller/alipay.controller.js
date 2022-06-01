const alipaySdk = require('../utils/alipay');
const AliPayFormData = require('alipay-sdk/lib/form').default;
const request = require('../network/request');
const { WEBFONT_HOST, WEBFONT_PORT } = require('../app/config');
const {
  joinVIPService,
  createOrderService,
  updateOrderService
} = require('../service/alipay.service');
const { getVipMessageService } = require('../service/vip.service');
class AlipayController {
  async create(req, res, next) {
    try {
      const { name, price, cId } = req.body;
      let newName = name.substring(0, name.lastIndexOf('个'));
      const { userId } = req.user;
      const orderId = await createOrderService(userId, price, cId);
      const formData = new AliPayFormData();
      formData.setMethod('get');
      formData.addField('bizContent', {
        outTradeNo: `${cId}_${price}_${newName}_${userId}_${new Date().getTime()}`, //`${cId}_${price}_${newName}_${userId}`, // 商户订单号,64个字符以内、可包含字母、数字、下划线,且不能重复
        productCode: 'FAST_INSTANT_TRADE_PAY', // 销售产品码，与支付宝签约的产品码名称,仅支持FAST_INSTANT_TRADE_PAY
        totalAmount: price, // 订单总金额，单位为元，精确到小数点后两位
        subject: `${name} 会员`, // 订单标题
        body: `${name}/${price}` // 订单描述
      });
      formData.addField(
        'returnUrl',
        `${WEBFONT_HOST}:${WEBFONT_PORT}/Home/success?orderId=${orderId}`
      );
      const result = await alipaySdk.exec(
        // result 为可以跳转到支付链接的 url
        'alipay.trade.page.pay', // 统一收单下单并支付页面接口
        {}, // api 请求的参数（包含“公共请求参数”和“业务参数”）
        { formData: formData }
      );
      res.json({
        url: result,
        orderId: `${cId}_${price}_${newName}_${userId}`,
        cId,
        name,
        price,
        userId,
        orderDataBaseId: orderId
      });
    } catch (e) {
      console.log(e);
    }
  }
  async queryStatus(req, res, next) {
    try {
      const { orderId } = req.body;
      const formData = new AliPayFormData();
      formData.setMethod('get');
      formData.addField('bizContent', {
        out_trade_no: orderId
      });
      const result = await alipaySdk.exec('alipay.trade.query', {}, { formData: formData });
      const data = await request({
        method: 'get',
        url: result
      });
      const { alipay_trade_query_response } = data;
      res.json(alipay_trade_query_response);
    } catch (e) {
      res.json(e);
    }
  }
  async closeOrder(req, res, next) {
    const { orderId } = req.body;
    const formData = new AliPayFormData();
    formData.setMethod('get');
    formData.addField('bizContent', {
      out_trade_no: orderId
    });
    const result = await alipaySdk.exec(
      'alipay.trade.close',
      {},
      {
        formData: formData
      }
    );
    res.json(result);
    const data = await request({
      method: 'get',
      url: result
    });
    const { alipay_trade_close_response } = data;
    res.json(alipay_trade_close_response);
  }
  async joinVIP(req, res, next) {
    const { cId, name, orderId } = req.body;
    const { userId } = req.user;
    const newName = name.substring(0, name.lastIndexOf('个'));
    const result = await joinVIPService(cId, newName, userId);
    await updateOrderService(orderId);
    res.json(result);
  }
}
module.exports = new AlipayController();
