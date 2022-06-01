const { isExists } = require('../utils/isExists');
const errorType = require('../constants/errorType');
const { getAlbumService, getAlbumCoverService } = require('../service/album.service');
const isExistsAlbum = async (req, res, next) => {
  const { name } = req.body;
  await isExists(name, getAlbumService, errorType.ALBUM_ALREADY_EXISTS, next);
};
const isExistsCover = async (req, res, next) => {
  const { id } = req.query;
  await isExists(id, getAlbumCoverService, errorType.ALBUM_COVER_ALREADY_EXISTS, next);
};
const paramCheck = (req, res, next) => {
  const { albumId } = req.query;
  if (!albumId || albumId.trim().length === 0) {
    next(new Error(errorType.REQUEST_PARAMETER_CANNOT_BE_EMPTY));
  } else {
    next();
  }
};
module.exports = {
  isExistsAlbum,
  isExistsCover,
  paramCheck
};
