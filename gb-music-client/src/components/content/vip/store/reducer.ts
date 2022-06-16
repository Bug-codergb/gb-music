import { Map } from 'immutable';
const defaultState = Map<boolean>({
  isShow: false
});
const reducer = (state = defaultState, action: any) => {
  switch (action.type) {
    case 'changeIsShow':
      return state.set('isShow', action.isShow);
    default:
      return state;
  }
};
export default reducer;
