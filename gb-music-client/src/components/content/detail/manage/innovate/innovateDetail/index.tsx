import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router-dom';

import { InnovateDetailWrapper, CenterContent, LeftContent, RightContent } from './style';
import { addProgram, addProgramSource, getChannelDetail } from '../../../../../../network/channel';
import { IChannel } from '../../../../../../constant/channel';
import UserMsg from '../../../../../common/userMsg';
import TabControl from '../../../../../common/tabControl';
import Programs from './childCpn/programs/index';
import Subscriber from '../../../channelDetail/childCpn/subscriber';
import Upload from './childCpn/upload';
import { getAudioDuration } from '../../../../../../utils/videoUtils';

const InnovateDetail: FC<RouteComponentProps<any, any, { id: string }>> = (props): ReactElement => {
  const { id } = props.location.state;
  const [program, setProgram] = useState<IChannel>();
  const [isShow, setIsShow] = useState<boolean>(false);
  useEffect(() => {
    getChannelDetail(id, 0, 30).then((data: any) => {
      setProgram(data);
    });
  }, [id]);
  const showUpload = () => {
    setIsShow(true);
  };
  const define = (name: string, dt: number | undefined, channel: File | undefined) => {
    console.log(name, dt, channel);
    if (name.trim().length === 0) {
    } else if (!channel) {
    } else {
      addProgram(name, id).then((data: any) => {
        const { id } = data;
        getAudioDuration(channel).then((data: any) => {
          let formData: FormData = new FormData();
          formData.append('program', channel);
          formData.append('dt', data);
          addProgramSource(id, formData).then((data: any) => {
            console.log(data);
          });
        });
      });
    }
    setIsShow(false);
  };
  const cancel = () => {
    setIsShow(false);
  };
  return (
    <InnovateDetailWrapper>
      <CenterContent>
        <LeftContent>
          <div className="header">
            <div className="img-container">
              <img src={program?.coverUrl} alt={program?.name} />
            </div>
            <div className="right-msg">
              <div className="upload-channel">
                <p className="channel-name">{program?.name}</p>
                <button onClick={(e) => showUpload()}>
                  <i className="iconfont icon-jia1"> </i>
                  上传声音
                </button>
              </div>
              {program && (
                <UserMsg
                  userId={program!.user?.userId}
                  userName={program!.user?.userName}
                  avatarUrl={program!.user?.avatarUrl}
                  imgWidth="30px"
                />
              )}
              <div className="desc">
                <span>{program?.description}</span>
              </div>
            </div>
            <div className="upload-outer">
              {isShow && (
                <Upload
                  id={id}
                  defineUpload={(name: string, dt: number | undefined, channel: File | undefined) =>
                    define(name, dt, channel)
                  }
                  cancelUpload={() => cancel()}
                />
              )}
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
    </InnovateDetailWrapper>
  );
};
export default memo(InnovateDetail);
