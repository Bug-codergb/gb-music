import React, { memo, FC, ReactElement, useState, useEffect, useCallback } from 'react';
import { SearchDetailWrapper, CenterContent } from './style';
import { resultItem, searchResultList } from '../../../../constant/search/searchResultList';
import { RouteComponentProps } from 'react-router-dom';
import { renderRoutes } from 'react-router-config';
interface ISearchResult extends RouteComponentProps {
  route: any;
}
const SearchDetail: FC<ISearchResult> = (props): ReactElement => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const searchResultRouter = useCallback(
    (item: resultItem, index: number): void => {
      setCurrentIndex(index);
      props.history.push({
        pathname: item.path
      });
    },
    [props.history]
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
          <div className="search-content">{renderRoutes(props.route.routes)}</div>
        </div>
        <div className="right-content"></div>
      </CenterContent>
    </SearchDetailWrapper>
  );
};
export default memo(SearchDetail);
