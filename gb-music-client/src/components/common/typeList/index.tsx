import React, { memo, FC, ReactElement, useState } from 'react';
import { TypeListWrapper } from './style';
interface IProps {
  types: string[];
  letterClick: (item: string, index: number) => void;
}
const TypeList: FC<IProps> = (props): ReactElement => {
  const { types, letterClick } = props;
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: string, index: number) => {
    setCurrentIndex(index);
    letterClick(item, index);
  };
  return (
    <TypeListWrapper>
      <ul className="types">
        {types.map((item, index) => {
          return (
            <li key={item} className={currentIndex === index ? 'active' : ''} onClick={(e) => liClick(item, index)}>
              {item}
            </li>
          );
        })}
      </ul>
    </TypeListWrapper>
  );
};
export default memo(TypeList);
