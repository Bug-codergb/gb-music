import React, { memo, FC, useState, useEffect } from 'react';
import { useNavigate,useLocation } from 'react-router-dom';
import { CheckOutlined } from '@ant-design/icons';
import { CenterContent, ChannelDetailWrapper, LeftContent, RightContent } from './style';
import { getChannelDetail } from '../../../../network/channel';
import { IChannel } from '../../../../constant/channel';
import UserMsg from '../../../common/userMsg';
import TabControl from '../../../common/tabControl';
import Programs from './childCpn/programs';
import Subscriber from './childCpn/subscriber';
import { cancelSub, sub } from '../../../../network/subscriber';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"
import { changeUserDetailAction } from '../../../../views/Login/store/asyncThunk';

const ChannelDetail: FC<{ id: string }> = (props) => {
  const location = useLocation();
  const navigate = useNavigate();
  const id = location.state.id;
  const [program, setProgram] = useState<IChannel>();
  const { userDetail } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const dispatch = useAppDispatch();
  useEffect(() => {
    getChannelDetail(id, 0, 30).then((data: any) => {
      if (data.id) {
        setProgram(data);
      }
    });
  }, [id]);
  const isSub = (): boolean => {
    let flag = -1;
    if (userDetail.subscriber && userDetail.subscriber.channel) {
      flag = userDetail.subscriber.channel.findIndex((item: { id: string; name: string }, index: number) => {
        if (item) return item.id === id;
      });
    }
    return flag !== -1;
  };
  //收藏频道
  const subChannel = (): void => {
    if (!isSub()) {
      sub(id, 'cId').then((data: any) => {
        dispatch(changeUserDetailAction());
      });
    } else if (isSub()) {
      cancelSub(id, 'cId').then((data: any) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const userRouter = (id: string) => {
    if (id) {
      navigate('/Home/userDetail',{
        state: {
          userId: id
        }
      });
    }
  };
  return (
    <ChannelDetailWrapper>
      {program && (
        <CenterContent>
          <LeftContent>
            <div className="header">
              <div className="img-container">
                <img src={program?.coverUrl} alt={program?.name} />
              </div>
              <div className="right-msg">
                <p className="channel-name">{program?.name}</p>
                <button className={`sub ${isSub() ? 'active' : ''}`} onClick={(e) => subChannel()}>
                  {!isSub() && <i className="iconfont icon-xinjianshoucangjia"> </i>}
                  {isSub() && <CheckOutlined className="already" />}
                  {!isSub() && <span>收藏</span>}
                  {isSub() && <span>已收藏</span>}
                </button>
                {program && (
                  <UserMsg
                    userId={program!.user.userId}
                    userName={program!.user.userName}
                    avatarUrl={program!.user.avatarUrl}
                    onClick={(id) => userRouter(id)}
                    imgWidth="30px"
                  />
                )}
                <div className="desc">
                  <span>{program?.description}</span>
                </div>
              </div>
            </div>
            <TabControl
              list={['节目列表', '收藏者']}
              contentName={['programs', 'sub']}
              programs={<Programs programs={program?.programs} />}
              sub={<Subscriber id={id} />}
            />
          </LeftContent>
          <RightContent></RightContent>
        </CenterContent>
      )}
    </ChannelDetailWrapper>
  );
};
export default memo(ChannelDetail);
