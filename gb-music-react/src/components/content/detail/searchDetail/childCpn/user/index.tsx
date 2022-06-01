import React, { memo, FC, ReactElement } from 'react';
import { Empty } from 'antd';
import { useSelector } from 'react-redux';
import { Map } from 'immutable';
import { UserWrapper } from './style';
import { IUser } from '../../../../../../constant/user';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { ISearchStore } from '../../../../../../constant/store/search';

const User: FC<RouteComponentProps> = (props): ReactElement => {
  const { user } = useSelector<Map<string, ISearchStore>, ISearchStore>((state) => {
    return state.getIn(['searchReducer', 'searchResult']);
  });
  const userRouter = (item: IUser) => {
    props.history.push({
      pathname: '/Home/userDetail',
      state: {
        userId: item.userId
      }
    });
  };
  return (
    <UserWrapper>
      {user &&
        user.length !== 0 &&
        user.map((item: IUser, index: number) => {
          return (
            <li key={item.userId}>
              <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
              <div className="avatar" onClick={(e) => userRouter(item)}>
                <img src={item.avatarUrl} alt={item.userName} />
              </div>
              <div className="user-name">{item.userName}</div>
            </li>
          );
        })}
      {user.length === 0 && (
        <div
          style={{
            height: '350px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center'
          }}
        >
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无用户'} />
        </div>
      )}
    </UserWrapper>
  );
};
export default withRouter(memo(User));
