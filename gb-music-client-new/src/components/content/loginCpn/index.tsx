import React, { memo, useState } from 'react';
import { useNavigate } from "react-router-dom"
import { message } from "antd"
import {
  UserOutlined,
  LockOutlined
} from '@ant-design/icons';
//样式
import { LoginCpnWrapper } from './style';
import logo from "@/assets/img/logo.png"
interface LoginType {
  btn: any;
  isShow: boolean;
  onClick: Function;
  regClick?: Function;
  isShowLogin?:boolean
}
const LoginCpn: React.FC<LoginType> = (props) => {

  const appName = import.meta.env.VITE_APP_NAME

  const navigate = useNavigate();

  const { btn, isShow, onClick, regClick ,isShowLogin} = props;
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
    if (userName.trim().length === 0) {
      message.destroy()
      message.warning("用户名不能为空")
      setIsNameCheck(true);
    } else if (password.trim().length === 0) {
      message.destroy()
      message.warning("密码不能为空")
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
  const handleLoing=()=>{
    navigate("/Login")
  }
  return (
    <LoginCpnWrapper>
      <div className="title-system-name">
        <img src={logo}/>
        <span className="title">{ appName }</span>
      </div>
      <div className="user-name">
        <UserOutlined/>
        <input type="text" placeholder="请输入用户名" autoComplete='off' onInput={(e) => userNameInp(e)} />
      </div>
      
      <div className="password">
      <LockOutlined />
        <input type="password" autoComplete='new-password' placeholder="请输入密码" onInput={(e) => passInp(e)} />
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
      {
        isShowLogin && (
          <div className="register-tip">
            <span>已有账号?</span>
            <span onClick={(e) => handleLoing()}>登陆</span>
          </div>
        )
      }
    </LoginCpnWrapper>
  );
};
export default memo(LoginCpn);
