import React, { memo, FC, ReactElement, ChangeEvent, useState, useImperativeHandle, forwardRef ,useRef,FormEvent} from 'react';
import { Form, Input } from 'antd';
import { PictureOutlined, DeleteOutlined } from '@ant-design/icons';
import { CreateTopicWrapper } from './style';
import { Button, Modal } from 'antd';
import UploadCpn from '../../../../components/common/upload';
import { createTopic, uploadCover } from '../../../../network/topic';
import ImgCropper from "@/views/myMusic/childCpn/myPlaylist/childCpn/imgCropper/index"
const { TextArea } = Input;

interface IProps {
  onClick: () => void;
}
const CreateTopic: FC<IProps> = forwardRef((props, ref): ReactElement => {
  const { onClick } = props;
  const [isModalOpen, setIsModalOpen] = useState(false);
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
  const showModal = () => {
    setIsModalOpen(true);
    form.setFieldValue('name', '');
    form.setFieldValue('desc', '');
    form.setFieldValue("cover",null)
    setIsPrev(false);
    setFileInputIndex(0);
    setPrevUrl('');
    setCropperImg(null);
  };
  useImperativeHandle(ref, () => {
    return {
      showModal
    };
  });

  const [form] = Form.useForm();
  const imgCropperRef = useRef();

  const [isPrev, setIsPrev] = useState(false);
  const [prevUrl, setPrevUrl] = useState('');

  const [fileInputIndex, setFileInputIndex] = useState(0);
  const handleFileChange = (e: FormEvent) => {
    if (e.currentTarget.files && e.currentTarget.files.length) {
      const file = e.currentTarget.files[0];
      imgCropperRef.current && imgCropperRef.current.showModal(file);
      setFileInputIndex(fileInputIndex + 1);
    }
  };

  const handleOk = () => {
    form.submit()
  };
  const handleCancel = () => {
    setIsModalOpen(false);
  };

  const [cropperImg, setCropperImg] = useState<File | null>(null);
  const handleDeleteFile = () => {
    setIsPrev(false);
    setPrevUrl('');
    setCropperImg(null);
    form.setFieldValue('cover', null);
  };
  const handleCropperImg = (file: File | null) => {
    if (file) {
      setCropperImg(file);
      form.setFieldValue('cover', file);
      const url = URL.createObjectURL(file);
      setPrevUrl(url);
    }
    setIsPrev(true);
  };
  const onFinish=(values:any)=>{
    const { name,desc,cover } = values
    createTopic(name, desc).then((data: any) => {
      const { id } = data;
      let formData: FormData = new FormData();
      formData.append('cover', cover);
      uploadCover(id, formData).then((data: any) => {
        onClick();
        setIsModalOpen(false);
      });
    });
  }
  return (
    <Modal title="创建话题" width="40%" centered={false} open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
      <CreateTopicWrapper>
        <Form form={form} onFinish={onFinish}>
          <Form.Item label="名称" name="name" rules={[{ required: true }]}>
            <Input placeholder="请输入话题名称" />
          </Form.Item>
          <Form.Item label="简介" name="desc" rules={[{ required: true }]}>
            <TextArea placeholder="请输入话题简介" autoSize={{ minRows: 2, maxRows: 6 }} />
          </Form.Item>
          <Form.Item label="封面" name="cover" rules={[{ required: true }]}>

          <div className="create-playlist-img-container">
              {!isPrev && <input type="file" onChange={handleFileChange} key={fileInputIndex} />}
              {!isPrev && <PictureOutlined className="g-pic-prev" />}
              {isPrev && <img src={prevUrl} />}
              {isPrev && (
                <div className="mask">
                  <DeleteOutlined onClick={handleDeleteFile} />
                </div>
              )}
            </div>
          </Form.Item>
        </Form>
      </CreateTopicWrapper>
      <ImgCropper ref={imgCropperRef} aspectRatio={4.57142} realWidth={1000} getCropperFile={(file) => handleCropperImg(file)} />
    </Modal>
  );
});
export default memo(CreateTopic);
