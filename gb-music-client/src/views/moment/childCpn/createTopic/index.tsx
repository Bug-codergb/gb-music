import React, { memo, FC, ReactElement, ChangeEvent, useState } from 'react';
import { CreateTopicWrapper } from './style';
import UploadCpn from '../../../../components/common/upload';
import { createTopic, uploadCover } from '../../../../network/topic';
interface IProps {
  onClick: () => void;
}
const CreateTopic: FC<IProps> = (props): ReactElement => {
  const { onClick } = props;
  const [name, setName] = useState<string>('');
  const [desc, setDesc] = useState<string>('');

  const nameChange = (e: ChangeEvent<HTMLTextAreaElement>) => {
    setName(e.currentTarget.value);
  };
  const descChange = (e: ChangeEvent<HTMLTextAreaElement>) => {
    setDesc(e.currentTarget.value);
  };
  const define = (img: File | undefined) => {
    if (img) {
      createTopic(name, desc).then((data: any) => {
        const { id } = data;
        let formData: FormData = new FormData();
        formData.append('cover', img);
        uploadCover(id, formData).then((data: any) => {
          onClick();
        });
      });
    }
  };
  const cancel = () => {
    onClick();
  };
  const names = [
    { name: '名称', cols: 50, rows: 2, fn: nameChange },
    { name: '简介', cols: 50, rows: 2, fn: descChange }
  ];
  return (
    <CreateTopicWrapper>
      <UploadCpn
        isShowVioPrev={false}
        isShowImgPrev={true}
        names={names}
        defineBtn={(img) => define(img)}
        cancelBtn={() => cancel()}
      />
    </CreateTopicWrapper>
  );
};
export default memo(CreateTopic);
