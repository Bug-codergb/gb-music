import request from '../request';
//获取文件流
export function getFileBlob(url: string) {
  return request({
    url,
    responseType: 'blob'
  });
}
