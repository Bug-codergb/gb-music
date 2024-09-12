import React, { memo, useState, useImperativeHandle, forwardRef, FormEvent } from 'react';
import { Button, Modal, Form, Input } from 'antd';
import type { FormProps } from 'antd';
import { PictureOutlined, DeleteOutlined } from '@ant-design/icons';
import { CreatePlayListWrapper } from './style';

type FieldType = {
  name?: string;
  desc?: string;
  cover?: string;
};
const { TextArea } = Input;
const CreatePlayList = forwardRef((props, ref) => {
  const [form] = Form.useForm();
  const [isModalOpen, setIsModalOpen] = useState(false);

  const [isPrev, setIsPrev] = useState(false);
  const [prevUrl, setPrevUrl] = useState('');
  const showModal = () => {
    setIsModalOpen(true);
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
    console.log('Success:', values);
  };

  const handleFileChange = (e: FormEvent) => {
    if (e.currentTarget.files && e.currentTarget.files.length) {
      const file = e.currentTarget.files[0];
      console.log(file);
      setIsPrev(true);
    }
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
          <Form.Item<FieldType>
            label="名称"
            name="name"
            rules={[{ required: true, message: 'Please input your username!' }]}
          >
            <Input placeholder="请输入歌单名称" />
          </Form.Item>

          <Form.Item<FieldType>
            label="简介"
            name="desc"
            rules={[{ required: true, message: 'Please input your password!' }]}
          >
            <TextArea rows={4} placeholder="请输入歌单简介" maxLength={500} />
          </Form.Item>

          <Form.Item<FieldType>
            label="封面"
            name="cover"
            rules={[{ required: true, message: 'Please input your password!' }]}
          >
            <div className="create-playlist-img-container">
              {!isPrev && <input type="file" onChange={handleFileChange} />}
              {!isPrev && <PictureOutlined className="g-pic-prev" />}
              {isPrev && <img src={prevUrl} />}
              {isPrev && (
                <div className="mask">
                  <DeleteOutlined />
                </div>
              )}
            </div>
          </Form.Item>
        </Form>
      </Modal>
    </CreatePlayListWrapper>
  );
});
export default memo(CreatePlayList);
