const AlipaySdk = require('alipay-sdk').default; // 引入 SDK
const { ALIPAY_PRIVATE_KEY, ALIPAY_APPLY_PUBLIC_KEY } = require('../app/config');
const alipaySdk = new AlipaySdk({
  appId: '902100013263733079198',
  signType: 'RSA2',
  gateway: 'https://openapi-sandbox.dl.alipaydev.com/gateway.do',
  alipayPublicKey: ALIPAY_APPLY_PUBLIC_KEY,
  privateKey: ALIPAY_PRIVATE_KEY
});
module.exports = alipaySdk;
