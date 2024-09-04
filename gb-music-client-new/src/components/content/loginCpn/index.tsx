import React, { memo, useState } from 'react';
//样式
import { LoginCpnWrapper } from './style';
interface LoginType {
  btn: any;
  isShow: boolean;
  onClick: Function;
  regClick?: Function;
}
const LoginCpn: React.FC<LoginType> = (props) => {
  const { btn, isShow, onClick, regClick } = props;
  const [isPassCheck, setIsPassCheck] = useState(false);
  const [isNameCheck, setIsNameCheck] = useState(false);
  const [userName, setUserName] = useState('');
  const [password, setPass] = useState('');
  //用户名
  const userNameInp = (e: any) => {
    setUserName(e.target.value);
    if (e.target.value.trim().length === 0) {
      setIsNameCheck(true);
    } else {
      setIsNameCheck(false);
    }
  };
  //密码
  const passInp = (e: any) => {
    setPass(e.target.value);
    if (e.target.value.trim().length === 0) {
      setIsPassCheck(true);
    } else {
      setIsPassCheck(false);
    }
  };
  const login = () => {
    console.log(1)
    if (userName.trim().length === 0) {
      setIsNameCheck(true);
    } else if (password.trim().length === 0) {
      setIsPassCheck(true);
    } else {
      onClick(userName, password);
    }
  };
  const register = () => {
    if (regClick) {
      regClick();
    }
  };
  return (
    <LoginCpnWrapper>
      <div className="title-system-name">
        <span className="title">ln-music</span>
      </div>
      <div className="user-name">
        <span>用户名:</span>
        <input type="text" placeholder="请输入用户名" onInput={(e) => userNameInp(e)} />
      </div>
      <div className="user-name-check" style={{ opacity: isNameCheck ? 1 : 0 }}>
        用户名不能为空
      </div>
      <div className="password">
        <span>密码:</span>
        <input type="password" placeholder="请输入密码" onInput={(e) => passInp(e)} />
      </div>
      <div className="password-check" style={{ opacity: isPassCheck ? 1 : 0 }}>
        密码不能为空
      </div>
      <div className="btn" onClick={(e) => login()}>
        {btn}
      </div>
      {isShow && (
        <div className="register-tip">
          <span>还没有账号?</span>
          <span onClick={(e) => register()}>注册</span>
        </div>
      )}
    </LoginCpnWrapper>
  );
};
export default memo(LoginCpn);
