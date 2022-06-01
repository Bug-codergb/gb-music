const AlipaySdk = require('alipay-sdk').default; // 引入 SDK
const { ALIPAY_PRIVATE_KEY, ALIPAY_APPLY_PUBLIC_KEY } = require('../app/config');
const alipaySdk = new AlipaySdk({
  appId: '2021000119605470', //开放平台上创建应用时生成的 appId
  signType: 'RSA2',
  gateway: 'https://openapi.alipaydev.com/gateway.do',
  alipayPublicKey: ALIPAY_APPLY_PUBLIC_KEY,
  privateKey: ALIPAY_PRIVATE_KEY
});
module.exports = alipaySdk;
