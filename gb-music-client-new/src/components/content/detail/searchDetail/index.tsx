import React, { memo, FC, ReactElement, useState, useEffect, useCallback } from 'react';
import { SearchDetailWrapper, CenterContent } from './style';
import { resultItem, searchResultList } from '../../../../constant/search/searchResultList';
import { useNavigate,Outlet } from 'react-router-dom';

const SearchDetail: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const searchResultRouter = useCallback(
    (item: resultItem, index: number): void => {
      setCurrentIndex(index);
      navigate(item.path)

    },
    []
  );
  useEffect(() => {
    searchResultRouter(searchResultList[0], 0);
  }, [searchResultRouter]);
  return (
    <SearchDetailWrapper>
      <CenterContent>
        <div className="left-content">
          <ul className="search-result-list">
            {searchResultList.map((item, index) => {
              return (
                <li
                  key={item.name}
                  onClick={(e) => searchResultRouter(item, index)}
                  className={currentIndex === index ? 'active' : ''}
                >
                  {item.name}
                </li>
              );
            })}
          </ul>
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
