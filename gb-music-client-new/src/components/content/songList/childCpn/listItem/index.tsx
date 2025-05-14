import React, { memo, FC } from 'react';
import { ListItemWrapper } from './style';
import { message, Modal } from 'antd';
import { formatTime } from '@/utils/format';
import VipMv from '../../../../common/vip-mv';
import { useNavigate } from 'react-router-dom';
import { cancelFavorite, setUserFavorite } from '@/network/user';
import { changeUserDetailAction } from '@/views/Login/store/asyncThunk';
//import { changeShow } from '../../../../common/toast/store/actionCreators';
import { useAppDispatch,useAppSelector } from "@/store/hooks"
import { ILogin, IUserDetail } from '../../../../../constant/store/login';
import { downloadSong } from '@/network/song';

interface IProps  {
  id: string;
  index: number;
  name: string;
  createName?: string;
  alName: string;
  time: string;
  operator?: string;
  play: (id: string, name: string) => void;
  vip?: number;
  video?: { id: string; name: string };
  arId: string;
}
const ListItem: FC<IProps> = (props) => {
  const navigate = useNavigate();
  const [modal, contextHolder] = Modal.useModal();
  const { index, id, name, createName, alName, time, play, vip, video, arId } = props;
  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const dispatch = useAppDispatch();
  const playClick = (id: string, name: string) => {
    play(id, name);
  };
  const isLove = (id: string) => {
    if(!userDetail || Object.keys(userDetail).length === 0) return false;

    const isExists = userDetail.love.findIndex((item: { songId: string }, index: number) => {
      return item.songId === id;
    });
    return isExists !== -1;
  };
  const loveClick = (id: string) => {
    if(!userMsg || Object.keys(userMsg).length === 0) {
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
    if (!isLove(id)) {
      setUserFavorite(id).then((data) => {
        dispatch(changeUserDetailAction());
        //dispatch(changeShow('已添加到我喜欢的音乐', 2500));
      });
    } else {
      cancelFavorite(id).then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const videoRouter = () => {
    if (video) {
      navigate('/Home/videoDetail',{
        state: {
          id: video.id
        }
      });
    }
  };
  const artistRouter = () => {
    if (arId) {
      navigate('/Home/artistDetail',{
        state: {
          id: arId
        }
      });
    }
  };
  const handleDownload=async ()=>{
    if(!userMsg || Object.keys(userMsg).length === 0) {
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
    if(userMsg && userMsg.auth*1==0){
      message.warning("您还未开通VIP，开通后畅想")
    }else{
      //downloadSong(id,state)
      const res = await downloadSong(id,name);
      const link = document.createElement('a')
      const blob = new Blob([res])


      link.href = URL.createObjectURL(blob)
      link.setAttribute('download', `${name}.mp3`) // 自定义文件名
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)
    }
  }
  return (
    <ListItemWrapper>
      <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
      <div className="love">
        <i className="iconfont icon-download" onClick={()=>handleDownload()}> </i>
        {!isLove(id) && (
          <i className="iconfont icon-love" onClick={(e) => loveClick(id)}>
            {' '}
          </i>
        )}
        {isLove(id) && (
          <i className="iconfont icon-loveit" onClick={(e) => loveClick(id)}>
            {' '}
          </i>
        )}
      </div>
      <div className="name" onClick={(e) => playClick(id, name)}>
        <span className="text-nowrap">{name}</span>
        <VipMv
          isShowVip={vip !== undefined && vip === 1}
          isShowMv={video !== undefined && video !== null}
          onClick={() => videoRouter()}
        />
      </div>
      <div className="create-name" onClick={(e) => artistRouter()}>
        {createName}
      </div>
      <div className="al-name text-nowrap">{alName}</div>
      <div className="time">{formatTime(parseInt(time), 'mm:ss')}</div>
      {
        contextHolder
      }
    </ListItemWrapper>
  );
};
export default memo(ListItem);
