interface IMsgStore {
  isShow: boolean;
  resolve: (res: any) => void;
  reject: (res: any) => void;
}
export type { IMsgStore };
