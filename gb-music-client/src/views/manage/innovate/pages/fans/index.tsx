import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { getUserFans } from '../../../../../network/manage/fans';
import { IUser } from '../../../../../constant/user';
import { FansWrapper } from './style';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Empty } from 'antd';
interface IFans {
  id: string;
  user: IUser;
  channelCount: number;
  momentCount: number;
  videoCount: number;
}
const Fans: FC<RouteComponentProps> = (props): ReactElement => {
  const [fans, setFans] = useState<IFans[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    getUserFans(0, 30).then((data: any) => {
      setFans(data.fans);
      setCount(data.count);
    });
  }, []);
  const userRouter = (item: IFans) => {
    props.history.push({
      pathname: '/Home/userDetail',
      state: {
        userId: item.user.userId
      }
    });
  };
  return (
    <FansWrapper>
      <ul className="fan-list">
        {fans &&
          fans.length !== 0 &&
          fans.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="img-container" onClick={(e) => userRouter(item)}>
                  <img src={item.user?.avatarUrl} alt={item.user?.userName} />
                </div>
                <div className="right-msg">
                  <div>
                    <p className="name">视频数</p>
                    <p className="value">{item.videoCount}</p>
                  </div>
                  <div>
                    <p className="name">动态数</p>
                    <p className="value">{item.momentCount}</p>
                  </div>
                  <div>
                    <p className="name">声音数</p>
                    <p className="value">{item.channelCount}</p>
                  </div>
                </div>
              </li>
            );
          })}
      </ul>
      {fans && fans.length === 0 && (
        <div className="fans-empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无粉丝哦'} />
        </div>
      )}
    </FansWrapper>
  );
};
export default withRouter(memo(Fans));
