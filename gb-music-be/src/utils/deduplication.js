function deduplicate(arr) {
  return arr.filter((item, index) => {
    return (
      index ===
      arr.findIndex((it, i) => {
        return it === item;
      })
    );
  });
}
module.exports = {
  deduplicate
};
