import React, { memo, FC, ReactElement, useState } from 'react';
import { ICategory } from '../../../constant/category';
import { CateListWrapper } from './style';
interface IProps {
  cateList: ICategory[];
  cateClick: (item: ICategory, index: number) => void;
}
const CateList: FC<IProps> = ({ cateList, cateClick }): ReactElement => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (item: ICategory, index: number) => {
    setCurrentIndex(index);
    cateClick(item, index);
  };
  return (
    <CateListWrapper>
      <ul className="cate-list">
        {cateList.length !== 0 &&
          cateList.map((item, index) => {
            return (
              <li
                key={item.id}
                className={currentIndex === index ? 'active' : ''}
                onClick={(e) => liClick(item, index)}
              >
                {item.name}
              </li>
            );
          })}
      </ul>
    </CateListWrapper>
  );
};
export default memo(CateList);
