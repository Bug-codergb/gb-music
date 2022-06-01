import React, { memo, FC, ReactElement, useState, ChangeEvent } from 'react';
import { UploadWrapper } from './style';
import UploadCpn from '../../../../../../../common/upload';
import { useDispatch } from 'react-redux';
import { changeShow } from '../../../../../../../common/toast/store/actionCreators';
import { addContent, uploadContentCover } from '../../../../../../../../network/channel';
interface IProps {
  id: string;
  isShowP: boolean;
  defined: () => void;
  canceled: () => void;
}
const Upload: FC<IProps> = (props): ReactElement => {
  const [name, setName] = useState<string>('');
  const [desc, setDesc] = useState<string>('');
  const isShowImgPrev = true;
  const isShowVioPrev = false;
  const dispatch = useDispatch();
  const nameChange = (e: ChangeEvent<HTMLTextAreaElement>): void => {
    setName(e.currentTarget.value);
  };
  const descChange = (e: ChangeEvent<HTMLTextAreaElement>): void => {
    setDesc(e.currentTarget.value);
  };
  const names = [
    {
      name: '名称',
      cols: 50,
      rows: 2,
      fn: (e: ChangeEvent<HTMLTextAreaElement>) => nameChange(e)
    },
    {
      name: '简介',
      cols: 50,
      rows: 5,
      fn: (e: ChangeEvent<HTMLTextAreaElement>) => descChange(e)
    }
  ];
  const { id, isShowP, defined, canceled } = props;
  const define = (img: File | undefined, vio: File | undefined, dt: number | undefined) => {
    if (name.trim().length === 0) {
      dispatch(changeShow('名称不能为空', 1500));
    } else if (desc.trim().length === 0) {
      dispatch(changeShow('简介不能为空', 1500));
    } else {
      if (isShowImgPrev) {
        addContent(id, name, desc).then((data: any) => {
          if (data) {
            const { id } = data;
            let formData: FormData = new FormData();
            formData.append('cover', img!);
            formData.append('id', id);
            uploadContentCover(formData).then((data) => {});
          }
        });
      }
      if (isShowVioPrev) {
      }
    }
    defined();
  };
  const cancel = () => {
    canceled();
  };
  return (
    <UploadWrapper>
      {isShowP && (
        <UploadCpn
          names={names}
          defineBtn={(img?: File, vio?: File, dt?: number) => define(img, vio, dt)}
          cancelBtn={() => cancel()}
          isShowImgPrev={isShowImgPrev}
          isShowVioPrev={isShowVioPrev}
        />
      )}
    </UploadWrapper>
  );
};
export default memo(Upload);
