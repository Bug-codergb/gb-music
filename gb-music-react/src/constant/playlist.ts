import { IUser } from './user';

interface IPlaylist {
  id: string;
  name: string;
  playCount: number;
  coverUrl: string;
  description: string;
  createTime: string;
  updateTime: string;
  user?: IUser;
  count?: number;
}
export type { IPlaylist };
