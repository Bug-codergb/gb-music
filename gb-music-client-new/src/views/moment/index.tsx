import React, { memo, FC, ReactElement, useState,useRef } from 'react';
import { MomentWrapper, LeftContent, RightContent, CenterContent } from './style';
import { Button, Modal } from 'antd';
import{PlusOutlined} from '@ant-design/icons';
import Publish from './childCpn/publish';
import CreateMoment from "./childCpn/createMoment/index"
import Moments from './childCpn/moments';
import HotMoment from './childCpn/hotMoment';
import CreateTopic from './childCpn/createTopic';
import { useAppSelector } from '@/store/hooks';
import { useNavigate } from 'react-router-dom';

const Moment: FC = memo((): ReactElement => {
  const [isShow, setIsShow] = useState<boolean>(false);
  const navigate = useNavigate();
  const [modal, contextHolder] = Modal.useModal();
  const [keyIndex, setKeyIndex] = useState<number>(0);
  const [isShowTopic, setIsShowTopic] = useState<boolean>(false);
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });

  const createMomentRef = useRef();
  const changeShow = () => {
    if(!userMsg || Object.keys(userMsg).length === 0) {
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
    createMomentRef.current && createMomentRef.current.showModal()
  };

  const publishSuccess = () => {
    setKeyIndex(keyIndex + 1);
  };
  const momentsRef = useRef();
  const changeTopicShow = () => {
    if(!userMsg || Object.keys(userMsg).length === 0) {
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
    momentsRef.current && momentsRef.current.showModal();
  };
  return (
    <MomentWrapper>
      <CenterContent>
        <LeftContent>
          <div className="moment-header">
            <h3>动态</h3>
            <div className="control-btn">
              <Button icon={ <PlusOutlined />} onClick={(e) => changeShow()} type="primary">发动态</Button>
              <CreateMoment ref={createMomentRef} onClick={() => changeShow()} publishSuccess={() => publishSuccess()} />

              <Button icon={<PlusOutlined />} onClick={(e) => changeTopicShow()} type="primary">创建话题</Button>
               <CreateTopic onClick={() => changeTopicShow()}  ref={momentsRef}/>
            </div>
          </div>
          <div className="moment-body">
            <Moments key={keyIndex}/>
          </div>
        </LeftContent>
        <RightContent>
          <HotMoment />
        </RightContent>
      </CenterContent>
      {
        contextHolder
      }
    </MomentWrapper>
  );
});
export default Moment;
