import React, { memo, FC, ReactElement } from 'react';
import { Map } from 'immutable';
import { MessageWrapper } from './style';
import { useDispatch, useSelector } from 'react-redux';
import { changeMsgAction } from './store/actionCreators';
import { IMsgStore } from '../../../constant/store/message';

const Message: FC = memo((): ReactElement => {
  const dispatch = useDispatch();
  const { isShow } = useSelector<Map<string, IMsgStore>, IMsgStore>((state) => {
    return state.getIn(['messageReducer', 'message']);
  });
  const { resolve } = useSelector<Map<string, IMsgStore>, IMsgStore>((state) => {
    return state.getIn(['messageReducer', 'message']);
  });
  const define = () => {
    dispatch(changeMsgAction(false));
    resolve(true);
  };
  const cancel = () => {
    dispatch(changeMsgAction(false));
    resolve(false);
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
