import { IUser } from './user';

interface IToplist {
  id: string;
  name: string;
  coverUrl: string;
  description?: string;
  playCount: number;
  createTime?: string;
  updateTime?: string;
  type?: number;
  user?: IUser;
}
export type { IToplist };
