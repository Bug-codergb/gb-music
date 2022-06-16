import { login } from '@/network/login';
export default {
  loginAction(context, payload) {
    return new Promise((resolve, reject) => {
      const { userName, password, self } = payload;
      login(userName, password).then((data) => {
        if (data) {
          const { manage } = data;
          if (manage === 1) {
            context.commit({
              type: 'changeUserMsg',
              userMsg: data
            });
            context.commit({
              type: 'changeLoginType',
              loginType: 1
            });
            resolve(data);
          } else {
            self.$message({
              message: '您没有权限',
              type: 'warning'
            });
            reject(new Error('没有权限'));
          }
        }
      });
    });
  }
};
