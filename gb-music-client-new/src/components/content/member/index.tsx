import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { message } from "antd";
import { useAppSelector,useAppDispatch } from "@/store/hooks"
import { MemberWrapper, CenterContent } from './style';

import { formatTime } from '../../../utils/format';
import { deleteVIPHistory, getAllCombo, getVipHistory } from '../../../network/vip';
import song from '../../../assets/img/vip/song.svg';
import download from '../../../assets/img/vip/download.svg';
import { IVIP } from '../../../constant/vip';
import { payMoney } from '../../../network/pay';
import { ILogin, IUserMsg } from '../../../constant/store/login';
import { Image } from 'antd';
import placeholder from '../../../assets/img/holder/user-placehoder.png';
import moment from "moment";
interface IVip {
  id: string;
  name: string;
  price: number;
}
const Member: FC = (): ReactElement => {
  const [combo, setCombo] = useState<IVip[]>([]);
  const [vipHistory, setHistory] = useState<IVIP[]>([]);
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const [cate, setCate] = useState<IVip>();
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const dispatch = useAppDispatch();
  useEffect(() => {
    getAllCombo().then((data: any) => {
      setCombo(data);
      liClick(combo[0], 0);
    });
  }, [combo.length]);
  useEffect(() => {
    getVipHistory().then((data: any) => {
      setHistory(data);
    });
  }, []);
  const liClick = (item: IVip, index: number) => {
    setCurrentIndex(index);
    setCate(item);
  };
  const pay = () => {
    if (cate) {
      payMoney(cate.price, cate.name, cate.id).then((data: any) => {
        // @ts-ignore
        // eslint-disable-next-line @typescript-eslint/no-unused-expressions
        window.open(data.url, '_blank').location;
      });
    }
  };
  const toPay=(item:any)=>{
    if(item.vip){
      payMoney(item.vip.price, item.vip.name, item.vip.id).then((data: any) => {
        // @ts-ignore
        // eslint-disable-next-line @typescript-eslint/no-unused-expressions
        window.open(data.url, '_blank').location;
      });
    }
  }
  const deleteHistory = (item: IVIP) => {
    deleteVIPHistory(item.id).then((data) => {
      message.success("删除成功")
      getVipHistory().then((data: any) => {
        setHistory(data);
      });
    });
  };
  return (
    <MemberWrapper>
      <CenterContent>
        {userMsg && (
          <div>
            <div className="header-msg">
              <div className="img-container">
                <Image
                  width={150}
                  height={150}
                  src={userMsg.avatarUrl}
                  preview={false}
                  placeholder={<Image preview={false} src={placeholder} width={150} height={150} />}
                />
              </div>
              <div className="right-msg">
                <p className="user-name"> {userMsg.userName}</p>
                {userMsg.vip && (
                  <p className="expireTime">
                    <span>会员有效期至:</span>
                    {moment(userMsg.vip.expireTime).format('yyyy-MM-DD')}
                  </p>
                )}
              </div>
            </div>
            <div className="body-content">
              <div className="privilege">
                <p>VIP特权</p>
                <ul className="control-btn">
                  <li>
                    <img src={song} alt="song" />
                    <p>VIP专属曲库</p>
                  </li>
                  <li>
                    <img src={download} alt="download" />
                    <p>千万歌曲免费下载</p>
                  </li>
                </ul>
              </div>
              <button onClick={(e) => pay()} className="pay">
                立即开通
              </button>
              {/*会员价格列表*/}
              <ul className="combo-list">
                {combo &&
                  combo.length !== 0 &&
                  combo.map((item, index) => {
                    return (
                      <li
                        key={item.id}
                        className={currentIndex === index ? 'active' : ''}
                        onClick={(e) => liClick(item, index)}
                      >
                        <div className="price">￥{item.price}</div>
                        <div className="name">{item.name}</div>
                      </li>
                    );
                  })}
              </ul>
              <ul className="history-vip">
                {vipHistory.length !== 0 &&
                  vipHistory.map((item, index) => {
                    return (
                      <li key={item.id}>
                        <div className="history-info">
                          <div className="vip">
                            <span>套餐类型：</span>
                            <span>{item.vip?.name}</span>
                          </div>
                          <div className="time">
                            <span>购买时间：</span>
                            <span>{moment(item.createTime).format('yyyy-MM-DD HH:mm')}</span>
                          </div>
                          <div className="order">
                            <span>订单编号：</span>
                            <span>{item.id}</span>
                          </div>
                        </div>
                        <div className="price">
                          ￥<span>{item.vip?.price}</span>
                          <span className={`status ${item.status === 1 ? 'finish' : ''}`}>
                            {item.status === 0 ? '待付款' : '已完成'}
                          </span>
                          {item.status === 0 && <span className="go-pay" onClick={()=>toPay(item)}>去付款</span>}
                          <span className="delete" onClick={(e) => deleteHistory(item)}>
                            删除
                          </span>
                        </div>
                      </li>
                    );
                  })}
              </ul>
            </div>
          </div>
        )}
      </CenterContent>
    </MemberWrapper>
  );
};
export default memo(Member);
