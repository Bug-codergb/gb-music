import React, { memo, useState, forwardRef,FC, useImperativeHandle,MouseEvent, ChangeEvent } from 'react';
import { getVideoBase64, getVideoDuration } from '@/utils/videoUtils';
import { Modal, Form, Input, message } from 'antd';
import { FileOutlined,DeleteOutlined } from '@ant-design/icons';
interface IProps {
  id: string;
  defineUpload: (name: string, dt: number | undefined, channel: File | undefined) => void;
  cancelUpload: () => void;
}
type FieldType = {
  name?: string;
  source?: File;
};
const NewUpload:FC<IProps> = forwardRef((props, ref) => {

  const { defineUpload } = props;

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [form] = Form.useForm();

  const [isPrev,setIsPrev] = useState(false);
  const [fileIndex,setFileIndex] = useState(0);
  const [dt,setDt] = useState<number>(0);
  const [source,setSource] = useState<File|null>(null)

  const showModal = () => {
    form.setFieldValue("source",null);
    form.setFieldValue("name","");
    setSource(null)
    setIsPrev(false);
    setDt(0);
    setIsModalOpen(true);
  };

  const handleOk = () => {
    form.submit()
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
  const onFinish = (values:any) => {
    defineUpload(values.name,dt,source);
    setIsModalOpen(false);
  };
  const handleFileChange=(e:ChangeEvent<HTMLInputElement>)=>{
    const file = e.currentTarget.files[0];
    
    if(!file.name.includes(".mp3")){
      message.warning('请上传mp3文件');
      return;
    }
    if(file && file.name.includes(".mp3")){
      console.log(file);
      //form.setFieldValue("source",file);
      setSource(file);
      const url: string = URL.createObjectURL(file);
      getVideoBase64(url).then((data: any) => {
        getVideoDuration(file).then((data: any) => {
          setDt(data);
        });
        setIsPrev(true);
      });

    } 
  }
  const handleDelete=()=>{
    form.setFieldValue("source",null);
    setSource(null);
    setIsPrev(false);
    setFileIndex(fileIndex+1);
    setDt(0);
  }
  return (
    <div>
      <Modal title="添加节目" open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
        <Form
          name="basic"
          layout="vertical"
          onFinish={onFinish}
          form={form}
        >
          <Form.Item<FieldType>
            label="名称"
            name="name"
            rules={[{ required: true, message: '节目名称不能为空' }]}
          >
            <Input placeholder='请输入节目名称'/>
          </Form.Item>

          <Form.Item<FieldType>
            label="源文件"
            name="source"
            rules={[{ required: true, message: '源文件不能为空' }]}
          >
            <div className='g-new-upload-container-mp3'>
              {
                !isPrev && <FileOutlined />
              }
              {
                !isPrev && <input type="file" onChange={handleFileChange} key={fileIndex}/>
              }
              {
                isPrev && <div className='mask' onClick={handleDelete}>
                  <DeleteOutlined />
                </div>
              }
              {
                isPrev && <span className='source-name'>{source?.name}</span>
              }
            </div>
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
});
export default memo(NewUpload);
