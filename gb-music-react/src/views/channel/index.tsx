import React, { memo, FC, ReactElement, useState, useEffect } from 'react';
import { CenterContent, ChannelWrapper } from './style';
import Nav from './childCpn/nav';
import Toplist from './childCpn/toplist';
import HotChannelContent from './childCpn/hotChannelContent';

const Channel: FC = (): ReactElement => {
  const [id, setId] = useState<string>('');
  const [isShow, setIsShow] = useState<boolean>(true);
  const navClick = (item: { id: string; name: string }, index: number) => {
    setId(item.id);
    setIsShow(true);
  };
  useEffect(() => {
    setIsShow(false);
  }, []);
  return (
    <ChannelWrapper>
      <CenterContent>
        {
          <Nav
            navClick={(item: { id: string; name: string }, index: number) => {
              navClick(item, index);
            }}
          />
        }
        {isShow && <Toplist id={id} />}
        {!isShow && <HotChannelContent />}
      </CenterContent>
    </ChannelWrapper>
  );
};
export default memo(Channel);
