import React, { memo, FC, ReactElement, useState, useEffect } from 'react';
import { Map } from 'immutable';
import { CSSTransition } from 'react-transition-group';
import { ToastWrapper } from './style';
import { useDispatch, useSelector } from 'react-redux';
import { changeShow } from './store/actionCreators';
import { IToastStore } from '../../../constant/store/toastStore';
const Toast: FC = memo((): ReactElement => {
  const [isShow, setIsShow] = useState<boolean>(false);

  const dispatch = useDispatch();
  const showMsg = useSelector<Map<string, IToastStore>, IToastStore>((state) => {
    return state.getIn(['toastReducer', 'showMsg']);
  });
  const { message, dt } = showMsg;
  useEffect(() => {
    setIsShow(true);
    setTimeout(() => {
      setIsShow(false);
      dispatch(changeShow('', 0));
    }, dt);
  }, [dispatch, dt, message]);
  return (
    <ToastWrapper>
      {message && (
        <CSSTransition in={isShow} unmountOnExit={true} timeout={1500} classNames="toast">
          <div className="container">{message}</div>
        </CSSTransition>
      )}
    </ToastWrapper>
  );
});
export default Toast;
