import React, { memo, FC, ReactElement } from 'react';

import Topbar from './childCpn/topbar';
import { InnovateWrapper, ContentBody } from './style';
import NavList from './childCpn/navList';
import { Outlet } from 'react-router-dom';
const Innovate: FC = (props): ReactElement => {
  return (
    <InnovateWrapper>
      <Topbar />
      <ContentBody>
        <NavList />
        <div className="content-body">
          <Outlet/>
        </div>
      </ContentBody>
    </InnovateWrapper>
  );
};
export default memo(Innovate);
