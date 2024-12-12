import React, { memo, FC, ReactElement, useState, useEffect, useCallback } from 'react';
import { Tabs } from 'antd';
import { SearchDetailWrapper, CenterContent } from './style';
import { resultItem, searchResultList } from '../../../../constant/search/searchResultList';
import { useNavigate,Outlet } from 'react-router-dom';

const SearchDetail: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const searchResultRouter = useCallback(
    (item: string, index?: number): void => {
      navigate(item)
    },
    []
  );
  useEffect(() => {
    searchResultRouter(searchResultList[0].path, 0);
  }, [searchResultRouter]);

  const onChange=(key:string)=>{
    searchResultRouter(key)
  }
  const [tabs,setTabs] = useState<any[]>([]);
  useEffect(()=>{
    let items=[];
    for(let item of searchResultList){
      items.push({
        key:item.path,
        label:item.name
      })
    }
    setTabs(items);
  },[])
  
  return (
    <SearchDetailWrapper>
      <CenterContent>
        <div className="left-content">
        <Tabs defaultActiveKey="1" items={tabs} onChange={onChange} />
          <div className="search-content">
            <Outlet/>
          </div>
        </div>
        <div className="right-content"></div>
      </CenterContent>
    </SearchDetailWrapper>
  );
};
export default memo(SearchDetail);
