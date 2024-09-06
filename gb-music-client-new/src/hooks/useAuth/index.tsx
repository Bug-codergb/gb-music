import { Navigate, useLocation, useNavigate } from 'react-router-dom';
import { useAppSelector } from "@/store/hooks"
import { ILogin, IUserMsg } from '../../constant/store/login';

const useAuth = (props:any) => {
  const location = useLocation();
  const navigate = useNavigate();
  const {userMsg} = useAppSelector((state) => {
    return state['loginReducer'];
  });
  if (location.pathname !== '/Login') {
    if (!userMsg || !userMsg.token) {
      return <Navigate to={'/Login'} />;
    } else {
      return <Navigate to={props.location.pathname} />;
    }
  }
};
export default useAuth;
