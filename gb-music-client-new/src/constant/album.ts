import { IArtist } from './artist';

interface IAlbum {
  id: string;
  name: string;
  coverUrl: string;
  publishTime: string;
  subscriber?: number;
  artist?: IArtist;
  description?: string;
  category?: object;
}
export type { IAlbum };
