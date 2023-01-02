import React, { memo, ReactElement, FC, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { getMvToplist } from '../../../../../../network/video/mv';

import { IVideo } from '../../../../../../constant/video';
import { ICategory } from '../../../../../../constant/category';

import { ToplistWrapper } from './style';
import CateTitle from '../../../../../../components/common/cateTitle';
import { getVideoCate } from '../../../../../../network/video';
import { IArtist } from '../../../../../../constant/artist';

const Toplist: FC<RouteComponentProps> = (props): ReactElement => {
  const [mv, setMV] = useState<IVideo[]>([]);
  const [cate, setCate] = useState<ICategory[]>([]);
  useEffect(() => {
    getVideoCate<ICategory[]>(1).then((data) => {
      setCate(data);
      if(data.length!==0){
        getMvToplist<IVideo[]>(data[0].id, 0, 10).then((data) => {
          setMV(data);
        });
      }
    });
  }, []);
  const cateClick = (item: ICategory, index: number) => {
    getMvToplist<IVideo[]>(item.id, 0, 10).then((data) => {
      setMV(data);
    });
  };
  const playMV = (item: IVideo, index: number) => {
    props.history.push({
      pathname: '/Home/videoDetail',
      state: {
        id: item.id
      }
    });
  };
  const artistRouter = (item: IArtist | undefined) => {
    if (item) {
      props.history.push({
        pathname: '/Home/artistDetail',
        state: {
          id: item.id
        }
      });
    }
  };
  return (
    <ToplistWrapper>
      <CateTitle
        title={'MV排行榜'}
        list={cate}
        cateClick={(item: ICategory, index: number) => cateClick(item, index)}
      />
      <ul className="top-mv-list">
        {mv &&
          mv.length !== 0 &&
          mv.map((item: IVideo, index: number) => {
            return (
              <li key={item.id}>
                <div className="left-content">
                  <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                  <div className="img-container" onClick={(e) => playMV(item, index)}>
                    <img src={item.coverUrl} alt={item.name} />
                  </div>
                </div>
                <div className="right-content">
                  <div className="mv-name">{item.name}</div>
                  <div className="artist-name" onClick={(e) => artistRouter(item.song?.artist)}>
                    {item.song!.artist.name}
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
    </ToplistWrapper>
  );
};
export default memo(withRouter(Toplist));
