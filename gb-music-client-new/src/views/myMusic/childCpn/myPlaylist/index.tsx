import React, { memo, FC, ReactElement, useState, MouseEvent, useRef } from 'react';
import { MyPlayList } from './style';
import CreatePlayList from './childCpn/createPlayListNew/index';
import UserPlaylist from './childCpn/userPlaylist';
//网络请求
import { createPlayList, uploadPlayCover } from '@/network/playlist';
import { publishMessage } from '@/network/message';
import { useAppSelector } from '@/store/hooks';
import { Modal } from 'antd';
import { useNavigate } from 'react-router-dom';

const MyPlaylist: FC = (): ReactElement => {
  const [isShow, setIsShow] = useState<boolean>(false);
  const [keyId, setKeyId] = useState<number>(0);
  const navigate = useNavigate();
  const [modal, contextHolder] = Modal.useModal();
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const define = (name: string, desc: string, file: File | null): void => {
    createPlayList(name, desc).then((data: any) => {
      const { id } = data;
      let formData = new FormData();
      formData.append('cover', file);
      uploadPlayCover(formData, id).then((data) => {
        setKeyId(keyId + 1);
      });
      publishMessage('/playlist', '创建了', 'pId', id);
    });
    setIsShow(false);
  };
  const cancel = (): void => {
    setIsShow(false);
  };

  const creayePlaylistRef = useRef();
  //创建歌单
  const createPlaylist = () => {
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
    creayePlaylistRef.current && creayePlaylistRef.current.showModal();
  };
  return (
    <MyPlayList>
      <div className="create-playlist" onClick={(e: MouseEvent<HTMLSpanElement>) => createPlaylist()}>
        <span>新建歌单</span>
        <i className="iconfont icon-jia1"> </i>
      </div>
      <CreatePlayList
        ref={creayePlaylistRef}
        onClick={(name: string, desc: string, file: File | null) => define(name, desc, file)}
      />
      {/*用户歌单列表*/}
      <UserPlaylist key={keyId} />
      {
        contextHolder
      }
    </MyPlayList>
  );
};
export default memo(MyPlaylist);
