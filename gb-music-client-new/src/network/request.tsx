import axios, { AxiosInstance, AxiosRequestConfig } from 'axios';
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
        config.headers.Authorization =  userMsg.token
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
        if (status * 1 === 403 && data.message === '请登录') {
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
