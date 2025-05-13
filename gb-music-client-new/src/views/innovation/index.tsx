import React, { memo, FC, ReactElement } from 'react';
import { Modal } from "antd"
import { ExclamationCircleOutlined } from '@ant-design/icons';
import { useNavigate } from 'react-router-dom';

import innovation from '../../assets/img/innovate/云音乐达人.svg';

import { InnovationWrapper, CenterContent } from './style';
import { useAppSelector } from '@/store/hooks';

const Innovation: FC = (props): ReactElement => {
  const [modal, contextHolder] = Modal.useModal();
  const navigate = useNavigate();
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer'];
  });
  const innovateRouter = () => {
    if(!userMsg || Object.keys(userMsg).length === 0){
      modal.confirm({
        title: '提示',
        icon: <ExclamationCircleOutlined />,
        content: '您还未登录，登录后享受更多内容，去登录？',
        okText: '登录',
        cancelText: '取消',
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      });
    }else{
      navigate('/innovate');
    }

  };
  return (
    <InnovationWrapper>
      <CenterContent>
        <div className="title">创作者中心</div>
        <ul className="choose-list">
          <li onClick={(e) => innovateRouter()}>
            <img src={innovation} alt="innovation" />
            创作人
          </li>
        </ul>
        {
          contextHolder
        }
      </CenterContent>
    </InnovationWrapper>
  );
};
export default memo(Innovation);
