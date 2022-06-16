import React, { FC, memo, ReactElement } from 'react';
import { FooterWrapper } from './style';
const Footer: FC = (): ReactElement => {
  return <FooterWrapper>&copy;gb-music</FooterWrapper>;
};
export default memo(Footer);
