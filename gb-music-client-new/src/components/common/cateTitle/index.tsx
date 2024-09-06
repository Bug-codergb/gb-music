import React, { memo, FC, ReactElement, useState } from 'react';
import { CateTitleWrapper } from './style';
import { ICategory } from '@/constant/category';

interface IProps {
  title: string;
  list: ICategory[];
  cateClick: (item: ICategory, index: number) => void;
}
const CateTitle: FC<IProps> = ({ title, list, cateClick }): ReactElement => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: ICategory, index: number): void => {
    setCurrentIndex(index);
    cateClick(item, index);
  };
  return (
    <CateTitleWrapper>
      <div className="title">{title}</div>
      <ul className="list">
        {list.length !== 0 &&
          list.map((item, index) => {
            return (
              <li
                key={item.id}
                onClick={(e) => liClick(item, index)}
                className={currentIndex === index ? 'active' : ''}
              >
                {item.name}
              </li>
            );
          })}
      </ul>
    </CateTitleWrapper>
  );
};
export default memo(CateTitle);
