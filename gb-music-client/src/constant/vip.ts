import { IUser } from './user';

interface IVIP {
  id: string;
  user: IUser;
  createTime: string;
  status: number;
  vip: {
    id: string;
    name: string;
    price: number;
  };
}
export type { IVIP };
