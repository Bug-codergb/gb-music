import React, { memo, ReactElement, FC, useEffect, useState } from 'react';
import { useNavigate,useLocation } from 'react-router-dom';
import { getOtherUserDetail, getSimpleUserInfo } from '../../../../network/user';

import { UserDetailWrapper, LeftContentWrapper, RightContentWrapper, CenterContentWrapper } from './style';
import { IUser } from '../../../../constant/user';
import { IAlbum } from '../../../../constant/album';
import { IArtist } from '../../../../constant/artist';
import { IPlaylist } from '../../../../constant/playlist';
import { IVideo } from '../../../../constant/video';
import CreatedPlaylist from './childCpn/createdPlaylist';
import CreatedChannel from './childCpn/createdChannel';
import SubPlaylist from './childCpn/subPlaylist';
import { payUser } from '../../../../network/fans';
import { useAppDispatch,useAppSelector } from "@/store/hooks"

import { changeUserDetailAction } from '../../../../views/Login/store/asyncThunk';
import { ILogin } from '../../../../constant/store/login';

interface IUserDetail extends IUser {
  subscriber: {
    album: IAlbum[];
    artist: IArtist[];
    playlist: IPlaylist[];
    video: IVideo[];
  };
  love: { songId: string }[];
  thumb: any;
  follow: { userId: string }[];
}
interface IUserSimple {
  user: IUser;
  moment: number;
  pay: number;
  fans: number;
}

const UserDetail: FC<{ userId: string }> = (props): ReactElement => {
  const navigate = useNavigate();
  const location = useLocation();
  const { userId } = location.state;
  const [usrDetail, setUserDetail] = useState<IUserDetail>();
  const [isPay, setIsPay] = useState<boolean>(false);
  const [simpleInfo, setSimpleInfo] = useState<IUserSimple>();
  const dispatch = useAppDispatch();

  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  useEffect(() => {
    getOtherUserDetail<IUserDetail>(userId).then((data) => {
      setUserDetail(data);
    });
  }, [userId]);

  useEffect(() => {
    if (userDetail.follow && userDetail.follow.length !== 0) {
      let isExists: number = userDetail.follow.findIndex((item: any, index: number) => {
        return item.userId === userId;
      });
      if (isExists !== -1) {
        setIsPay(true);
      } else {
        setIsPay(false);
      }
    }
  }, [userId, userDetail.follow]);

  useEffect(() => {
    getSimpleUserInfo<IUserSimple>(userId).then((data) => {
      setSimpleInfo(data);
    });
  }, []);
  const payUserClick = () => {
    payUser(userId).then((data: any) => {
      setIsPay(true);
      dispatch(changeUserDetailAction());
    });
  };
  return (
    <UserDetailWrapper>
      <CenterContentWrapper>
        <LeftContentWrapper>
          <div className="user-detail-header">
            <div className="left-content">
              <img src={usrDetail?.avatarUrl + '&w=180'} alt="用户头像" />
            </div>
            <div className="right-content">
              <p className="user-name">{usrDetail?.userName}</p>
              <p className="line"> </p>
              <ul className="fans">
                <li>
                  <div className="description">动态</div>
                  <div className="count">{simpleInfo ? simpleInfo.moment : 0}</div>
                </li>
                <li>
                  <div className="description">关注</div>
                  <div className="count">{simpleInfo ? simpleInfo.pay : 0}</div>
                </li>
                <li>
                  <div className="description">粉丝</div>
                  <div className="count">{ simpleInfo ? simpleInfo.fans :0}</div>
                </li>
              </ul>
              <div className="desc">
                <span>个人介绍:</span>日常琐碎
              </div>
            </div>
            {!isPay && (
              <div className="pay-attention" onClick={(e) => payUserClick()}>
                <i className="iconfont icon-jia1"> </i>
                <span>关注</span>
              </div>
            )}
            {isPay && (
              <div className="pay-attention">
                <span>已关注</span>
              </div>
            )}
          </div>
          <CreatedChannel id={usrDetail?.userId} />
          <CreatedPlaylist id={usrDetail?.userId} />
          <SubPlaylist userId={usrDetail?.userId} />
        </LeftContentWrapper>
        <RightContentWrapper></RightContentWrapper>
      </CenterContentWrapper>
    </UserDetailWrapper>
  );
};
export default memo(UserDetail);
