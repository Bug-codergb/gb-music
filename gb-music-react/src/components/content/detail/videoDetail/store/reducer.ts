import { Map } from 'immutable';
import { IVideoStore } from '../../../../../constant/store/video';
import { IVideoDetailAction } from './type';
const defaultState = Map<IVideoStore>({
  video: {
    id: '',
    name: '',
    description: '',
    coverUrl: '',
    category: { id: '', name: '' },
    playCount: 0,
    type: 0,
    createTime: '',
    updateTime: '',
    dt: 0,
    songId: '',
    user: { id: '', name: '', avatarUrl: '' }
  }
});
const reducer = (state = defaultState, action: IVideoDetailAction) => {
  switch (action.type) {
    case 'changeVideoDetail':
      return state.setIn(['video'], action.video);
    default:
      return state;
  }
};
export default reducer;
