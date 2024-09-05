import React, { memo, FC, ReactElement, ChangeEvent, useState } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { message } from 'antd';
import { ProfileWrapper } from './style';
import { useSelector } from 'react-redux';
import { uploadAvatar } from '../../../../../../../network/user';
import { ILogin, IUserMsg } from '../../../../../../../constant/store/login';
interface IProps {
  onClick: () => void;
}
const Profile: FC<IProps> = memo((props): ReactElement => {
  const { onClick } = props;
  const [file, setFile] = useState<Blob | null>(null);
  const [isShowPrev, setIsShowPrev] = useState<boolean>(false);
  const [prevURL, setPrevURL] = useState<string>('');
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const upload = (e: ChangeEvent<HTMLInputElement>) => {
    console.log(e.currentTarget.files)
    if (e.currentTarget.files) {
      const {type} = e.currentTarget.files[0];
      if(!type.includes("image")){
        message.warning('This is a warning message');
      }else{
        setPrevURL(URL.createObjectURL(e.currentTarget.files[0]));
        setFile(e.currentTarget.files[0]);
        setIsShowPrev(true);
      }
    }
  };
  const define = () => {
    if(file){
      let formData = new FormData();
      formData.append('avatar', file);
      uploadAvatar(formData).then((data) => {
        onClick();
      });
    }
  };
  const cancel = () => {
    onClick();
  };
  return (
    <ProfileWrapper>
      <div className="title">编辑个人信息</div>
      <div className="msg">
        <div className="setting">
          <div className="user-name">
            <span>昵称:</span>
            <input type="text" />
          </div>
          <div className="password">
            <span>密码:</span>
            <input type="text" />
          </div>
        </div>
        <div className="avatar">
          {userMsg.avatarUrl && <img src={userMsg.avatarUrl} alt="avatar" />}
          {!userMsg.avatarUrl && (
            <div className="outer">
              {!isShowPrev && <input type="file" onChange={(e) => upload(e)} />}
              {!isShowPrev && <i className="iconfont icon-user1"> </i>}
              {isShowPrev && <img src={prevURL} alt="prev" />}
            </div>
          )}
        </div>
      </div>
      <div className="control-btn">
        <button onClick={(e) => define()}>确定</button>
        <button onClick={(e) => cancel()}>取消</button>
      </div>
    </ProfileWrapper>
  );
});
export default Profile;
