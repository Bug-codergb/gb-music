import { Map } from 'immutable';
const defaultState = Map({
  programDetail: {},
  programURL: ''
});
const reducer = (state = defaultState, action: any) => {
  switch (action.type) {
    case 'changeProgramDetail':
      return state.set('programDetail', action.programDetail);
    case 'changeProgramURL':
      return state.set('programURL', action.programURL);
    default:
      return state;
  }
};
export default reducer;
