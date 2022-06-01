/*
@Name guo'bin
@Description gb-music
@author guo'bin
@date 2021/10/22
*/
import React, { memo, ReactElement, FC, MouseEvent } from 'react';
import { VipMvWrapper } from './style';
import { RouteComponentProps, withRouter } from 'react-router-dom';
interface IProps extends RouteComponentProps {
  isShowVip: boolean;
  isShowMv: boolean;
  onClick: () => void;
}
const VipMv: FC<IProps> = (props): ReactElement => {
  const { isShowMv, isShowVip, onClick } = props;
  const videoClick = (e: MouseEvent<HTMLLIElement>) => {
    e.stopPropagation();
    onClick();
  };
  return (
    <VipMvWrapper>
      <ul className="vip-mv">
        {isShowVip && (
          <li className="vip" onClick={(e) => e.stopPropagation()}>
            VIP
          </li>
        )}
        {isShowMv && (
          <li className="mv" onClick={(e) => videoClick(e)}>
            MV
          </li>
        )}
      </ul>
    </VipMvWrapper>
  );
};
export default withRouter(memo(VipMv));
