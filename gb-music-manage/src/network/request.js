import axios from 'axios';
import {
  HOST_NAME
} from "@/constant/host";

function request(config) {
  const instance = axios.create({
    baseURL: HOST_NAME,
    timeout: 5000
  });
  instance.interceptors.request.use(
    (config) => {
      return config;
    },
    (err) => {
      console.log(err);
    }
  );
  instance.interceptors.response.use(
    (res) => {
      return res.data;
    },
    (err) => {
      console.log(err);
    }
  );
  return instance(config);
}
export default request;
