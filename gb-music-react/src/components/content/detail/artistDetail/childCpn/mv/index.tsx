import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { MVWrapper } from './style';
import { getArtistMV } from '../../../../../../network/artist';
import { IVideo } from '../../../../../../constant/video';
import { IArtist } from '../../../../../../constant/artist';
import MsgItem from '../../../../msgItem';
import { Empty } from 'antd';

interface IProps extends RouteComponentProps {
  id: string;
}
interface IMV extends IVideo {
  artist: IArtist;
}
const MV: FC<IProps> = (props): ReactElement => {
  const { id } = props;
  const [mv, setMV] = useState<IMV[]>([]);
  useEffect(() => {
    getArtistMV(id).then((data: any) => {
      console.log(data);
      setMV(data);
    });
  }, [id]);
  const mvRouter = (item: IMV, index: number): void => {
    props.history.push({
      pathname: '/Home/videoDetail',
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
              <li key={item.id}>
                <MsgItem
                  isShowPlayCount={true}
                  playCount={item.playCount}
                  img={<img src={item.coverUrl} alt="" onClick={(e) => mvRouter(item, index)} />}
                  state={<span>{item.name}</span>}
                  dt={item.dt}
                  itemWidth="180px"
                  scale={0.6}
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
export default withRouter(memo(MV));
