export function getFlatMenuList(menuList) {
  let newMenuList = JSON.parse(JSON.stringify(menuList));
  return newMenuList.flatMap(item => [item, ...(item.children ? getFlatMenuList(item.children) : [])]);
}
export const getAllBreadcrumbList = (menuList, parent = [], result = {}) => {
  for (const item of menuList) {
    result[item.path] = [...parent, item];
    if (item.children) getAllBreadcrumbList(item.children, result[item.path], result);
  }
  return result;
};

export function getShowMenuList(menuList) {
  let newMenuList = JSON.parse(JSON.stringify(menuList));
  return newMenuList.filter(item => {
    item.children && item.children.length && (item.children = getShowMenuList(item.children));
    return (!item.meta.isHide);
  });
}