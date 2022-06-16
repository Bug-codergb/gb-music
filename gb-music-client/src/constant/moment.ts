import { IUser } from './user';
import { ISong } from './song';
interface IMoment {
  id: string;
  content: string;
  createTime: string;
  updateTime?: string;
  user: IUser;
  song: ISong;
  picUrl: string;
}
export type { IMoment };
