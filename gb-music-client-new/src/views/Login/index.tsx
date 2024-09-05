import React, { memo, useState, useRef, ReactElement } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { CSSTransition } from 'react-transition-group';
import { useNavigate } from 'react-router-dom';

//组件
import LoginCpn from '../../components/content/loginCpn';
import Verify from './childCpn/verify';
//样式
import { LoginWrapper } from './style';
//action
import { loginAsyncThunk } from './store/asyncThunk';
import Bgc from './childCpn/bgc';

const Login: React.FC = (props) => {
  const dispatch = useAppDispatch();
  const navigate = useNavigate();
  const [isShow, setIsShow] = useState<boolean>(false);
  const [userName, setName] = useState<string>('');
  const [password, setPass] = useState<string>('');
  const verifyRef = useRef<any>();
  const login = (userName: string, password: string) => {
    setName(userName);
    setPass(password);
    endClick(true)
    //setIsShow(true);
  };
  const endClick = (isSuccess: boolean) => {
    if (isSuccess) {
      setTimeout(() => {
        try {
          dispatch(loginAsyncThunk({userName, password, navigate}));
          setIsShow(false);
        } catch (e) {
          console.log(e);
        }
      }, 400);
    } else {
      verifyRef.current?.reload();
    }
  };
  const register = () => {
    navigate("/Register")
  };
  const cancel = () => {
    setIsShow(false);
  };
  return (
    <LoginWrapper>
      <Bgc />
      <div className="mask"> </div>
      <div className="login-outer">
        <LoginCpn
          btn={<button className="login-btn">登录</button>}
          isShow={true}
          onClick={(userName: string, password: string) => login(userName, password)}
          regClick={(e: any) => register()}
        />
      </div>
      {
        <CSSTransition in={isShow} classNames="verify" unmountOnExit={true} timeout={1000}>
          <Verify
            onClick={() => cancel()}
            endClick={(isSuccess) => endClick(isSuccess)}
            // @ts-ignore
            ref={verifyRef}
          />
        </CSSTransition>
      }
    </LoginWrapper>
  );
};
export default memo(Login);
