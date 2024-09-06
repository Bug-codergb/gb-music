import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { SubscriberWrapper } from './style';
import { getPlaylistSub } from '../../../../../../network/playlist';
import { IPlaylistSub } from '../../../../../../constant/IPlaylistSub';
import { useNavigate } from 'react-router-dom';
import { Pagination } from 'antd';

interface IProps  {
  id: string;
}
const Subscriber: FC<IProps> = memo((props): ReactElement => {
  const navigate = useNavigate()
  const { id } = props;
  const [subUser, setSubUser] = useState<IPlaylistSub[]>([]);
  const [total, setTotal] = useState<number>(0);
  useEffect(() => {
    getPlaylistSub(id, 0, 8).then((data: any) => {
      setTotal(data.count);
      setSubUser(data.user);
    });
  }, [id]);
  const userRouter = (item: IPlaylistSub) => {
    navigate('/Home/userDetail',{
      state: {
        userId: item.user.userId
      }
    });
  };
  const changePage = (val: number) => {
    getPlaylistSub(id, (val - 1) * 8, 8).then((data: any) => {
      setTotal(data.count);
      setSubUser(data.user);
    });
  };
  return (
    <SubscriberWrapper>
      <ul className="user-list">
        {subUser &&
          subUser.length !== 0 &&
          subUser.map((item, index) => {
            return (
              <li key={item.user.userId}>
                <div className="img-container" onClick={(e) => userRouter(item)}>
                  <img src={item.user.avatarUrl} alt="头像" />
                </div>
                <div className="user-name" onClick={(e) => userRouter(item)}>
                  {item.user.userName}
                </div>
              </li>
            );
          })}
      </ul>
      {total > 8 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={total}
            pageSize={8}
            showTitle={false}
            showSizeChanger={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
    </SubscriberWrapper>
  );
});
export default memo(Subscriber);
