import { IUserDetail, IUserMsg } from '../../../constant/store/login';

interface ILoginUserAction {
  userMsg?: IUserMsg;
  loginType?: number;
  userDetail?: IUserDetail;
  type: string;
}
export type { ILoginUserAction };
