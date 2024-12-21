import React, { memo, FC, ReactElement, useState, useEffect } from 'react';
import { UserOutlined } from '@ant-design/icons';
import { IPlaylistSub } from '@/constant/IPlaylistSub';
import { SubscriberWrapper } from './style';
import { getAlbumSub } from '@/network/album';
import { Empty, Pagination,Avatar, } from 'antd';
import { IUser } from '@/constant/user';
import { useNavigate } from 'react-router-dom';

interface IProps  {
  id: string;
}
interface IAlbumSub extends IPlaylistSub {}
const Subscriber: FC<IProps> = memo((props): ReactElement => {
  const navigate = useNavigate()
  const { id } = props;
  const [subUser, setSubUser] = useState<IAlbumSub[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    getAlbumSub(id, 0, 8).then((data: any) => {
      setSubUser(data.user);
      setCount(data.count);
    });
  }, [id]);
  const changePage = (val: number) => {
    getAlbumSub(id, (val - 1) * 8, 8).then((data: any) => {
      setSubUser(data.user);
      setCount(data.count);
    });
  };
  const userRouter = (item: IUser) => {
    navigate('/Home/userDetail',{
      state: {
        userId: item.userId
      }
    });
  };
  return (
    <SubscriberWrapper>
      <ul className="sub-user-list">
        {subUser &&
          subUser.length !== 0 &&
          subUser.map((item, index) => {
            return (
              <li key={item.user.userId}>
                <div className="img-container" onClick={(e) => userRouter(item.user)}>
                  <Avatar src={item.user.avatarUrl} icon={<UserOutlined />}  style={{width:'80px',height:'80px'}}/>
                </div>
                <div className="user-name" onClick={(e) => userRouter(item.user)}>
                  {item.user.userName}
                </div>
              </li>
            );
          })}
      </ul>
      {count > 8 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={8}
            showTitle={false}
            showSizeChanger={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
      {count < 1 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="暂无收藏者" />
        </div>
      )}
    </SubscriberWrapper>
  );
});
export default memo(Subscriber);
