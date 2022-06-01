const errorType = require('../constants/errorType');
function isEmpty(rest, msg, next) {
  if (rest === undefined || rest === null || rest.toString().trim().length === 0) {
    next(errorType.paramsEmpty('params is not null', msg));
    return true;
  } else {
    return false;
  }
}
module.exports = {
  isEmpty
};
