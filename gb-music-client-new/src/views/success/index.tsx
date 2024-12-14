import React, { memo, ReactElement, FC, useEffect, useState } from 'react';
import { Button } from "antd";
import { useNavigate } from 'react-router-dom';
import { useAppDispatch, useAppSelector } from '@/store/hooks';
import { CheckOutlined } from '@ant-design/icons';
import { SuccessPageWrapper } from './style';
import { parseURL } from '../../utils/parseURL';
import { queryOrderAlipay } from '../../network/pay';
import { getVipMessage, joinVIP } from '../../network/vip';
import { formatTime } from '../../utils/format';

import { changeUserMsg } from '../Login/store/slice';
import { ILogin, IUserMsg } from '../../constant/store/login';

const SuccessPage: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [params, setParams] = useState<any>({});
  const [tmpParams, setTmpParams] = useState<any>({});
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const dispatch = useAppDispatch();
  useEffect(() => {
    const params = parseURL(window.location.href);
    setParams(params);
    if(params && params.out_trade_no){
      tmpParams.price = params.out_trade_no.split('_')[1];
    tmpParams.name = params.out_trade_no.split('_')[2] + '个月';
    tmpParams.expireTime =
      new Date().getTime() + parseInt(params.out_trade_no.split('_')[2]) * 60 * 60 * 24 * 30 * 1000;
    setTmpParams(tmpParams);
    queryOrderAlipay(params.out_trade_no).then((data: any) => {
      const { code } = data;
      if (code * 1 === 10000) {
        const cId = params.out_trade_no.split('_')[0];
        joinVIP(cId, tmpParams.name, params.orderId).then((data) => {
          getVipMessage().then((data: any) => {
            data.token = userMsg.token;
            //dispatch(changeUserMsg(data));
            window.localStorage.setItem('userMsg', JSON.stringify(data));
          });
        });
      }
    });
    }
  }, [dispatch, tmpParams, userMsg.token]);

  const known = () => {
    navigate('/Home/discover/recommend');
  };
  return (
    <SuccessPageWrapper>
      <div className="known">
        <Button type="primary" style={{padding:'0 30px'}} onClick={(e) => known()}>知道了</Button>
      </div>
      {Object.keys(tmpParams).length && (
        <ul className="success-msg">
          <li>
            <span>实付金额 :</span>
            <span>{params.total_amount}</span>
          </li>
          <li>
            <span>购买会员 :</span>
            <span>{tmpParams.name}</span>
          </li>
          <li>
            <span>到期时间 :</span>
            <span>{formatTime(tmpParams.expireTime, 'yyyy-MM-dd')}</span>
          </li>
        </ul>
      )}
      <p className="tip">开通成功</p>
      <div className="success-icon">
        <CheckOutlined className="already" />
      </div>
    </SuccessPageWrapper>
  );
};
export default memo(SuccessPage);
