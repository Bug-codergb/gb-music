import axios, { AxiosInstance, AxiosRequestConfig } from 'axios';
import { message } from "antd";
import { Navigate } from "react-router-dom"
import store from "../store/index"
import { HOST_NAME } from '../config';
import { changeUserMsg, logoutAction } from '../views/Login/store/actionCreators';

function request<T>(config: AxiosRequestConfig) {
  const instance: AxiosInstance = axios.create({
    baseURL: "/api",
    timeout: 15000
  });
  instance.interceptors.request.use(
    (config) => {
      const userMsg  =store.getState().loginReducer.userMsg
      if(userMsg){
        const headers = config.headers;
        const isOriginalAuth = headers.originalAuth === "true";
        (!isOriginalAuth) && (config.headers.Authorization =  userMsg.token)
      }
      return config;
    },
    (err) => {
      console.log(err);
      return err;
    }
  );
  instance.interceptors.response.use(
    (res) => {
      return res.data;
    },
    (err) => {
      if (err.response) {
        const { status, data } = err.response;
       
        if(status*1===400 || status*1 === 401){
          message.destroy()
          message.warning(data.message);
          throw err;
        }
        if (status * 1 === 403 && data.message === '请登录') {
          message.destroy()

          message.warning("登陆已过期");
          throw err;
          
          // @ts-ignore
          // store.dispatch(logoutAction());
          // store.dispatch(
          //   changeUserMsg({
          //     token: '',
          //     userName: '',
          //     userId: '',
          //     avatarUrl: '',
          //     createTime: '',
          //     updateTime: '',
          //     manage: -1,
          //     auth: -1
          //   })
          // );
           
        } else {
          throw err;
        }
      }
    }
  );
  return instance.request<any, T>(config);
}
export default request;
