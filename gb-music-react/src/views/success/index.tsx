import React, { memo, ReactElement, FC, useEffect, useState } from 'react';
import { Map } from 'immutable';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { CheckOutlined } from '@ant-design/icons';
import { SuccessPageWrapper } from './style';
import { parseURL } from '../../utils/parseURL';
import { queryOrderAlipay } from '../../network/pay';
import { getVipMessage, joinVIP } from '../../network/vip';
import { formatTime } from '../../utils/format';

import { changeUserMsg } from '../Login/store/actionCreators';
import { ILogin, IUserMsg } from '../../constant/store/login';

const SuccessPage: FC<RouteComponentProps> = (props): ReactElement => {
  const [params, setParams] = useState<any>({});
  const [tmpParams, setTmpParams] = useState<any>({});
  const { userMsg } = useSelector<Map<string, ILogin>, { userMsg: IUserMsg }>((state) => ({
    userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
  }));
  const dispatch = useDispatch();
  useEffect(() => {
    const params = parseURL(window.location.href);
    setParams(params);
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
            dispatch(changeUserMsg(data));
            window.localStorage.setItem('userMsg', JSON.stringify(data));
          });
        });
      }
    });
  }, [dispatch, tmpParams, userMsg.token]);

  const known = () => {
    props.history.push({
      pathname: '/Home/discover/recommend'
    });
  };
  return (
    <SuccessPageWrapper>
      <div className="known" onClick={(e) => known()}>
        知道了
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
export default withRouter(memo(SuccessPage));
