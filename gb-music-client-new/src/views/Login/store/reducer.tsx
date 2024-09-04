import { ILogin } from '../../../constant/store/login';
import { ILoginUserAction } from './type';

const defaultState = Map<ILogin>({
  login: {
    userMsg: JSON.parse(window.localStorage.getItem('userMsg') as string),
    loginType: JSON.parse(window.localStorage.getItem('loginType') as string),
    userDetail:
      window.localStorage.getItem('userDetail') === 'undefined'
        ? {}
        : JSON.parse(window.localStorage.getItem('userDetail') as string)
  }
});
const reducer = (state = defaultState, action: ILoginUserAction) => {
  switch (action.type) {
    case 'changeUserMsg':
      return state.setIn(['login', 'userMsg'], action.userMsg);
    case 'changeLoginType':
      return state.setIn(['login', 'loginType'], action.loginType);
    case 'changeUserDetail':
      return state.setIn(['login', 'userDetail'], action.userDetail);
    default:
      return state;
  }
};

export default reducer;
