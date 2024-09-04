import React, { memo, FC, ReactElement } from 'react';
import { DescWrapper } from './style';
interface IProps {
  desc?: string;
}
const Desc: FC<IProps> = memo((props): ReactElement => {
  const { desc } = props;
  return <DescWrapper>{desc}</DescWrapper>;
});
export default Desc;
