import { IUser } from '../user';
import { IArtist } from '../artist';
import { IAlbum } from '../album';

interface ISongDetail {
  id: string;
  vip: number;
  name: string;
  duration: number;
  album: {
    id: string;
    name: string;
    coverUrl: string;
  };
  user: IUser;
  channel: any;
  video: any;
  artist: {
    id: string;
    name: string;
  };
}
interface IPlaylist {
  id: string;
  name: string;
  publishTime: string;
  alia: string;
  vip: number;
  artist: IArtist;
  album: IAlbum;
  duration: number;
  video: any;
}
interface ISongStore {
  songUrl: string;
  lyric: { index: number; content: string; duration: number }[] | string;
  lyricLine: string;
  currentIndex: number;
  currentLyricIndex: number;
  playMode: number;
  songDetail: ISongDetail;
  playlist: IPlaylist[];
}
export type { ISongStore, ISongDetail };
