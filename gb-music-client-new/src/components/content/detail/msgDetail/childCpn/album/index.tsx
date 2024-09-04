import React, { memo, FC, ReactElement, useState, useEffect } from 'react';
import { Empty } from 'antd';
import { AlbumWrapper } from './style';
import { IAlbum } from '../../../../../../constant/album';
import { IArtist } from '../../../../../../constant/artist';
import { deleteMsg, getAlbumMsg, readSingleMsg } from '../../../../../../network/message';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Pagination } from 'antd';
import { changeMsgAction } from '../../../../../common/message/store/actionCreators';
import { changeShow } from '../../../../../common/toast/store/actionCreators';
import { useDispatch } from 'react-redux';
interface IAlbumMsg {
  id: string;
  content: string;
  checkout: number;
  album: IAlbum;
  artist: IArtist;
  createTime: string;
  updateTime: string;
}
const Album: FC<RouteComponentProps> = (props): ReactElement => {
  const [count, setCount] = useState<number>(0);
  const [albumMsg, setAlbumMsg] = useState<IAlbumMsg[]>([]);
  const dispatch = useDispatch();
  useEffect(() => {
    getAlbumMsg<{ count: number; message: IAlbumMsg[] }>('0', '5').then((data) => {
      setCount(data.count);
      setAlbumMsg(data.message);
    });
  }, []);
  const albumRouter = (item: IAlbumMsg) => {
    readSingleMsg(item.id).then((data) => {
      props.history.push({
        pathname: '/Home/albumDetail',
        state: {
          id: item.album.id
        }
      });
    });
  };
  const changePage = (val: number) => {
    getAlbumMsg<{ count: number; message: IAlbumMsg[] }>(`${(val - 1) * 5}`, '5').then((data) => {
      setCount(data.count);
      setAlbumMsg(data.message);
    });
  };
  const deleteMessage = (item: IAlbumMsg) => {
    // @ts-ignore
    dispatch(changeMsgAction(true)).then((data) => {
      if (data) {
        deleteMsg(item.id).then((data) => {
          dispatch(changeShow('删除成功', 1500));
          getAlbumMsg(`0`, '5').then((data: any) => {
            setCount(data.count);
            setAlbumMsg(data.message);
          });
        });
      }
    });
  };
  const artistRouter = (item: IArtist) => {
    props.history.push({
      pathname: '/Home/artistDetail',
      state: {
        id: item.id
      }
    });
  };
  return (
    <AlbumWrapper>
      <ul className="video-msg-list">
        {albumMsg &&
          albumMsg.length !== 0 &&
          albumMsg.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="video-msg-content">
                  <div className="left-content">
                    <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                    {item.checkout === 0 && <div className="is-read"> </div>}
                    <div className="img-container" onClick={(e) => artistRouter(item.artist)}>
                      <img src={item.artist.avatarUrl} alt={item.artist.name} />
                    </div>
                  </div>
                  <div className="right-content">
                    <div className="video-msg-info">
                      <div className="user-name" onClick={(e) => artistRouter(item.artist)}>
                        {item.artist.name}
                      </div>
                      <div className="operator">{item.content}</div>
                      <div className="video-name">{item.album.name}</div>
                    </div>
                    <div className="video-cover-desc">
                      <div className="video-cover" onClick={(e) => albumRouter(item)}>
                        <img src={item.album.coverUrl} alt={item.album.name} />
                      </div>
                      <div className="album-desc">{item.album.description}</div>
                    </div>
                  </div>
                </div>
                <div className="delete-msg" onClick={(e) => deleteMessage(item)}>
                  <i className="iconfont icon-huishouzhan"> </i>
                </div>
              </li>
            );
          })}
      </ul>
      {count > 5 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={5}
            showTitle={false}
            showSizeChanger={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
      {count === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无通知'} />
        </div>
      )}
    </AlbumWrapper>
  );
};
export default withRouter(memo(Album));
