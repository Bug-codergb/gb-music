import React, { memo, FC, ReactElement, useState } from 'react';
import { CenterContentWrapper, MsgDetailWrapper } from './style';
import navList from '../../../../constant/message/navList';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { renderRoutes } from 'react-router-config';
interface IMsgDetail extends RouteComponentProps {
  route: any;
}
const MsgDetail: FC<IMsgDetail> = (props): ReactElement => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: { name: string; path: string }, index: number) => {
    setCurrentIndex(index);
    props.history.push({
      pathname: item.path
    });
  };
  return (
    <MsgDetailWrapper>
      <CenterContentWrapper>
        <ul className="msg-nav-list">
          {navList.map((item, index) => {
            return (
              <li
                key={item.name}
                onClick={(e) => liClick(item, index)}
                className={currentIndex === index ? 'active' : ''}
              >
                {item.name}
              </li>
            );
          })}
        </ul>
        <div className="msg-detail-content">{renderRoutes(props.route.routes)}</div>
      </CenterContentWrapper>
    </MsgDetailWrapper>
  );
};
export default withRouter(memo(MsgDetail));
