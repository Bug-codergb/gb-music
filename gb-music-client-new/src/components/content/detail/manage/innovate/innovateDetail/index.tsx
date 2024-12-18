import React, { memo, FC, ReactElement, useEffect, useState, useRef } from 'react';
import { Tabs } from "antd";
import type { TabsProps } from 'antd';
import { useLocation } from 'react-router-dom';

import { InnovateDetailWrapper, CenterContent, LeftContent, RightContent } from './style';
import { addProgram, addProgramSource, getChannelDetail } from '../../../../../../network/channel';
import { IChannel } from '../../../../../../constant/channel';
import UserMsg from '../../../../../common/userMsg';
import TabControl from '../../../../../common/tabControl';
import Programs from './childCpn/programs/index';
import Subscriber from '../../../channelDetail/childCpn/subscriber';
import Upload from './childCpn/upload';
import NewUpload
 from './childCpn/newUpload';
import { getAudioDuration } from '../../../../../../utils/videoUtils';

const InnovateDetail: FC<{ id: string }> = (props): ReactElement => {
  const location = useLocation();
  const { id } = location.state;
  const [program, setProgram] = useState<IChannel>();
  const [isShow, setIsShow] = useState<boolean>(false);
  const search=()=>{
    getChannelDetail(id, 0, 30).then((data: any) => {
      setProgram(data);
    });
  }
  useEffect(() => {
    search();
  }, [id]);
  const newUploadRef = useRef()
  const showUpload = () => {
    
    newUploadRef.current && newUploadRef.current.showModal();
  };

  const [programIndex,setProgramIndex] = useState(0);
 
  const define = (name: string, dt: number | undefined, channel: File | undefined) => {
    
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
            search()
          });
        });
      });
    }
    setIsShow(false);
  };
  const cancel = () => {
    setIsShow(false);
  };
  const items: TabsProps['items'] = [
    {
      key: '1',
      label: '节目列表',
      children: <Programs programs={program?.programs} success={search}/>,
    },
    {
      key:"2",
      label:"收藏者",
      children:<Subscriber id={id} />
    }
  ];
  
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
          <Tabs defaultActiveKey="1" items={items} />
        </LeftContent>
        <RightContent></RightContent>
      </CenterContent>
      <NewUpload ref={newUploadRef} defineUpload={(name: string, dt: number | undefined, channel: File | undefined) =>
                    define(name, dt, channel)
                  }/>
    </InnovateDetailWrapper>
  );
};
export default memo(InnovateDetail);
