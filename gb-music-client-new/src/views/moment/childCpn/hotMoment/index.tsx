import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { HotMomentWrapper } from './style';

import { getHotTopic } from '../../../../network/topic';
import { ITopic } from '../../../../constant/topic';
import { useNavigate } from 'react-router-dom';

const HotMoment: FC = memo((props): ReactElement => {
  const navigate= useNavigate();
  const [hotTopic, setHotTopic] = useState<ITopic[]>([]);
  useEffect(() => {
    /*  getHotMoment().then((data:any)=>{
         setHotMoment(data);
     })*/
    getHotTopic<ITopic[]>().then((data) => {
      setHotTopic(data);
    });
  }, []);

  const topicRouter = (id: string) => {
    navigate('/Home/topicDetail',{
      state: {
        id
      }
    });
  };
  return (
    <HotMomentWrapper>
      <h2>热门话题</h2>
      {hotTopic.length !== 0 &&
        hotTopic.map((item, index) => {
          return (
            <li key={item.id}>
              <div className="img-container" onClick={(e) => topicRouter(item.id)}>
                <img src={item.coverUrl} alt={item.name} />
              </div>
              <div className="msg">
                <div className="name text-nowrap">#{item.name}#</div>
                <div className="user-name">by {item.user.userName}</div>
              </div>
            </li>
          );
        })}
    </HotMomentWrapper>
  );
});
export default memo(HotMoment);
