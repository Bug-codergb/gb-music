const fs = require('fs');
const delFile = (path) => {
  return new Promise((resolve, reject) => {
    fs.unlink(path, (err) => {
      if (err) {
        reject(new Error('fail'));
      } else {
        resolve('success');
      }
    });
  });
};
module.exports = {
  delFile
};
