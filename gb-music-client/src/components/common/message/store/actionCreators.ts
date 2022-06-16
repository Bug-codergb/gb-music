export function changeMsgShow(isShow: boolean) {
  return {
    type: 'changeMsgShow',
    isShow
  };
}
export function changeMsgAction(isShow: boolean) {
  return (dispatch: any) => {
    dispatch(changeMsgShow(isShow));
    return new Promise((resolve, reject) => {
      dispatch(changeResolve(resolve));
      dispatch(changeReject(reject));
    });
  };
}

function changeResolve(res: any) {
  return {
    type: 'changeResolve',
    resolve: res
  };
}
function changeReject(rej: any) {
  return {
    type: 'changeReject',
    reject: rej
  };
}
