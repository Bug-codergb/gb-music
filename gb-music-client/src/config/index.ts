/*
@Name guo'bin
@Description gb-music
@author guo'bin
@date 2022/1/22
*/
let HOST_NAME: string = '';
if (process.env.NODE_ENV === 'development') {
  HOST_NAME = 'http://localhost:8200';
} else if (process.env.NODE_ENV === 'production') {
  HOST_NAME = 'http://8.140.110.78:8200';
}
export { HOST_NAME };
