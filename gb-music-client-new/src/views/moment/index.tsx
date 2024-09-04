import React, { memo, FC, ReactElement, useState } from 'react';
import { MomentWrapper, LeftContent, RightContent, CenterContent } from './style';
import Publish from './childCpn/publish';
import Moments from './childCpn/moments';
import HotMoment from './childCpn/hotMoment';
import CreateTopic from './childCpn/createTopic';
const Moment: FC = memo((): ReactElement => {
  const [isShow, setIsShow] = useState<boolean>(false);
  const [keyIndex, setKeyIndex] = useState<number>(0);
  const [isShowTopic, setIsShowTopic] = useState<boolean>(false);
  const changeShow = () => {
    setIsShow(!isShow);
  };
  const changeTopicShow = () => {
    setIsShowTopic(!isShowTopic);
  };
  const publishSuccess = () => {
    setKeyIndex(keyIndex + 1);
  };
  return (
    <MomentWrapper>
      <CenterContent>
        <LeftContent>
          <div className="moment-header">
            <h3>动态</h3>
            <div className="control-btn">
              <button onClick={(e) => changeShow()}>
                <i className="iconfont icon-jia1"> </i>
                发动态
              </button>
              {isShow && <Publish onClick={() => changeShow()} publishSuccess={() => publishSuccess()} />}
              <button onClick={(e) => changeTopicShow()}>
                <i className="iconfont icon-jia1"> </i>
                创建话题
              </button>
              {isShowTopic && <CreateTopic onClick={() => changeTopicShow()} />}
            </div>
          </div>
          <div className="moment-body">
            <Moments key={keyIndex} />
          </div>
        </LeftContent>
        <RightContent>
          <HotMoment />
        </RightContent>
      </CenterContent>
    </MomentWrapper>
  );
});
export default Moment;
