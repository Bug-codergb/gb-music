import React, { memo, FC, ReactElement } from 'react';
import { Image } from 'antd';
import { IUser } from '@/constant/user';
import { UserMsgWrapper } from './style';
import placeholder from '../../../assets/img/holder/user-placehoder.png';

interface IProps extends IUser {
  imgWidth: string;
  onClick?: (id: string) => void;
  userId: string;
  userName: string;
  avatarUrl: string;
}
const UserMsg: FC<IProps> = (props): ReactElement => {
  const { userId, avatarUrl, userName, imgWidth, onClick } = props;
  const userClick = (id: string): void => {
    onClick && onClick(id);
  };
  return (
    <UserMsgWrapper imgWidth={imgWidth}>
      <div
        className="avatar"
        onClick={(e) => {
          userClick(userId);
        }}
      >
        <Image
          width={imgWidth}
          height={imgWidth}
          src={avatarUrl}
          preview={false}
          placeholder={<Image preview={false} src={placeholder} width={imgWidth} height={imgWidth} />}
        />
      </div>
      <div
        className="user-name"
        onClick={(e) => {
          userClick(userId);
        }}
      >
        {userName}
      </div>
    </UserMsgWrapper>
  );
};
export default memo(UserMsg);
