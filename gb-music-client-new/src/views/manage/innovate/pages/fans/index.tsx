import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { UserOutlined } from '@ant-design/icons';
import { getUserFans } from '../../../../../network/manage/fans';
import { IUser } from '../../../../../constant/user';
import { FansWrapper } from './style';
import { useNavigate } from 'react-router-dom';
import { Empty ,Avatar,Space} from 'antd';
interface IFans {
  id: string;
  user: IUser;
  channelCount: number;
  momentCount: number;
  videoCount: number;
}
const Fans: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [fans, setFans] = useState<IFans[]>([]);
  const [count, setCount] = useState<number>(0);
  useEffect(() => {
    getUserFans(0, 30).then((data: any) => {
      setFans(data.fans);
      setCount(data.count);
    });
  }, []);
  const userRouter = (item: IFans) => {
    navigate('/Home/userDetail', {
      state: {
        userId: item.user.userId
      }
    });
  };
  return (
    <FansWrapper>
      <div className="table-box">
        <ul className="fan-list">
          {fans &&
            fans.length !== 0 &&
            fans.map((item, index) => {
              return (
                <li key={item.id}>
                  <div className="img-container" onClick={(e) => userRouter(item)}>
                    <Avatar shape="square" src={item.user?.avatarUrl} size={120} icon={<UserOutlined />} />
                  </div>
                  <div className="right-msg">
                    <div className='user-name'>{ item.user?.userName }</div>
                    <Space>
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
                    </Space>
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
      </div>
    </FansWrapper>
  );
};
export default memo(Fans);
