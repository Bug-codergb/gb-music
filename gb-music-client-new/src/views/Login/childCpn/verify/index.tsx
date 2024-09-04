import React, { memo, FC, ReactElement, useState, useEffect, useRef, forwardRef, useImperativeHandle } from 'react';
import { Slider, Spin } from 'antd';
import { VerifyWrapper } from './style';
import { IVerifyImg } from '../../../../constant/verify';
import { getAllVerifyImg } from '../../../../network/verify';
import { getRandom } from '../../../../utils/getRandom';
interface IProps {
  onClick: () => void;
  endClick: (isSuccess: boolean) => void;
}
const Verify: FC<IProps> = forwardRef((props, propsRef): ReactElement => {
  const { onClick, endClick } = props;
  const [verify, setVerify] = useState<IVerifyImg[]>([]);
  const [currentIndex, setCurrentIndex] = useState<number>(getRandom(0, 6));
  const [scale, setScale] = useState<string>('0');
  const [value, setValue] = useState<number>(6);
  const [trackColor, setTrackColor] = useState<string>('#f27a7a');
  const [handleColor, setHandleColor] = useState<string>('#f27a7a');
  const [handleBgc, setHandleBgc] = useState<string>('#ffffff');
  useEffect(() => {
    getAllVerifyImg().then((data: any) => {
      if(data){
        setVerify(data);
        setScale(data[currentIndex].scale);
      }
    });
  }, []);
  useEffect(() => {
    const slider = document.querySelector('.verify-slider');
    if (slider) {
      let handle = slider.querySelector('.ant-slider-handle');
      let i = document.createElement('i');
      i.className = 'iconfont icon-right-arrow';
      if (handle) {
        handle.append(i);
      }
    }
  }, []);
  const innerRef = useRef<HTMLImageElement>(null);
  const imgOuter = useRef<HTMLDivElement>(null);
  const sliderChange = (val: number) => {
    setValue(val);
    if (innerRef.current) {
      innerRef.current.style.left = ((val - 6) / 100) * 320 + 'px';
    }
  };
  const refresh = () => {
    setCurrentIndex(currentIndex + 1);
    if (innerRef.current) {
      innerRef.current.style.left = '0px';
    }
    setValue(6);
    setTrackColor('#f27a7a');
    setHandleColor('#f27a7a');
    setHandleBgc('#ffffff');
  };
  useEffect(() => {
    if (verify.length !== 0) {
      if (currentIndex > verify.length - 1) {
        setCurrentIndex(0);
      }
      if (verify[currentIndex]) {
        setScale(verify[currentIndex].scale);
      }
    }
  }, [currentIndex]);

  useImperativeHandle(propsRef, () => {
    return {
      reload: refresh
    };
  });
  const afterSliderChange = (val: number) => {
    if (imgOuter.current) {
      // @ts-ignore
      if (Math.abs(scale * 1 - (val - 6) / 100) <= 0.02) {
        const slider = document.querySelector('.verify-slider');
        endClick(true);
        if (slider) {
          let handle = slider.querySelector('.ant-slider-handle');
          if (handle) {
            let i = handle.querySelector('i');
            if (i) {
              i.className = 'iconfont icon-duihao';
              setTrackColor('#d2f4ef');
              setHandleColor('#52ccba');
              setHandleBgc('#52ccba');
              i.style.color = '#fff';
            }
          }
        }
      } else {
        endClick(false);
        setTrackColor('#f27a7a');
        setHandleColor('#f27a7a');
        setHandleBgc('#ffffff');
      }
    }
  };
  const cancel = () => {
    onClick();
  };
  return (
    <VerifyWrapper trackColor={trackColor} handleColor={handleColor} handleBgc={handleBgc}>
      <div className="title">
        <p>请完成验证</p>
        <div className="cancel" onClick={(e) => cancel()}>
          <i className="iconfont icon-jia1"> </i>
        </div>
      </div>
      <Spin size={'small'} tip="加载中..." spinning={!verify || verify.length === 0} style={{ position: 'relative' }}>
        <div
          className="img-outer"
          style={{
            height: !verify || verify.length === 0 || !verify[currentIndex] ? '160px' : 'auto',
            width: !verify || verify.length === 0 || !verify[currentIndex] ? '380px' : 'auto'
          }}
        >
          {verify && verify.length !== 0 && (
            <div className="img-container" ref={imgOuter}>
              <img src={verify[currentIndex] ? verify[currentIndex].outPicUrl : ''} className="outer" alt="outer" />
              <img
                src={verify[currentIndex] ? verify[currentIndex].innerPicUrl : ''}
                className="inner"
                ref={innerRef}
                alt="inner"
              />
            </div>
          )}
          <div className="refresh" onClick={(e) => refresh()}>
            <i className="iconfont icon-refresh"> </i>
          </div>
        </div>
        <div className="verify-slider">
          <Slider
            defaultValue={6}
            value={value}
            min={0}
            tooltipVisible={false}
            onChange={(value: number) => sliderChange(value)}
            onAfterChange={(value: number) => afterSliderChange(value)}
          />
        </div>
      </Spin>
    </VerifyWrapper>
  );
});
export default memo(Verify);
