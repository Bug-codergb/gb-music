import React, { memo, FC, ReactElement, useState ,useEffect} from 'react';
import { Tabs } from 'antd';
import { CenterContentWrapper, MsgDetailWrapper } from './style';
import navList from '../../../../constant/message/navList';

import { useNavigate ,Outlet} from 'react-router-dom';

const MsgDetail: FC = (props): ReactElement => {
  const navigate = useNavigate()
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: { name: string; path: string }, index: number) => {
    setCurrentIndex(index);
    navigate(item.path);

  };
  const onChange = (key: string) => {
    navigate(key);
  };
  const [tabs,setTabs] = useState<any[]>([]);
  
  useEffect(()=>{
    const items = [];
    for(let item of navList){
      items.push({
        key:item.path,
        label:item.name
      })
    }
    setTabs(items);
  },[])
  return (
    <MsgDetailWrapper>
      <CenterContentWrapper>
      <Tabs defaultActiveKey="1" items={tabs} onChange={onChange} />
        <div className="msg-detail-content">
          <Outlet/>
        </div>
      </CenterContentWrapper>
    </MsgDetailWrapper>
  );
};
export default memo(MsgDetail);
