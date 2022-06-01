import { ICategory } from '../category';
import { IUser } from '../user';

interface IVideoStore {
  id: string;
  name: string;
  description: string;
  coverUrl: string;
  category: ICategory;
  playCount: number;
  type: number;
  createTime: string;
  updateTime: string;
  dt: number;
  songId?: string;
  user: { id: string; name: string; avatarUrl: string } | IUser;
}
export type { IVideoStore };
