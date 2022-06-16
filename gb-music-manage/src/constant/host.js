let WS_HOST_NAME = '';
let HOST_NAME='';
if(process.env.NODE_ENV==="development"){
   WS_HOST_NAME = 'ws://localhost:8201';
   HOST_NAME='http://localhost:8200';
}else if(process.env.NODE_ENV==='production'){
   WS_HOST_NAME = 'ws://8.140.110.78:8201';
   HOST_NAME='http://8.140.110.78:8200';
}
export {
  WS_HOST_NAME,
  HOST_NAME
}

