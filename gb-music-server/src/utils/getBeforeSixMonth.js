const { formatTime } = require('../utils/formatTime');
function getBeforeSixMonth() {
  const currentTime = formatTime(new Date().getTime(), 'yyyy-MM-dd');
  const currentMonth = parseInt(currentTime.substr(currentTime.indexOf('-') + 1, 2) || 12);
  const currentYear = parseInt(currentTime.substr(0, 4) || 12);
  const diff = currentMonth - 6;
  const result = [];
  if (diff >= 0) {
    for (let i = currentMonth; i > 0; i--) {
      result.push(`${currentYear}-${i.toString().padStart(2, '0')}`);
    }
  } else {
    for (let i = currentMonth; i > 0; i--) {
      result.push(`${currentYear}-${i.toString().padStart(2, '0')}`);
    }
    for (let i = 12; i > 12 - Math.abs(diff); i--) {
      result.push(`${currentYear - 1}-${i.toString().padStart(2, '0')}`);
    }
  }
  return result;
}
module.exports = {
  getBeforeSixMonth
};
