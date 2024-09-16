import { Modal } from 'antd';
import { useAppDispatch, useAppSelector } from '@/store/hooks';
import React, { memo, useRef, useState, useImperativeHandle, forwardRef, FormEvent, useEffect } from 'react';
import { PictureOutlined, DeleteOutlined } from '@ant-design/icons';
import ImgCropper from '@/views/myMusic/childCpn/myPlaylist/childCpn/imgCropper';
import type { FormProps } from 'antd';
import { Button, Checkbox, Form, Input, Row, Col } from 'antd';

type FieldType = {
  username?: string;
  password?: string;
  cover: File | null;
};
interface IProps {
  onClick: (name: string, password: string, file: File | null) => void;
}

const Profile = forwardRef((props, ref) => {
  const { onClick } = props;
  const [isOpen, setIsOpen] = useState(false);

  const [isPrev, setIsPrev] = useState(false);
  const [prevUrl, setPrevUrl] = useState('');
  const { userMsg } = useAppSelector((state) => {
    return state.loginReducer;
  });

  const [form] = Form.useForm();

  useEffect(() => {
    userMsg && form.setFieldValue('username', userMsg.userName);
    if (userMsg && userMsg.avatarUrl) {
      form.setFieldValue('cover', userMsg.avatarUrl);
      setPrevUrl(userMsg.url);
      setIsPrev(true);
    }
  }, [userMsg]);

  const showModal = () => {
    setIsOpen(true);
  };
  const handleOk = () => {
    form.submit();
  };

  const handleCancel = () => {
    setIsOpen(false);
  };

  const onFinish: FormProps<FieldType>['onFinish'] = (values) => {
    onClick(values.name, values.password, values.cover);
    setIsOpen(false);
  };

  useImperativeHandle(ref, () => {
    return {
      showModal
    };
  });
  const [fileInputIndex, setFileInputIndex] = useState(0);
  const imgCropperRef = useRef();
  const handleFileChange = (e: FormEvent) => {
    const files = e.currentTarget.files;
    if (files && files.length !== 0) {
      const file = files[0];
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
    <Modal title="编辑个人信息" open={isOpen} onOk={handleOk} onCancel={handleCancel} width={'40%'}>
      <Form
        name="basic"
        form={form}
        labelCol={{ span: 5 }}
        wrapperCol={{ span: 19 }}
        onFinish={onFinish}
        autoComplete="off"
      >
        <Row gutter={24}>
          <Col span={15}>
            <Form.Item<FieldType>
              label="用户名"
              name="username"
              rules={[{ required: true, message: '请输入您的用户名' }]}
            >
              <Input placeholder="请输入您的用户名" />
            </Form.Item>
            <Form.Item<FieldType> label="密码" name="password" rules={[{ required: true, message: '请输入您的密码' }]}>
              <Input.Password placeholder="请输入您的密码" />
            </Form.Item>
          </Col>
          <Col span={9}>
            <Form.Item<FieldType> label="" name="cover" rules={[{ required: true, message: '请选择头像' }]}>
              <div className="create-playlist-img-container user-avatar-container">
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
          </Col>
        </Row>
      </Form>
      <ImgCropper ref={imgCropperRef} getCropperFile={(file) => handleCropperImg(file)} />
    </Modal>
  );
});
export default memo(Profile);
