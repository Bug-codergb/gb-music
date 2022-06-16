const fs = require('fs');
const path = require('path');
const webp = require('webp-converter');
const Jimp = require('jimp');

const imgType = ['image/gif', 'image/jpeg', 'image/png', 'image/tiff', 'image/bmp'];
function accessFile(filePath) {
  return new Promise((resolve, reject) => {
    fs.access(filePath, (err) => {
      if (err) {
        reject(new Error('文件不存在'));
      } else {
        resolve(filePath);
      }
    });
  });
}
function resetFile(filePath, mimetype, w, h) {
  if (mimetype === 'image/jpg') {
    mimetype = 'image/jpeg';
  }
  return new Promise((resolve, reject) => {
    if (!imgType.includes(mimetype)) {
      reject(new Error(`Unsupported MIME type: ${mimetype}`));
    } else {
      if (!w && !h) {
        reject(new Error(`either width or height must be true`));
      } else {
        if (!w) {
          w = Jimp.AUTO;
          h = h * 1;
        }
        if (!h) {
          h = Jimp.AUTO;
          w = w * 1;
        } else {
          h = h * 1;
          w = w * 1;
        }
      }
      Jimp.read(filePath)
        .then((image) => {
          image
            .resize(w, h)
            .quality(100)
            .getBuffer(mimetype, (err, value) => {
              if (err) {
                reject(err);
              } else {
                resolve(value);
              }
            });
        })
        .catch((e) => {
          reject(e);
        });
    }
  });
}
function toOtherFileType(sourcePath, targetPath) {
  return new Promise((resolve, reject) => {
    webp
      .dwebp(sourcePath, targetPath, '-o')
      .then((data) => {
        resolve(data);
      })
      .catch((err) => {
        reject(err);
      });
  });
}
function tran(filePath, target, mimetype, w, h) {
  return new Promise((resolve, reject) => {
    accessFile(filePath)
      .then((data) => {
        resetFile(data, mimetype, w, h)
          .then((data) => {
            resolve(data);
          })
          .catch((err) => {
            if (
              err.message === 'Unsupported MIME type: image/webp' ||
              err === 'Unsupported MIME type: image/webp'
            ) {
              const fileName = path.basename(filePath);
              toOtherFileType(filePath, target)
                .then((data) => {
                  if (data.length === 0) {
                    resetFile(filePath, mimetype, w, h)
                      .then((data) => {
                        resolve(data);
                      })
                      .catch((err) => {
                        reject(err);
                      });
                  }
                })
                .catch((err) => {
                  reject(err);
                });
            } else {
              reject(err);
            }
          });
      })
      .catch((err) => {
        reject(err);
      });
  });
}
module.exports = {
  tran
};
