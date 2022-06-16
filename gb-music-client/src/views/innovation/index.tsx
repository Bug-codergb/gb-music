import React, { memo, FC, ReactElement } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import innovation from '../../assets/img/innovate/云音乐达人.svg';

import { InnovationWrapper, CenterContent } from './style';

const Innovation: FC<RouteComponentProps> = (props): ReactElement => {
  const innovateRouter = () => {
    props.history.push({
      pathname: '/innovate'
    });
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
      </CenterContent>
    </InnovationWrapper>
  );
};
export default memo(withRouter(Innovation));
