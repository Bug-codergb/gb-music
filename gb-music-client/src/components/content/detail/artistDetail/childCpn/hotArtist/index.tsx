import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { HotArtistWrapper } from './style';
import { getHotArtist } from '../../../../../../network/artist';
import { IArtist } from '../../../../../../constant/artist';
import { RouteComponentProps, withRouter } from 'react-router-dom';

interface IProps extends RouteComponentProps {
  id: string;
  onClick: (id: string) => void;
}
interface IHotArtist {
  artist: IArtist;
  sub: number;
}
const HotArtist: FC<IProps> = (props): ReactElement => {
  const { id, onClick } = props;
  const [hotArtist, setHotArtist] = useState<IHotArtist[]>([]);
  useEffect(() => {
    getHotArtist().then((data: any) => {
      setHotArtist(data);
    });
  }, []);
  const artistClick = (item: IArtist) => {
    onClick(item.id);
  };
  return (
    <HotArtistWrapper>
      <h3>热门歌手</h3>
      <ul className="artist-list">
        {hotArtist &&
          hotArtist.length !== 0 &&
          hotArtist.map((item, index) => {
            return (
              item.artist.id !== id && (
                <li key={item.artist.id}>
                  <div className="img-container" onClick={(e) => artistClick(item.artist)}>
                    <img src={item.artist.avatarUrl} alt={item.artist.name} />
                  </div>
                  <div className="artist-name">{item.artist.name}</div>
                </li>
              )
            );
          })}
      </ul>
    </HotArtistWrapper>
  );
};
export default withRouter(memo(HotArtist));
