const { getSearchMatchService } = require('../service/search.service');
const errorType = require('../constants/errorType');
class SearchController {
  async getSearchMatch(req, res, next) {
    const { keyword } = req.query;
    if (keyword.trim().length !== 0) {
      const result = await getSearchMatchService(keyword);
      res.json(result);
    } else {
      next(new Error(errorType.PARAMETER_ERROR));
    }
  }
}
module.exports = new SearchController();
