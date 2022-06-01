export function parseURL(url: string) {
  if (!url.includes('?')) {
    return '';
  } else {
    let params = url.substring(url.lastIndexOf('?') + 1);
    let paramsArr = params.split('&');
    let res: any = {};
    for (let item of paramsArr) {
      let param = item.split('=');
      res[param[0]] = param[1].toString();
    }
    return res;
  }
}
