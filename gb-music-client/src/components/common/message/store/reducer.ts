import { Map } from 'immutable';
import { IMsgStore } from '../../../../constant/store/message';

const defaultState = Map<IMsgStore>({
  message: {
    isShow: false,
    resolve: () => {},
    reject: () => {}
  }
});
const reducer = (state = defaultState, action: any) => {
  switch (action.type) {
    case 'changeMsgShow':
      return state.setIn(['message', 'isShow'], action.isShow);
    case 'changeResolve':
      return state.setIn(['message', 'resolve'], action.resolve);
    case 'changeReject':
      return state.setIn(['message', 'reject'], action.reject);
    default:
      return state;
  }
};
export default reducer;
