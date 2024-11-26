const path = require("path");

const rootPath = process.cwd();
module.exports={
  target: 'node',
  entry:"./src/main.js",
  output:{
    path:path.resolve(rootPath,"./dist"),
    filename:"bundle.js",
    clean:true
  },
  mode:"production",
  
}