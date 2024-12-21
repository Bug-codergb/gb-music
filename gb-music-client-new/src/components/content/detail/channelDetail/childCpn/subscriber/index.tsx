import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { UserOutlined } from '@ant-design/icons';
import { getChannelSubUser } from '../../../../../../network/channel';
import { IUser } from '../../../../../../constant/user';
import { SubWrapper } from './style';
import { useNavigate } from 'react-router-dom';
import { Pagination ,Avatar} from 'antd';
interface IProps  {
  id: string;
}
const Subscriber: FC<IProps> = (props): ReactElement => {
  const { id } = props;
  const navigate = useNavigate()
  const [users, setUsers] = useState<IUser[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    getChannelSubUser(id, 0, 8).then((data: any) => {
      setUsers(data.user);
      setCount(data.count);
    });
  }, [id]);
  const userRouter = (item: IUser) => {
    navigate('/Home/userDetail',{
      state: {
        userId: item.userId
      }
    });
  };
  const changePage = (val: number) => {
    getChannelSubUser(id, 0, 8).then((data: any) => {
      setUsers(data.user);
      setCount(data.count);
    });
  };
  return (
    <SubWrapper>
      <ul className="user-list">
        {users &&
          users.length !== 0 &&
          users.map((item, index) => {
            return (
              <li key={item.userId}>
                <div className="img-container" onClick={(e) => userRouter(item)}>
                
                  <Avatar src={item.avatarUrl} icon={<UserOutlined />}  style={{width:'80px',height:'80px'}}/>
                </div>
                <p onClick={(e) => userRouter(item)}>{item.userName}</p>
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
    </SubWrapper>
  );
};
export default memo(Subscriber);
