import React, { FC, memo, ReactElement, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {Spin, Image, Empty} from 'antd';
import { RecPlaylistWrapper } from './style';
import placeholder from '../../../../../../assets/img/holder/placeholder.png';
//组件
import MsgItem from '../../../../../../components/content/msgItem';

import { getRecPlaylist } from '../../../../../../network/playlist';
import { IPlaylist } from '../../../../../../constant/playlist';

interface IProps  {}
const RecPlaylist: FC<IProps> = (props): ReactElement => {
  const navigate = useNavigate()
  const [recPlaylist, setRecPlay] = useState<IPlaylist[] | []>();
  useEffect(() => {
    getRecPlaylist<IPlaylist[]>(0, 10).then((data) => {
      setRecPlay(data);
    });
  }, []);
  const playlistRouter = (item: IPlaylist, index: number) => {
    navigate('/Home/playlistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <Spin size={'large'} tip={'加载中...'} spinning={recPlaylist === undefined} style={{ backgroundColor: '#fef9f9' }}>
      <RecPlaylistWrapper style={{ height: recPlaylist === undefined ? '300px' : 'auto' }}>
        <ul className="rec-play-list">
          {recPlaylist &&
            recPlaylist!.length !== 0 &&
            recPlaylist!.map((item, index) => {
              return (
                <li key={item.id}>
                  <MsgItem
                    isShowPlayCount={true}
                    img={
                      <Image
                        width={145}
                        height={145}
                        src={item.coverUrl}
                        preview={false}
                        fallback={placeholder}
                        placeholder={<Image preview={false} src={placeholder} width={145} height={145} />}
                      />
                    }
                    state={<span title={item.name}>{item.name}</span>}
                    itemWidth="145px"
                    playCount={item.playCount}
                    scale={1}
                    cover={
                      <div className="mask" onClick={(e) => playlistRouter(item, index)}>
                        {' '}
                      </div>
                    }
                  />
                </li>
              );
            })}
        </ul>
        {
          recPlaylist && recPlaylist.length==0 &&<Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={"暂无热门歌单"}/>
        }
      </RecPlaylistWrapper>
    </Spin>
  );
};
export default memo(RecPlaylist);
