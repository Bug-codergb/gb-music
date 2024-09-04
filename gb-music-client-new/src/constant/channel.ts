import { IUser } from './user';
import { IProgram } from './program';
import { ICategory } from './category';

interface IChannel {
  id: string;
  name: string;
  coverUrl: string;
  createTime: string;
  updateTime: string;
  user: IUser;
  description?: string;
  programs?: IProgram[];
  playCount?: number;
  channel?: ICategory;
}
export type { IChannel };
