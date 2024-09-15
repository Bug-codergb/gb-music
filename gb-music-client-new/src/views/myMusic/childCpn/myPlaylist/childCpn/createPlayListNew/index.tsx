import React, { FC, memo, useState, useImperativeHandle, forwardRef, FormEvent, useRef } from 'react';
import { Button, Modal, Form, Input } from 'antd';
import type { FormProps } from 'antd';
import { PictureOutlined, DeleteOutlined } from '@ant-design/icons';
import ImgCropper from '../imgCropper';
import { CreatePlayListWrapper } from './style';

type FieldType = {
  name?: string;
  desc?: string;
  cover?: string;
};
interface IProps {
  onClick: (name: string, desc: string, cover: File | null) => void;
}
const { TextArea } = Input;
const CreatePlayList: FC<IProps> = forwardRef((props, ref) => {
  const { onClick } = props;
  const [form] = Form.useForm();
  const [isModalOpen, setIsModalOpen] = useState(false);

  const [isPrev, setIsPrev] = useState(false);
  const [prevUrl, setPrevUrl] = useState('');
  const resetForm = () => {
    setCropperImg(null);
    setIsPrev(false);
    setFileInputIndex(0);
    setPrevUrl('');
    form.setFieldValue('name', '');
    form.setFieldValue('desc', '');
  };
  const showModal = () => {
    setIsModalOpen(true);
    resetForm();
  };

  const handleOk = () => {
    form.submit();
    //setIsModalOpen(false);
  };

  const handleCancel = () => {
    setIsModalOpen(false);
  };
  useImperativeHandle(ref, () => {
    return {
      showModal
    };
  });

  const onFinish: FormProps<FieldType>['onFinish'] = (values) => {
    onClick(values.name, values.desc, values.cover);
    setIsModalOpen(false);
  };

  const imgCropperRef = useRef();

  const [fileInputIndex, setFileInputIndex] = useState(0);
  const handleFileChange = (e: FormEvent) => {
    if (e.currentTarget.files && e.currentTarget.files.length) {
      const file = e.currentTarget.files[0];
      imgCropperRef.current && imgCropperRef.current.showModal(file);
      setFileInputIndex(fileInputIndex + 1);
    }
  };

  const [cropperImg, setCropperImg] = useState<File | null>(null);
  const handleCropperImg = (file: File | null) => {
    if (file) {
      setCropperImg(file);
      form.setFieldValue('cover', file);
      const url = URL.createObjectURL(file);
      setPrevUrl(url);
    }
    setIsPrev(true);
  };
  const handleDeleteFile = () => {
    setIsPrev(false);
    setPrevUrl('');
    setCropperImg(null);
    form.setFieldValue('cover', null);
  };
  return (
    <CreatePlayListWrapper>
      <Modal title="新建歌单" open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
        <Form
          name="basic"
          form={form}
          labelCol={{ span: 3 }}
          wrapperCol={{ span: 21 }}
          style={{ maxWidth: 600 }}
          onFinish={onFinish}
          autoComplete="off"
        >
          <Form.Item<FieldType> label="名称" name="name" rules={[{ required: true, message: '请输入歌单名称' }]}>
            <Input placeholder="请输入歌单名称" />
          </Form.Item>

          <Form.Item<FieldType> label="简介" name="desc" rules={[{ required: true, message: '请输入歌单简介' }]}>
            <TextArea rows={4} placeholder="请输入歌单简介" maxLength={500} />
          </Form.Item>

          <Form.Item<FieldType>
            label="封面"
            name="cover"
            rules={[{ required: true, message: 'Please input your password!' }]}
          >
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
      </Modal>
      <ImgCropper ref={imgCropperRef} getCropperFile={(file) => handleCropperImg(file)} />
    </CreatePlayListWrapper>
  );
});
export default memo(CreatePlayList);
