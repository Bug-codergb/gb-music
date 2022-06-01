function paramsCheckHandle(...rest) {
  return rest.every((item, index) => {
    return item && item.trim().length !== 0;
  });
}
module.exports = {
  paramsCheckHandle
};
