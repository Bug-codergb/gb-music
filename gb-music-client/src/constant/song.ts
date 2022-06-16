import { IAlbum } from './album';
import { IArtist } from './artist';

interface ISong {
  id: string;
  name: string;
  publishTime: string;
  alia?: string;
  album: IAlbum;
  artist: IArtist;
  video?: any;
  vip: number;
  playCount?: number;
  duration?: number;
  diff?: number;
}
export type { ISong };
