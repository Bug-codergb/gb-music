import React, { memo } from 'react';
import { useNavigate } from 'react-router-dom';
import LoginCpn from '../../components/content/loginCpn';
import { RegisterWrapper } from './style';
import { register } from '../../network/login';
import Bgc from './childCpn/bgc';
const Register: React.FC = (props) => {
  const navigate = useNavigate();
  const registerHandle = (userName: string, password: string) => {
    register(userName, password).then((data) => {
      if (data) {
        navigate('/Login');
      }
    });
  };
  return (
    <RegisterWrapper>
      <Bgc />
      <div className="register">
        <LoginCpn
          isShow={false}
          isShowLogin={true}
          onClick={(userName: string, password: string) => registerHandle(userName, password)}
          btn={<button className="reg-btn">注册</button>}
        />
      </div>
    </RegisterWrapper>
  );
};
export default memo(Register);
