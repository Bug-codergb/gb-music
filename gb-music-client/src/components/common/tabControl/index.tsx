import React, { memo, FC, ReactElement, useState } from 'react';
import { TabControlWrapper } from './style';
type listItem = string;
interface IProps {
  list: listItem[];
  contentName: listItem[];
  [propsName: string]: any;
}
const TabControl: FC<IProps> = ({ list, contentName, ...propsName }): ReactElement => {
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const liClick = (index: number) => {
    setCurrentIndex(index);
  };
  return (
    <TabControlWrapper>
      <ul className="list">
        {list.length !== 0 &&
          list.map((item, index) => {
            return (
              <li key={item} onClick={(e) => liClick(index)} className={currentIndex === index ? 'active' : ''}>
                <span>{item}</span>
              </li>
            );
          })}
      </ul>
      <ul>
        {list.length !== 0 &&
          list.map((item, index) => {
            return currentIndex === index && <li key={item}>{propsName[contentName[index]]}</li>;
          })}
      </ul>
    </TabControlWrapper>
  );
};
export default memo(TabControl);
