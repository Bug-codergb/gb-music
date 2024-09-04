import { IUser } from '../user';

type VIP = { id: string; expireTime: string; name: string; price: number };
interface IUserMsg {
  token: string;
  userName: string;
  userId: string;
  avatarUrl: string;
  createTime: string;
  updateTime: string;
  manage: number;
  auth: number;
  vip?: VIP;
}
interface IUserDetail extends IUser {
  subscriber: any;
  love: { songId: string }[];
  thumb: any;
  follow: { userId: string }[];
}
interface ILogin {
  userMsg: IUserMsg;
  userDetail: IUserDetail;
  loginType: number;
}
export type { ILogin, IUserDetail, IUserMsg };
