import React, { memo, FC, ReactElement } from 'react';
import { ChannelBarWrapper } from './style';
interface IProps {
  title: string;
  bar: ReactElement;
}
const ChannelBar: FC<IProps> = (props): ReactElement => {
  const { title, bar } = props;
  return (
    <ChannelBarWrapper>
      <div className="title">{title}</div>
      <div>{bar}</div>
    </ChannelBarWrapper>
  );
};
export default memo(ChannelBar);
