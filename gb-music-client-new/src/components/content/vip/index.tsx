import React, { FC, memo, ReactElement, useState } from 'react';
import { VipOuterWrapper } from './style';
import song from '../../../assets/img/vip/song.svg';
import download from '../../../assets/img/vip/download.svg';
import { useDispatch } from 'react-redux';
import { changeIsShowAction } from './store/actionCreators';
import Combo from './components/combo';

const VipOuter: FC = (): ReactElement => {
  const dispatch = useDispatch();
  const [isShow, setIsShow] = useState<boolean>(false);
  const changeShow = () => {
    dispatch(changeIsShowAction(false));
  };
  const changePayShow = () => {
    setIsShow(false);
  };
  return (
    <VipOuterWrapper>
      <div className="top-bar">
        <i className="iconfont icon-jia1" onClick={(e) => changeShow()}>
          {' '}
        </i>
      </div>
      <div className="body-content">
        <p>VIP专项，开通VIP畅听无阻</p>
        <p>VIP尊享</p>
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
        <div className="pay" onClick={() => setIsShow(true)}>
          立即开通
        </div>
      </div>
      {isShow && <Combo onClick={() => changePayShow()} />}
    </VipOuterWrapper>
  );
};
export default memo(VipOuter);
