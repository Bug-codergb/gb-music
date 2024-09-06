import { message } from 'antd';
import { login } from '../../../network/login';
import { useNavigate } from 'react-router-dom';
import { getUserDetail, updateUserExpire } from '../../../network/user';
//import { changeShow } from '../../../components/common/toast/store/actionCreators';
import { ILoginUserAction } from './type';
import { IUserDetail, IUserMsg } from '../../../constant/store/login';

export function changeUserMsg(res: IUserMsg): ILoginUserAction {
  return {
    type: 'changeUserMsg',
    userMsg: res
  };
}
function changeLoginType(res: number): ILoginUserAction {
  return {
    type: 'changeLoginType',
    loginType: res
  };
}
function changeUserDetail(res: IUserDetail): ILoginUserAction {
  return {
    type: 'changeUserDetail',
    userDetail: res
  };
}
function deleteUserDetail(): ILoginUserAction {
  return {
    type: 'changeUserDetail',
    userDetail: {
      userId: '',
      userName: '',
      avatarUrl: '',
      subscriber: [],
      thumb: [],
      follow: [{ userId: '' }],
      love: [{ songId: '' }]
    }
  };
}
export function changeUserDetailAction() {
  return (dispatch: any) => {
    getUserDetail().then((data: any) => {
      const { love, follow } = data;
      if (!love) {
        data.love = [];
      }
      if (!follow) {
        data.follow = [];
      }
      window.localStorage.setItem('userDetail', JSON.stringify(data));
      dispatch(changeUserDetail(data));
    });
  };
}

export function loginAction(userName: string, password: string, props: RouteComponentProps) {
  return async (dispatch: any) => {
    try {
      const data: any = await login(userName, password);
      if (data) {
        const { token } = data;
        const res: any = await updateUserExpire(token);
        if (res.code * 1 === 200) {
          dispatch(changeShow('您的VIP已经过期，开通VIP后畅想', 3500));
          data.auth = 0;
          delete data.vip;
        }
        await dispatch(changeUserMsg(data));
        await dispatch(changeLoginType(1));
        window.localStorage.setItem('userMsg', JSON.stringify(data));
        window.localStorage.setItem('loginType', '1');
        await dispatch(changeUserDetailAction());
        props.history.push({
          pathname: '/Home'
        });
      }
    } catch (e) {
      console.log(e);
      message.warning({
        content: '用户名或者密码错误',
        style: {
          fontSize: '20px',
          marginTop: '5vh'
        }
      });
    }
  };
}
//退出登录
export function logoutAction() {
  return (dispatch: any) => {
    window.localStorage.clear();
    dispatch(changeLoginType(0));
    dispatch(
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
    dispatch(deleteUserDetail());
  };
}
