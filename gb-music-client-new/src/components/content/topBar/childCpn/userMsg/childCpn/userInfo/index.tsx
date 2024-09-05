import React, { memo, FC, ReactElement } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { useNavigate } from 'react-router-dom';
import { UserInoWrapper } from './styled';
import { useDispatch } from 'react-redux';
import { changeUserMsg,  } from '../../../../../../../views/Login/store';
import {logoutAction} from "@/views/Login/store/asyncThunk"
interface IProps {
  onClick: () => void;
}
const UserInfo: FC<IProps> = memo((props): ReactElement => {
  const { onClick } = props;
  const navigate=useNavigate();
  const dispatch = useAppDispatch();
  const logout = () => {
    dispatch(logoutAction());
    // dispatch(
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
    //);
    navigate("/Login")
  };
  const infoClick = () => {
    onClick();
  };
  const vipRouter = () => {
    navigate('/Home/member')
  };
  return (
    <UserInoWrapper>
      <div className="user-info" onClick={(e) => infoClick()}>
        <i className="iconfont icon-yonghuxinxi"> </i>
        用户信息
      </div>
      <div className="vip" onClick={(e) => vipRouter()}>
        <i className="iconfont icon-vip"> </i>
        会员信息
      </div>
      <div className="exit" onClick={(e) => logout()}>
        <i className="iconfont icon-exit"> </i>
        退出登陆
      </div>
    </UserInoWrapper>
  );
});
export default memo(UserInfo);
