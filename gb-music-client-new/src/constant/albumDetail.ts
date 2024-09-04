import { IArtist } from './artist';
interface ISong {
  id: string;
  name: string;
  alia?: string;
  dt?: string;
  publishTime?: string;
  video?: { id: string; name: string };
  vip?: number;
}
interface ICategory {
  id: string;
  name: string;
}
interface IAlbumDetail {
  id: string;
  name: string;
  publishTime: string;
  coverUrl: string;
  songs: ISong[];
  category: ICategory;
  artist: IArtist;
  description?: string;
}
export type { IAlbumDetail, ICategory, ISong };
