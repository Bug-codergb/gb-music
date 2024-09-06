import React, { memo, FC, ReactElement } from 'react';
import { MessageWrapper } from './style';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { IMsgStore } from '../../../constant/store/message';

const Message: FC = memo((): ReactElement => {
  const dispatch = useAppDispatch();
  const { isShow } = useAppSelector(state => {
    return state['messageReducer'];
  });
  const { resolve } = useAppSelector((state) => {
    return state['messageReducer'];
  });
  const define = () => {
    //dispatch(changeMsgAction(false));
    resolve && resolve(true);
  };
  const cancel = () => {
    //dispatch(changeMsgAction(false));
    resolve && resolve(false);
  };
  return (
    <MessageWrapper>
      {isShow && (
        <div className="outer">
          <p>您确定要删除吗?</p>
          <div className="control-btn">
            <button onClick={(e) => define()}>确定</button>
            <button onClick={(e) => cancel()}>取消</button>
          </div>
        </div>
      )}
    </MessageWrapper>
  );
});
export default Message;
