import React, { FC, memo, ReactElement, useEffect, useState } from 'react';
import { ArtistWrapper } from './style';
import { IArtist } from '../../../../../../constant/artist';
import { useNavigate } from 'react-router-dom';
import { getUserSub } from '../../../../../../network/user';
import MsgItem from '../../../../../../components/content/msgItem';
import { holder } from '../../../../../../utils/holder';
import { Empty } from 'antd';

const Artist: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [artist, setArtist] = useState<IArtist[]>([]);
  useEffect(() => {
    getUserSub('artist', 0, 30).then((data: any) => {
      setArtist(data);
    });
  }, []);
  const artistRouter = (item: IArtist) => {
    navigate('/Home/artistDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <ArtistWrapper>
      <ul className="sub-artist">
        {artist &&
          artist.length !== 0 &&
          artist.map((item, index) => {
            return (
              <li key={item.id}>
                <MsgItem
                  img={<img src={item.avatarUrl} alt={item.name} onClick={(e) => artistRouter(item)} />}
                  state={<span className="artist-name">{item.name}</span>}
                  itemWidth="150px"
                  isShowPlayCount={false}
                  scale={1}
                />
              </li>
            );
          })}
        {artist &&
          holder(artist.length, 7).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {artist && artist.length === 0 && (
        <div className="empty-tip">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="您还未收藏歌手" />
        </div>
      )}
    </ArtistWrapper>
  );
};
export default memo(Artist);
