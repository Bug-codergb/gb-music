const express=require("express");
const compression=require("compression");
const app=express();
app.use(compression());
app.use(express.static('./build'));
app.listen(8888,()=>{
  console.log("服务启动")
})