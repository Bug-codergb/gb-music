import React, { memo, FC, ReactElement, ChangeEvent, useState } from 'react';
import { UploadWrapper } from './style';
import UploadCpn from '../../../../../../../common/upload';
interface IProps {
  id: string;
  defineUpload: (name: string, dt: number | undefined, channel: File | undefined) => void;
  cancelUpload: () => void;
}
const Upload: FC<IProps> = (props): ReactElement => {
  const { id, defineUpload, cancelUpload } = props;
  const [name, setName] = useState<string>('');
  const nameChange = (e: ChangeEvent<HTMLTextAreaElement>): void => {
    setName(e.currentTarget.value);
  };
  const names = [
    {
      name: '名称',
      cols: 45,
      rows: 2,
      fn: (e: ChangeEvent<HTMLTextAreaElement>) => nameChange(e)
    }
  ];
  const define = (img: File | undefined, vio: File | undefined, dt: number | undefined, channel: File | undefined) => {
    defineUpload(name, dt, channel);
  };
  const cancel = () => {
    cancelUpload();
  };
  return (
    <UploadWrapper>
      <UploadCpn
        names={names}
        defineBtn={(img: File | undefined, vio: File | undefined, dt: number | undefined, channel: File | undefined) =>
          define(img, vio, dt, channel)
        }
        cancelBtn={() => cancel()}
        isShowImgPrev={false}
        isShowVioPrev={false}
        isShowChannelPrev={true}
      />
    </UploadWrapper>
  );
};
export default memo(Upload);
