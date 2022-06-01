import React, { memo, FC, ReactElement } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import Topbar from './childCpn/topbar';
import { InnovateWrapper, ContentBody } from './style';
import NavList from './childCpn/navList';
import { renderRoutes } from 'react-router-config';
interface IProps extends RouteComponentProps {
  route: any;
}
const Innovate: FC<IProps> = (props): ReactElement => {
  return (
    <InnovateWrapper>
      <Topbar />
      <ContentBody>
        <NavList />
        <div className="content-body">{renderRoutes(props.route.routes)}</div>
      </ContentBody>
    </InnovateWrapper>
  );
};
export default memo(withRouter(Innovate));
