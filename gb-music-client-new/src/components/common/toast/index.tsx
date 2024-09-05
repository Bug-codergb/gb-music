import React, { memo, FC, ReactElement, useState, useEffect } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { CSSTransition } from 'react-transition-group';
import { ToastWrapper } from './style';
import { useDispatch, useSelector } from 'react-redux';
import { changeShow } from './store/actionCreators';
import { IToastStore } from '../../../constant/store/toastStore';
const Toast: FC = memo((): ReactElement => {
  const [isShow, setIsShow] = useState<boolean>(false);

  const dispatch = useAppDispatch();
  const showMsg = useAppSelector((state) => {
    return state['toastReducer'];
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
