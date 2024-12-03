import React, { memo, FC, ReactElement, ChangeEvent, useState ,useImperativeHandle,forwardRef} from 'react';
import { CreateTopicWrapper } from './style';
import { Button, Modal } from 'antd';
import UploadCpn from '../../../../components/common/upload';
import { createTopic, uploadCover } from '../../../../network/topic';
interface IProps {
  onClick: () => void;
}
const CreateTopic: FC<IProps> = forwardRef((props,ref): ReactElement => {
  const { onClick } = props;
  const [isModalOpen,setIsModalOpen] = useState(false);
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
  const showModal=()=>{
    setIsModalOpen(true);
  }
  useImperativeHandle(ref,()=>{
    return {
      showModal

    }
  })

  const handleOk=()=>{

  }
  const handleCancel=()=>{

  }
  return (
    <Modal title="创建话题" width="40%" open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
      <CreateTopicWrapper>111</CreateTopicWrapper>
    </Modal>
  );
});
export default memo(CreateTopic);
