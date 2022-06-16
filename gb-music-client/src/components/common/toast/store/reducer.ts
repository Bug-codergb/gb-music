import { Map } from 'immutable';
import { IToastStore } from '../../../../constant/store/toastStore';
const defaultState = Map<IToastStore>({
  showMsg: {
    message: '',
    dt: 1000
  }
});
const reducer = (state = defaultState, action: any) => {
  switch (action.type) {
    case 'changeShow':
      return state.set('showMsg', action.showMsg);
    default:
      return state;
  }
};
export default reducer;
