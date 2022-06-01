import React, { FC, memo, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Spin, Image } from 'antd';
import { RecPlaylistWrapper } from './style';
import placeholder from '../../../../../../assets/img/holder/placeholder.png';
//组件
import MsgItem from '../../../../../../components/content/msgItem';

import { getRecPlaylist } from '../../../../../../network/playlist';
import { IPlaylist } from '../../../../../../constant/playlist';

interface IProps extends RouteComponentProps {}
const RecPlaylist: FC<IProps> = (props): ReactElement => {
  const [recPlaylist, setRecPlay] = useState<IPlaylist[] | []>();
  useEffect(() => {
    getRecPlaylist<IPlaylist[]>(0, 10).then((data) => {
      setRecPlay(data);
    });
  }, []);
  const playlistRouter = (item: IPlaylist, index: number) => {
    props.history.push({
      pathname: '/Home/playlistDetail',
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
      </RecPlaylistWrapper>
    </Spin>
  );
};
export default withRouter(memo(RecPlaylist));
