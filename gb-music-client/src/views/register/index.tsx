import React, { memo } from 'react';
import { RouteComponentProps } from 'react-router-dom';
import LoginCpn from '../../components/content/loginCpn';
import { RegisterWrapper } from './style';
import { register } from '../../network/login';
import Bgc from './childCpn/bgc';
const Register: React.FC<RouteComponentProps> = (props) => {
  const registerHandle = (userName: string, password: string) => {
    register(userName, password).then((data) => {
      if (data) {
        props.history.push({
          pathname: '/Login'
        });
      }
    });
  };
  return (
    <RegisterWrapper>
      <Bgc />
      <div className="register">
        <LoginCpn
          isShow={false}
          onClick={(userName: string, password: string) => registerHandle(userName, password)}
          btn={<button className="reg-btn">注册</button>}
        />
      </div>
    </RegisterWrapper>
  );
};
export default memo(Register);
