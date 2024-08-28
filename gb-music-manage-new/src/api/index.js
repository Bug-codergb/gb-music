import axios from "axios";
import { ResultEnum } from "@/enum/httpEnum.js";
import { ElMessage } from "element-plus";
import router from "@/router";
import { LOGIN_URL } from "@/config/index.js";
import { checkStatus } from "./helper/checkStatus";
const config = {
  // 默认地址请求地址，可在 .env.** 文件中修改
  baseURL: import.meta.env.VITE_API_URL,
  // 设置超时时间
  timeout: ResultEnum.TIMEOUT,
  // 跨域时候允许携带凭证
  withCredentials: true
};
class RequestHttp {
  constructor(config) {
    this.service = axios.create(config);
    this.service.interceptors.request.use(
      config => {
        return config;
      },
      err => {
        return Promise.reject(err);
      }
    );
    this.service.interceptors.response.use(
      response => {
        const { data, config } = response;
        // 登录失效
        if (data.code == ResultEnum.OVERDUE) {
          router.replace(LOGIN_URL);
          ElMessage.error(data.msg);
          return Promise.reject(data);
        }
        // 全局错误信息拦截（防止下载文件的时候返回数据流，没有 code 直接报错）
        if (data.code && data.code !== ResultEnum.SUCCESS) {
          ElMessage.error(data.msg);
          return Promise.reject(data);
        }
        // 成功请求（在页面上除非特殊情况，否则不用处理失败逻辑）
        return data;
      },
      async error => {
        const { response } = error;
        // 请求超时 && 网络错误单独判断，没有 response
        if (error.message.indexOf("timeout") !== -1) ElMessage.error("请求超时！请您稍后重试");
        if (error.message.indexOf("Network Error") !== -1) ElMessage.error("网络错误！请您稍后重试");
        // 根据服务器响应的错误状态码，做不同的处理
        if (response) checkStatus(response.status);
        // 服务器结果都没有返回(可能服务器错误可能客户端断网)，断网处理:可以跳转到断网页面
        if (!window.navigator.onLine) router.replace("/500");
        return Promise.reject(error);
      }
    );
  }
  get(url, params, _object = {}) {
    return this.service.get(url, { params, ..._object });
  }
  post(url, params, _object = {}) {
    return this.service.post(url, params, _object);
  }
  put(url, params, _object = {}) {
    return this.service.put(url, params, _object);
  }
  delete(url, params, _object = {}) {
    return this.service.delete(url, { params, ..._object });
  }
  download(url, params, _object = {}) {
    return this.service.post(url, params, { ..._object, responseType: "blob" });
  }
}
export default new RequestHttp(config);
