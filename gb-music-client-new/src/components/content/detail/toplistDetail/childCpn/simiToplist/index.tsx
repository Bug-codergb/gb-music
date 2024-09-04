import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { SimiToplistWrapper } from './style';
import { getSimiToplist } from '../../../../../../network/toplist/toplist';
import { IToplist } from '../../../../../../constant/toplist';
interface IProps {
  id: string;
  onClick: (id: string,name:string) => void;
}
const SimiToplist: FC<IProps> = (props): ReactElement => {
  const { id, onClick } = props;
  const [simiToplist, setSimiToplist] = useState<IToplist[]>([]);
  useEffect(() => {
    getSimiToplist().then((data: any) => {
      setSimiToplist(data);
    });
  }, []);
  const toplistClick = (item: IToplist) => {
    onClick(item.id,item.name);
  };
  return (
    <SimiToplistWrapper>
      <h3>其它榜单</h3>
      <ul className="simi-toplist">
        {simiToplist.length !== 0 &&
          simiToplist.map((item, index) => {
            return (
              item.id !== id && (
                <li key={item.id}>
                  <div className="img-container" onClick={(e) => toplistClick(item)}>
                    <img src={item.coverUrl} alt={item.name} />
                  </div>
                  <div className="name">{item.name}</div>
                </li>
              )
            );
          })}
      </ul>
    </SimiToplistWrapper>
  );
};
export default memo(SimiToplist);
