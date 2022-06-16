import { getProgramDetail, getProgramURL } from '../../../../../../../network/channel';
import { changeSongURL, changeSongDetail } from '../../../../../playCoin/store/actionCreators';
import { changePlayType } from '../../../../../../../store/playType/actionCreators';

function changeProgramDetail(res: any) {
  return {
    type: 'changeProgramDetail',
    programDetail: res
  };
}
function changeProgramURL(res: any) {
  return {
    type: 'changeProgramURL',
    programURL: res
  };
}
export function changeProgramDetailAction(id: string) {
  return (dispatch: any) => {
    getProgramDetail(id).then((data: any) => {
      dispatch(changeProgramDetail(data));
      dispatch(changeSongDetail(data));
      dispatch(changePlayType(1));
    });
    getProgramURL(id).then((data: any) => {
      dispatch(changeProgramURL(data.url));
      dispatch(changeSongURL(data.url));
    });
  };
}
