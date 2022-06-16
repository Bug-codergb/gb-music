import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { Empty, Pagination } from 'antd';
import { AlbumWrapper } from './style';
import { IAlbum } from '../../../../../../constant/album';
import { formatTime } from '../../../../../../utils/format';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { getUserSub } from '../../../../../../network/user';

const Album: FC<RouteComponentProps> = (props): ReactElement => {
  const [album, setAlbum] = useState<IAlbum[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    getUserSub('album', 0, 10).then((data: any) => {
      setAlbum(data.album);
      setCount(data.count);
    });
  }, []);
  const albumRouter = (item: IAlbum) => {
    props.history.push({
      pathname: '/Home/albumDetail',
      state: {
        id: item.id
      }
    });
  };
  const changePage = (val: number) => {
    getUserSub('album', (val - 1) * 10, 10).then((data: any) => {
      setAlbum(data.album);
      setCount(data.count);
    });
  };
  return (
    <AlbumWrapper>
      <ul className="sub-albums">
        {album &&
          album.length !== 0 &&
          album.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                <div className="img-container" onClick={(e) => albumRouter(item)}>
                  <img src={item.coverUrl} alt="" />
                </div>
                <div className="name" onClick={(e) => albumRouter(item)}>
                  {item.name}
                </div>
                <div className="publish-time">{formatTime(parseInt(item.publishTime), 'yyyy-MM-dd')}</div>
              </li>
            );
          })}
      </ul>
      {count > 10 && (
        <div className="page">
          <Pagination defaultCurrent={1} total={count} pageSize={10} onChange={(val) => changePage(val)} />
        </div>
      )}
      {album && album.length === 0 && (
        <div className="empty-tip">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="您还未收藏专辑" />
        </div>
      )}
    </AlbumWrapper>
  );
};
export default withRouter(memo(Album));
