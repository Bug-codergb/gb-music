import React, { memo, FC, ReactElement, useState, MouseEvent } from 'react';
import { MyPlayList } from './style';
import CreatePlayList from './childCpn/createPlayList/index';
import UserPlaylist from './childCpn/userPlaylist';
//网络请求
import { createPlayList, uploadPlayCover } from '../../../../network/playlist';
import { publishMessage } from '../../../../network/message';

const MyPlaylist: FC = (): ReactElement => {
  const [isShow, setIsShow] = useState<boolean>(false);
  const [keyId, setKeyId] = useState<number>(0);
  const define = (name: string, desc: string, file: File): void => {
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
  //创建歌单
  const createPlaylist = () => {
    setIsShow(true);
  };
  return (
    <MyPlayList>
      <div className="create-playlist" onClick={(e: MouseEvent<HTMLSpanElement>) => createPlaylist()}>
        <span>新建歌单</span>
        <i className="iconfont icon-jia1"> </i>
      </div>
      {isShow && (
        <CreatePlayList
          onClick={(name: string, desc: string, f: File) => define(name, desc, f)}
          cancelClick={(e: MouseEvent) => cancel()}
        />
      )}
      {/*用户歌单列表*/}
      <UserPlaylist key={keyId} />
    </MyPlayList>
  );
};
export default memo(MyPlaylist);
