import { Map } from 'immutable';
import { RouteComponentProps } from 'react-router-dom';

import { useSelector } from 'react-redux';
import { ILogin, IUserMsg } from '../../constant/store/login';
import { Redirect } from 'react-router';

const useAuth = (props: RouteComponentProps) => {
  const userMsg = useSelector<Map<string, ILogin>, IUserMsg>((state) => {
    return state.getIn(['loginReducer', 'login', 'userMsg']);
  });
  if (props.location.pathname !== '/Login') {
    if (!userMsg || !userMsg.token) {
      return <Redirect to={'/Login'} />;
    } else {
      return <Redirect to={props.location.pathname} />;
    }
  }
};
export default useAuth;
