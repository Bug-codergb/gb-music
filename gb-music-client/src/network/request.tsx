/*
@Name guobin
@Description gb-music
@author guobin
@date 2021/9/21
*/
import axios, { AxiosInstance, AxiosRequestConfig } from 'axios';
import { HOST_NAME } from '../config';
import store from '../store';
import { changeUserMsg, logoutAction } from '../views/Login/store/actionCreators';
import { createBrowserHistory } from 'history';
function request<T>(config: AxiosRequestConfig) {
  const instance: AxiosInstance = axios.create({
    baseURL: HOST_NAME,
    timeout: 15000
  });
  instance.interceptors.request.use(
    (config) => {
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
          store.dispatch(logoutAction());
          store.dispatch(
            changeUserMsg({
              token: '',
              userName: '',
              userId: '',
              avatarUrl: '',
              createTime: '',
              updateTime: '',
              manage: -1,
              auth: -1
            })
          );
          createBrowserHistory().push({
            pathname: '/Login'
          });
        } else {
          throw err;
        }
      }
    }
  );
  return instance.request<any, T>(config);
}
export default request;
