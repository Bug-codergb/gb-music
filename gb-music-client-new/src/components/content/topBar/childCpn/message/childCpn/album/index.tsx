import React, { memo, FC, ReactElement } from 'react';
import { AlbumWrapper } from './style';
import { IArtist } from '../../../../../../../constant/artist';
import { IAlbum } from '../../../../../../../constant/album';
import { Empty } from 'antd';
interface IAlbums {
  artist: IArtist;
  album: IAlbum;
  id: string;
  content: string;
  createTime: string;
  updateTime: string;
  checkout: number;
}
interface IProps {
  albums: IAlbums[];
}
const Album: FC<IProps> = (props): ReactElement => {
  const { albums } = props;
  return (
    <AlbumWrapper>
      <ul className="albums">
        {albums &&
          albums.length !== 0 &&
          albums.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="symbol"> </div>
                <div className="album-right-content">
                  <div className="img-container">
                    <img src={item.artist.avatarUrl} alt="artist-name" />
                  </div>
                  <div className="right-msg">
                    <span>{item.artist.name}</span>
                    发布了专辑
                    <span>{item.album.name}</span>
                    <div className="cover">
                      <img src={item.album.coverUrl} alt="cover" />
                      <span>{item.album.description}</span>
                    </div>
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
      {albums.length === 0 && (
        <div className="empty">
          <Empty description="暂无新通知" />
        </div>
      )}
    </AlbumWrapper>
  );
};
export default memo(Album);
