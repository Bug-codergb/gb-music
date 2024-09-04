import jwt from 'jsonwebtoken';
function verifyURL(url: string) {
  const publicKey: string = `-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVngqLlcT4xs9q18KCEWGaNYIa
EMwSIus02VG3XVt8IGwT5Ws8Z1qCULz7jxERDKgSyfUM0EMOQ2KH/Z/ZhhZAld1r
DCjxhiWLwXx5qYWJo9U862aYMQUjb3J5iqf2Wg+OuHPYkZ9oUvQl01kMRTkEkprf
kNSJkagkgGMGph5OywIDAQAB
-----END PUBLIC KEY-----`;
  const result: any = jwt.verify(url, publicKey, {
    algorithms: ['RS256']
  });
  if ((result && result.url) || (result && result.mp3Url)) {
    return result.url || result.mp3Url;
  } else {
    return '';
  }
}
export { verifyURL };
