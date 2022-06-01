import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useSelector } from 'react-redux';
import { RouteComponentProps } from 'react-router-dom';
import { Map } from 'immutable';
import { InnovateConWrapper } from './style';

import { getUserChannel } from '../../../../../../network/channel';

import { IChannel } from '../../../../../../constant/channel';
import { ICategory } from '../../../../../../constant/category';
import { formatTime } from '../../../../../../utils/format';
import Upload from './childCpn/upload';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';
interface IPrograms extends IChannel {
  channel: ICategory;
}
const InnovateCon: FC<RouteComponentProps<any, any, { id: string }>> = (props): ReactElement => {
  const { id } = props.location.state;
  const [program, setProgram] = useState<IPrograms[]>([]);
  const [isShow, setIsShow] = useState<boolean>(false);
  const { userMsg } = useSelector<Map<string, ILogin>, { userMsg: IUserMsg }>((state) => ({
    userMsg: state.getIn(['loginReducer', 'login', 'userMsg'])
  }));
  useEffect(() => {
    getUserChannel(userMsg.userId, id, 0, 30).then((data: any) => {
      setProgram(data);
      console.log(data);
    });
  }, [id, userMsg.userId]);
  const addBtn = () => {
    setIsShow(true);
  };
  const define = () => {
    setIsShow(false);
  };
  const cancel = () => {
    setIsShow(false);
  };
  const innovateRouter = (item: IPrograms, index: number) => {
    console.log(item);
    props.history.push({
      pathname: '/innovate/detail',
      state: {
        id: item.id
      }
    });
  };
  return (
    <InnovateConWrapper>
      <div className="control-btn">
        <button onClick={(e) => addBtn()}>
          <i className="iconfont icon-jia1"> </i>
          <span>添加内容</span>
        </button>
      </div>
      <Upload isShowP={isShow} defined={() => define()} canceled={() => cancel()} id={id} />
      <ul className="program-list">
        {program.length !== 0 &&
          program.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                <div className="img-container" onClick={(e) => innovateRouter(item, index)}>
                  <img src={item.coverUrl} alt={item.name} />
                </div>
                <div className="name text-nowrap" onClick={(e) => innovateRouter(item, index)}>
                  {item.name}
                </div>
                <div className="cate">
                  <span>频道:</span>
                  {item.channel.name}
                </div>
                <div className="create-time">
                  创建于:
                  {formatTime(item.createTime, 'yyyy-MM-dd')}
                </div>
                <button className="del-btn">删除</button>
              </li>
            );
          })}
      </ul>
    </InnovateConWrapper>
  );
};
export default memo(InnovateCon);
