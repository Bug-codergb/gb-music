import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import {message,Button } from "antd"
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"
import { useNavigate,useLocation } from 'react-router-dom';

import { InnovateConWrapper } from './style';

import { getUserChannel ,deleteChannel} from '../../../../../../network/channel';

import { IChannel } from '../../../../../../constant/channel';
import { ICategory } from '../../../../../../constant/category';
import { formatTime } from '../../../../../../utils/format';
import Upload from './childCpn/upload';
import { ILogin, IUserMsg } from '../../../../../../constant/store/login';

interface IPrograms extends IChannel {
  channel: ICategory;
}
const InnovateCon: FC<{ id: string }> = (props): ReactElement => {
  const location = useLocation();
  const navigate = useNavigate();
  const { id } = location.state;
  const [program, setProgram] = useState<IPrograms[]>([]);
  const [isShow, setIsShow] = useState<boolean>(false);
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer']
  });
  const search=()=>{
    getUserChannel(userMsg.userId, id, 0, 3000).then((data: any) => {
      setProgram(data);
      console.log(data);
    });
  }
  useEffect(() => {
    search()
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
    navigate('/innovate/detail',{
      state: {
        id: item.id
      }
    });
  };
  const handleDelete=async (item:IPrograms)=>{
    console.log(item);
    const res = await deleteChannel(item.id);
    message.success("删除成功");
    search();
  }
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
                <Button type="primary" size="small" onClick={()=>handleDelete(item)}>删除</Button>
                
              </li>
            );
          })}
      </ul>
    </InnovateConWrapper>
  );
};
export default memo(InnovateCon);
