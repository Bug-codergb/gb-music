import { IUser } from './user';
interface IComment {
  id: string;
  content: string;
  createTime: string;
  updateTime?: string;
  user: IUser;
  reply?: IComment[];
}
export type { IComment };
