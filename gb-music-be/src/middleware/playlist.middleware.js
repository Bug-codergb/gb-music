const errorType = require('../constants/errorType');
const { paramsCheckHandle } = require('../utils/paramsCheckHandle');
function paramCheck(req, res, next) {
  try {
    const { name, desc } = req.body;
    const check = paramsCheckHandle(name, desc);
    if (check) {
      next();
    } else {
      next(new Error(errorType.REQUEST_PARAMETER_CANNOT_BE_EMPTY));
    }
  } catch (e) {
    console.log(e);
  }
}
module.exports = {
  paramCheck
};
