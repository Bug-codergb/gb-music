import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { SimilarWrapper } from './style';
import { getSimiArtist } from '../../../../../../network/artist';
import { IArtist } from '../../../../../../constant/artist';
import { holder } from '../../../../../../utils/holder';
import { Pagination } from 'antd';
interface IProps {
  area?: string;
  onClick: (id: string) => void;
}
const Similar: FC<IProps> = memo((props): ReactElement => {
  const { area, onClick } = props;
  const [artist, setArtist] = useState<IArtist[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    if (area) {
      getSimiArtist(area, 0, 18).then((data: any) => {
        setArtist(data.artist);
        setCount(data.count);
      });
    }
  }, [area]);
  const simiClick = (item: IArtist, index: number) => {
    onClick(item.id);
  };
  const changePage = (val: number) => {
    if (area) {
      getSimiArtist(area, val - 1, 18).then((data: any) => {
        setArtist(data.artist);
        setCount(data.count);
      });
    }
  };
  return (
    <SimilarWrapper>
      <ul className="artist-list">
        {artist.length !== 0 &&
          artist.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => simiClick(item, index)}>
                  <img src={item.avatarUrl} alt="" title={item.name} />
                </div>
                <div className="artist-name text-nowrap">{item.name}</div>
              </li>
            );
          })}
        {artist &&
          holder(artist.length, 6).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {count > 18 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={18}
            showTitle={false}
            showSizeChanger={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
    </SimilarWrapper>
  );
});
export default Similar;
