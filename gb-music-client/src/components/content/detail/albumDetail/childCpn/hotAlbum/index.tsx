import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { getHotAlbum } from '../../../../../../network/album';
import { HotAlbumWrapper } from './style';
import { IAlbum } from '../../../../../../constant/album';

interface IProps {
  id: string;
  onClick: (id: string) => void;
}
interface IHotAlbum extends IAlbum {
  count: number;
}
const HotAlbum: FC<IProps> = memo((props): ReactElement => {
  const { id, onClick } = props;
  const [hotAlbum, setHotAlbum] = useState<IHotAlbum[]>([]);
  useEffect(() => {
    getHotAlbum().then((data: any) => {
      setHotAlbum(data);
    });
  }, []);
  const hotClick = (item: IHotAlbum, index: number) => {
    onClick(item.id);
  };
  return (
    <HotAlbumWrapper>
      <li>热门专辑</li>
      {hotAlbum.length !== 0 &&
        hotAlbum.map((item, index) => {
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
                </div>
              </li>
            )
          );
        })}
    </HotAlbumWrapper>
  );
});
export default HotAlbum;
