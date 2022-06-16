import { IVideoStore } from '../../../../../constant/store/video';

interface IVideoDetailAction {
  type: string;
  video: IVideoStore;
}
export type { IVideoDetailAction };
