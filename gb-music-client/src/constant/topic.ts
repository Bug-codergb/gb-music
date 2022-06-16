import { IUser } from './user';

interface ITopic {
  id: string;
  name: string;
  coverUrl: string;
  description: string;
  createTime?: string;
  updateTime?: string;
  user: IUser;
}
export type { ITopic };
