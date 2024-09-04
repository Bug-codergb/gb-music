import { Map } from 'immutable';
const defaultState = Map<number>({
  playType: 0 // 0播放歌曲 1播放电台
});
const reducer = (state = defaultState, action: any) => {
  switch (action.type) {
    case 'changePlayType':
      return state.set('playType', action.playType);
    default:
      return state;
  }
};
export default reducer;
