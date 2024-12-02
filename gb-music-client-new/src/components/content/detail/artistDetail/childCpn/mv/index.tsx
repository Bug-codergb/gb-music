import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { MVWrapper } from './style';
import { getArtistMV } from '@/network/artist';
import { IVideo } from '@/constant/video';
import { IArtist } from '@/constant/artist';
import MsgItem from '../../../../msgItem';
import { Empty } from 'antd';

interface IProps {
  id: string;
}
interface IMV extends IVideo {
  artist: IArtist;
}
const MV: FC<IProps> = (props): ReactElement => {
  const navigate = useNavigate()
  const { id } = props;
  const [mv, setMV] = useState<IMV[]>([]);
  useEffect(() => {
    getArtistMV(id).then((data: any) => {
      console.log(data);
      setMV(data);
    });
  }, [id]);
  const mvRouter = (item: IMV, index: number): void => {
    navigate('/Home/videoDetail',{
      state: {
        id: item.id
      }
    });
  };
  return (
    <MVWrapper>
      <ul className="artist-mv-list">
        {mv &&
          mv.length !== 0 &&
          mv.map((item, index) => {
            return (
              <li key={item.id} style={{margin:'0 0 10px 0'}}>
                <MsgItem
                  isShowPlayCount={true}
                  playCount={item.playCount}
                  img={<img src={item.coverUrl} alt="" onClick={(e) => mvRouter(item, index)} />}
                  state={<span>{item.name}</span>}
                  dt={item.dt}
                  itemWidth="190px"
                  scale={0.56}
                />
              </li>
            );
          })}
      </ul>
      {mv && mv.length === 0 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="MV空空如也" />
        </div>
      )}
    </MVWrapper>
  );
};
export default memo(MV);
