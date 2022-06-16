import { IUser } from './user';
import { ISong } from './song';
import { IArtist } from './artist';

interface IVideo {
  id: string;
  name: string;
  coverUrl: string;
  createTime: string;
  updateTime: string;
  description?: string;
  dt: number;
  playCount: number;
  type?: number;
  user: IUser | IArtist;
  song?: ISong;
}
export type { IVideo };
