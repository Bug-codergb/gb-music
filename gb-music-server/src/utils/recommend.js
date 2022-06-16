function recommend(userSum, userFav, recUserId) {
  try {
    let result = [];
    let sparseMatrix = Array(userSum)
      .fill()
      .map((item) => Array(userSum).fill(0));
    let userItemLength = new Map(); //每一个用户对应的物品个数
    let itemUserCollection = new Map(); //每一个用户对应的物品罗列
    let items = new Set();
    //辅助存储物品集合
    let userID = new Map();
    //辅助存储每一个用户的用户ID映射
    let idUser = new Map();
    for (let i = 0; i < userFav.length; i++) {
      userItemLength.set(userFav[i][0], userFav[i].length - 1);
      //eg: A 3
      userID.set(userFav[i][0], i);
      //用户ID与稀疏矩阵建立对应关系
      idUser.set(i, userFav[i][0]);
      //建立物品--用户倒排表
      for (let j = 1; j < userFav[i].length; j++) {
        if (items.has(userFav[i][j])) {
          //如果已经包含对应的物品--用户映射，直接添加对应的用户
          itemUserCollection.get(userFav[i][j]).add(userFav[i][0]);
        } else {
          //否则创建对应物品--用户集合映射
          items.add(userFav[i][j]);
          itemUserCollection.set(userFav[i][j], new Set());
          //创建物品--用户倒排关系
          itemUserCollection.get(userFav[i][j]).add(userFav[i][0]);
        }
      }
    }

    //计算相似度矩阵【稀疏】
    let entrySet = itemUserCollection.entries();
    for (let item of entrySet) {
      let commonUsers = item[1];
      for (let user_u of commonUsers) {
        for (let user_v of commonUsers) {
          if (user_u === user_v) {
            continue;
          }
          sparseMatrix[userID.get(user_u)][userID.get(user_v)] += 1;
          //计算用户u与用户v都有正反馈的物品总数
        }
      }
    }
    let recommendUser = recUserId; //推荐给recUser
    //计算用户之间的相似度【余弦相似性】
    let recommendUserId = userID.get(recommendUser);
    for (let j = 0; j < sparseMatrix.length; j++) {
      if (j !== recommendUserId) {
        //console.log(idUser.get(recommendUserId) + "--" + idUser.get(j) + "相似度:" + sparseMatrix[recommendUserId][j] / Math.sqrt(userItemLength.get(idUser.get(recommendUserId)) * userItemLength.get(idUser.get(j))));
      }
    }
    //计算指定用户recommendUser的物品推荐度
    for (let item of items) {
      //遍历每一件物品
      let users = itemUserCollection.get(item);
      //得到购买当前物品的所有用户集合
      if (!users.has(recommendUser)) {
        //如果被推荐用户没有购买当前物品，则进行推荐度计算
        let itemRecommendDegree = 0.0;
        for (let user of users) {
          itemRecommendDegree +=
            sparseMatrix[userID.get(recommendUser)][userID.get(user)] /
            Math.sqrt(userItemLength.get(recommendUser) * userItemLength.get(user));
          //推荐度计算
        }
        /*console.log("The item " + item + " for " + recommendUser + "'s recommended degree:" + itemRecommendDegree);*/
        result.push({
          name: item,
          recommend: itemRecommendDegree
        });
      }
    }
    return result
      .sort((a, b) => {
        return b.recommend - a.recommend;
      })
      .filter((item) => {
        return item.recommend > 0.0999999999999;
      });
  } catch (e) {
    return e;
  }
}
module.exports = {
  recommend
};
