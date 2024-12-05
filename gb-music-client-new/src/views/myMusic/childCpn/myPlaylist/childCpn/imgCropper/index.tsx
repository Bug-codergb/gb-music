import { Modal } from 'antd';
import React, { memo, useState, useImperativeHandle, forwardRef, useRef, FC } from 'react';
import CustomizeUpload from '@/components/common/customizeUpload';
interface IProps {
  getCropperFile: (file: File | null) => void;
  title?:string,
  aspectRatio?:number,
  realWidth ?:number
}
const ImgCropper: FC<IProps> = forwardRef((props, ref) => {
  const { getCropperFile,title,aspectRatio,realWidth } = props;
  const [isOpen, setIsOpen] = useState(false);
  const [file, setFile] = useState<File | null>(null);
  const showModal = (file: File | null) => {
    setIsOpen(true);
    setFile(file);
  };

  const customizeUploadRef = useRef();
  const handleOk = async () => {
    const file = await customizeUploadRef.current!.getCropperFile();
    getCropperFile(file);
    setIsOpen(false);
  };
  const handleCancel = () => {
    setIsOpen(false);
    setFile(null);
  };

  useImperativeHandle(ref, () => {
    return {
      showModal
    };
  });
  return (
    <Modal title={title || "上传歌单封面"} width={'45%'} open={isOpen} onOk={handleOk} onCancel={handleCancel}>
      <div style={{ height: '200px' }}>
        <CustomizeUpload
          ref={customizeUploadRef}
          imgWidth={8}
          scale={1}
          aspectRatio={aspectRatio ? aspectRatio : 1}
          realWidth={realWidth ? realWidth : 150}
          file={file}
          isCircle={false}
        />
      </div>
    </Modal>
  );
});
export default memo(ImgCropper);
