const selectBannerType = (source) => {
  switch (source) {
    case 'songId':
      return 1;
    case 'alId':
      return 2;
    case 'vId':
      return 3;
  }
};
module.exports = {
  selectBannerType
};
