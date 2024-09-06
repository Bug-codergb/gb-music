import React, { memo, FC, ReactElement } from 'react';
import { useNavigate } from 'react-router-dom';
import logo from '../../../../../assets/img/logo.png';
import { TopBarWrapper, CenterContent } from './style';
import { useAppSelector } from "@/store/hooks";
import UserMsg from '../../../../../components/common/userMsg';

const Topbar: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const { userMsg } = useAppSelector((state) => {
    return  state['loginReducer']
  });
  const homeRouter = () => {
    navigate('/Home/discover/recommend');
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
export default memo(Topbar);
