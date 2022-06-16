function getSum(target, arr) {
  let sum = 0;
  for (let item of arr) {
    if (`${item}` === `${target}`) {
      sum++;
    }
  }
  return sum;
}
module.exports = {
  getSum
};
