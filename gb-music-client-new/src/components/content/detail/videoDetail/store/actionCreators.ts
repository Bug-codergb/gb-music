import { getVideoDetail } from '../../../../../network/video';
import { IVideoDetailAction } from './type';
import { Dispatch } from 'redux';
import { IVideoStore } from '../../../../../constant/store/video';
function changeVideoDetail(res: IVideoStore): IVideoDetailAction {
  document.title = res.name + '-gb-music';
  return {
    type: 'changeVideoDetail',
    video: res
  };
}

export function changeVideoDetailAction(id: string) {
  return (dispatch: Dispatch<IVideoDetailAction>) => {
    getVideoDetail<IVideoStore>(id).then((data: IVideoStore) => {
      dispatch(changeVideoDetail(data));
    });
  };
}
