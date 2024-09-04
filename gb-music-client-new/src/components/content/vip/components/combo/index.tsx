import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { ComboWrapper } from './style';
import { getAllCombo } from '../../../../../network/vip';
import { holder } from '../../../../../utils/holder';
import { payMoney } from '../../../../../network/pay';
interface IVip {
  id: string;
  name: string;
  price: number;
}
interface IProps {
  onClick: () => void;
}
const Combo: FC<IProps> = (props): ReactElement => {
  const { onClick } = props;
  const [comboId, setComboId] = useState<string>('');
  const [combo, setCombo] = useState<IVip[]>([]);
  const [name, setName] = useState<string>('￥16/月');
  const [currentIndex, setCurrentIndex] = useState<number>(0);

  const [cate, setCate] = useState<IVip>();
  useEffect(() => {
    getAllCombo().then((data: any) => {
      setCombo(data);
      setCate(data[0]);
      const { id } = data[0];
      setComboId(id);
    });
  }, []);
  const liClick = (item: IVip, index: number) => {
    setName(`￥${item.price}/${item.name.substring(item.name.length - 1)}`);
    setCurrentIndex(index);
    setCate(item);
    setComboId(item.id);
  };
  const exit = () => {
    onClick();
  };
  const buy = () => {
    if (cate) {
      payMoney(cate.price, cate.name, comboId).then((data: any) => {
        // @ts-ignore
        // eslint-disable-next-line @typescript-eslint/no-unused-expressions
        window.open(data.url, '_blank').location;
      });
    }
  };
  return (
    <ComboWrapper>
      <div className="title">
        <span>开通会员</span>
        <i className="iconfotn iconfont icon-jia1" onClick={(e) => exit()}>
          {' '}
        </i>
      </div>
      <div className="tip">该资源为VIP专享，开通VIP后畅想</div>
      <ul className="combo-list">
        {combo &&
          combo.length !== 0 &&
          combo.map((item, index) => {
            return (
              <li
                key={item.id}
                onClick={(e) => liClick(item, index)}
                className={`${currentIndex === index ? 'active' : ''}`}
              >
                <div className="price">
                  <span>￥</span>
                  {item.price}
                </div>
                <div className="name">{item.name}</div>
              </li>
            );
          })}
        {combo &&
          combo.length !== 0 &&
          holder(combo.length, 4).map((item, index) => {
            return <li className="holder"> </li>;
          })}
      </ul>
      <div className="now-pay" onClick={(e) => buy()}>
        <span>立即开通</span>
        {name}
      </div>
    </ComboWrapper>
  );
};
export default memo(Combo);
