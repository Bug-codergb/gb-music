const fs = require('fs');
const isExists = async (id, getMsgById, errorType, next) => {
  const result = await getMsgById(id);
  if (result[0]) {
    next(new Error(errorType));
  } else {
    next();
  }
};
const isExistsFile = (path) => {
  return new Promise((resolve, reject) => {
    fs.access(path, (err) => {
      if (err) {
        reject(new Error('no file'));
      } else {
        resolve(path);
      }
    });
  });
};
module.exports = {
  isExists,
  isExistsFile
};
