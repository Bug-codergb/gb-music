export default {
  changeUserMsg(state, payload) {
    state.userMsg = payload.userMsg;
    window.sessionStorage.setItem('userMsg', JSON.stringify(payload.userMsg));
  },
  changeLoginType(state, payload) {
    state.loginType = payload.loginType;
    window.sessionStorage.setItem('loginType', JSON.stringify(payload.loginType));
  }
};
