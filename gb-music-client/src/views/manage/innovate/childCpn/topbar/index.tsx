import React, { memo, FC, ReactElement } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import logo from '../../../../../assets/img/logo.png';
import { TopBarWrapper, CenterContent } from './style';
import { useSelector } from 'react-redux';
import UserMsg from '../../../../../components/common/userMsg';

const Topbar: FC<RouteComponentProps> = (props): ReactElement => {
  const { userMsg } = useSelector((state) => ({
    // @ts-ignore
    userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
  }));
  const homeRouter = () => {
    props.history.push({
      pathname: '/Home/discover/recommend'
    });
  };
  return (
    <TopBarWrapper>
      <CenterContent>
        <div className="logo">
          <img src={logo} alt="gb-music" onClick={(e) => homeRouter()} />
          <span className="title">gb-music</span>
          <span className="tip">创作者中心</span>
        </div>
        <div className="right-msg">
          <div className="message">
            <i className="iconfont icon-pinglun1"> </i>
          </div>
          <div className="user-msg">
            <UserMsg
              userId={userMsg.userId}
              userName={userMsg.userName}
              avatarUrl={userMsg.avatarUrl}
              imgWidth="30px"
            />
          </div>
        </div>
      </CenterContent>
    </TopBarWrapper>
  );
};
export default memo(withRouter(Topbar));
