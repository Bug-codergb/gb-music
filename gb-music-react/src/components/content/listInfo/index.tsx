import React, { FC, memo, ReactElement } from 'react';
import { ListInfoWrapper } from './style';
interface IProps {
  img: ReactElement;
  state: any;
  creator: string;
  imgWidth: string;
  onClick?: () => void;
}
const ListInfo: FC<IProps> = ({ img, state, creator, imgWidth, onClick }) => {
  const creatorClick = () => {
    if (onClick) {
      onClick();
    }
  };
  return (
    <ListInfoWrapper imgWidth={imgWidth}>
      <div className="img-container">{img}</div>
      <div className="msg">
        <div className="state">{state}</div>
        <div className="creator" onClick={(e) => creatorClick()}>
          {creator}
        </div>
      </div>
    </ListInfoWrapper>
  );
};
export default memo(ListInfo);
