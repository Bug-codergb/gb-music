import { IUser } from '../user';
import { IPlaylist } from '../playlist';
import { IAlbum } from '../album';
import { IArtist } from '../artist';
import { IVideo } from '../video';
import { ISong } from '../song';

interface ISearchStore {
  user: IUser[];
  playlist: IPlaylist[];
  album: IAlbum[];
  artist: IArtist[];
  video: IVideo[];
  song: ISong[];
}
export type { ISearchStore };
