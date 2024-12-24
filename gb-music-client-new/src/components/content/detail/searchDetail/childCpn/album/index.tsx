import React, { memo, FC, ReactElement } from 'react';
import { useAppSelector } from "@/store/hooks"
import { useNavigate } from 'react-router-dom';
import { AlbumWrapper } from './style';

import { IAlbum } from '../../../../../../constant/album';
import { formatTime } from '../../../../../../utils/format';
import { Empty } from 'antd';
import { ISearchStore } from '../../../../../../constant/store/search';
import moment from "moment";
const Album: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const { album } = useAppSelector((state) => {
    return state['searchReducer']['searchResult'];
  });
  const albumRouter = (item: IAlbum, index: number): void => {
    navigate('/Home/albumDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <AlbumWrapper>
      {album &&
        album.length !== 0 &&
        album.map((item: IAlbum, index: number) => {
          return (
            <li key={item.id}>
              <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
              <div className="img-container" onClick={(e) => albumRouter(item, index)}>
                <img src={item.coverUrl} alt={item.name} />
              </div>
              <div className="name" onClick={(e) => albumRouter(item, index)}>
                {item.name}
              </div>
              <div className="publish-time">{moment(item.publishTime).format('yyyy-MM-DD')}</div>
            </li>
          );
        })}
      {album.length === 0 && (
        <div
          style={{
            height: '350px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center'
          }}
        >
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无专辑'} />
        </div>
      )}
    </AlbumWrapper>
  );
};
export default memo(Album);
