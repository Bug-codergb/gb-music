const errorType = require('../constants/errorType');
const { isEmpty } = require('../utils/isEmpty');
const {
  getVipMessageService,
  getUserHistoryVIPService,
  deleteHistoryService,
  getVIPOrderDataService
} = require('../service/vip.service');
const { getAllComboService } = require('../service/combo.service');
const { getBeforeSixMonth } = require('../utils/getBeforeSixMonth');
class VipController {
  async getVipMessage(req, res, next) {
    try {
      const { userId } = req.user;
      const result = await getVipMessageService(userId);
      res.json(result[0]);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //获取历史VIP
  async getUserHistoryVIP(req, res, next) {
    try {
      const { userId } = req.user;
      const result = await getUserHistoryVIPService(userId);
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
  //删除VIP history
  async deleteHistory(req, res, next) {
    const { id } = req.body;
    if (!isEmpty(id, 'vip的id不能为空', next)) {
      const result = await deleteHistoryService(id);
      res.json(result);
    }
  }
  //获取VIP订单信息
  async getVIPOrderData(req, res, next) {
    try {
      let result = await getVIPOrderDataService();
      const combo = await getAllComboService();
      const time = getBeforeSixMonth();
      let data = [];
      for (let item of time) {
        for (let it of result) {
          data.push({
            time: item,
            name: it.name,
            count: it.order.filter((i) => {
              return i.joinTime === item;
            }).length
          });
        }
      }
      result = time.map((item, index) => {
        let obj = {
          name: item,
          order: []
        };
        for (let it of data) {
          if (item === it.time) {
            obj.order.push({
              name: it.name,
              count: it.count
            });
          }
        }
        return obj;
      });
      res.json(result);
    } catch (e) {
      next(new Error(errorType.SERVER_INTERNAL_ERROR));
    }
  }
}
module.exports = new VipController();
