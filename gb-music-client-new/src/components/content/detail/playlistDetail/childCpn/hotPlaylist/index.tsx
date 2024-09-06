import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { HotPlaylistWrapper } from './style';
import { getHotPlaylist } from '../../../../../../network/playlist';
import { IPlaylist } from '../../../../../../constant/playlist';

interface IHotPlaylist extends IPlaylist {
  count: number;
}
interface IProps {
  id: string;
  onClick: (id: string) => void;
}
const HotPlaylist: FC<IProps> = memo((props): ReactElement => {
  const { id, onClick } = props;
  const [hotPlaylist, setHotPlaylist] = useState<IHotPlaylist[]>([]);
  useEffect(() => {
    getHotPlaylist().then((data: any) => {
      setHotPlaylist(data);
    });
  }, []);
  const hotClick = (item: IHotPlaylist, index: number) => {
    onClick(item.id);
  };
  return (
    <HotPlaylistWrapper>
      {hotPlaylist.length !== 0 &&
        hotPlaylist.map((item, index) => {
          return (
            item.id !== id && (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => hotClick(item, index)}>
                  <img src={item.coverUrl} alt={item.name} />
                </div>
                <div className="msg">
                  <div className="name text-nowrap" onClick={(e) => hotClick(item, index)}>
                    {item.name}
                  </div>
                  <div className="user-name">by {item.user!.userName}</div>
                </div>
              </li>
            )
          );
        })}
    </HotPlaylistWrapper>
  );
});
export default memo(HotPlaylist);
