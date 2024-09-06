import React, { memo, FC, ReactElement } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAppSelector } from "@/store/hooks"
import { ArtistWrapper } from './style';
import { IArtist } from '../../../../../../constant/artist';
import { Empty } from 'antd';
import { ISearchStore } from '../../../../../../constant/store/search';

const Artist: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const { artist } = useAppSelector((state) => {
    return state['searchReducer']['searchResult'];
  });
  const artistRouter = (item: IArtist, index: number): void => {
    navigate('/Home/artistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <ArtistWrapper>
      {artist &&
        artist.length !== 0 &&
        artist.map((item: IArtist, index: number) => {
          return (
            <li key={item.id}>
              <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
              <div className="img-container" onClick={(e) => artistRouter(item, index)}>
                <img src={item.avatarUrl} alt={item.name} />
              </div>
              <div className="artist-name" onClick={(e) => artistRouter(item, index)}>
                {item.name}
              </div>
            </li>
          );
        })}
      {artist.length === 0 && (
        <div
          style={{
            height: '350px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center'
          }}
        >
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无歌手'} />
        </div>
      )}
    </ArtistWrapper>
  );
};
export default memo(Artist);
