import React, { memo, FC, ReactElement, useEffect, useState,FormEvent, ChangeEvent,useRef } from 'react';
import { PictureOutlined, PlaySquareOutlined, DeleteOutlined } from '@ant-design/icons';
import { Modal,Form,Input,Select } from "antd"
import { useAppDispatch } from '@/store/hooks';
import radioImg from '@/assets/img/channel/radio.png';
import { RadioWrapper } from './style';
import { addContent, getAllChannel, uploadContentCover } from '@/network/channel';
import { IChannel } from '@/constant/channel';
import ImgCropper from '@/views/myMusic/childCpn/myPlaylist/childCpn/imgCropper/index';

import { publishMessage } from '@/network/message';

const Radio: FC = (): ReactElement => {
  const [channel, setChannel] = useState<IChannel[]>([]);
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const [isShow, setIsShow] = useState<boolean>(false);

  const [name, setName] = useState<string>('');
  const [desc, setDesc] = useState<string>('');
  const [cId, setCid] = useState<string>('');

  const [prevImgURL, setPrevImg] = useState<string>('');
  const [imgFile, setImgFile] = useState<File>();
  const [isShowPrev, setIsShowPrev] = useState<boolean>(false);

  const dispatch = useAppDispatch();
  useEffect(() => {
    getAllChannel().then((data: any) => {
      for(let item of data){
        item.label = item.name;
        item.value = item.id
      }
      setChannel(data);
      setCid(data[0].id);
    });
  }, []);
  const liClick = (item: IChannel, index: number) => {
    setCurrentIndex(index);
    setCid(item.id);
  };
  const uploadBtn = () => {
    setPrevCoverURL("");
          setIsPrevCover(false);
          form.setFieldValue("name","");
          form.setFieldValue("desc","");
          form.setFieldValue("cover",null);
    setIsModalOpen(true);
  };
  const inpChange = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.currentTarget.files) {
      const url = URL.createObjectURL(e.currentTarget.files[0]);
      setPrevImg(url);
      setIsShowPrev(true);
      setImgFile(e.currentTarget.files[0]);
    }
  };
  const nameChange = (e: ChangeEvent<HTMLTextAreaElement>) => {
    setName(e.currentTarget.value);
  };
  const descChange = (e: ChangeEvent<HTMLTextAreaElement>) => {
    setDesc(e.currentTarget.value);
  };
  const define = () => {
    if (name.trim().length === 0) {
      //dispatch(changeShow('名称不能为空', 1500));
    } else if (desc.trim().length === 0) {
      //dispatch(changeShow('简介不能为空', 1500));
    } else if (!imgFile) {
      //dispatch(changeShow('请选择文件', 1500));
    } else if (cId.trim().length === 0) {
      //dispatch(changeShow('请选择文件', 1500));
    } else {
      addContent(cId, name, desc).then((data: any) => {
        if (data) {
          const { id } = data;
          let formData: FormData = new FormData();
          formData.append('cover', imgFile);
          formData.append('id', id);
          uploadContentCover(formData).then((data: any) => {
            setCid('');
            setDesc('');
            setName('');
            setImgFile(undefined);
            setPrevImg('');
            setIsShow(false);
            setIsShowPrev(false);
          });
          publishMessage('/channel', '发布了', 'ccId', id);
        }
      });
    }
  };
  const cancel = () => {
    setIsShow(false);
    setCid('');
    setDesc('');
    setName('');
    setImgFile(undefined);
    setPrevImg('');
    setIsShowPrev(false);
  };


  const [form] = Form.useForm();
  const [isModalOpen, setIsModalOpen] = useState(false);

  
  const imgCropperRef = useRef();
  const [cropperImg, setCropperImg] = useState<File | null>(null);
  const [isPrevCover, setIsPrevCover] = useState(false);
  const [prevCoverURL, setPrevCoverURL] = useState('');
  const [fileInputIndex, setFileInputIndex] = useState(0);

  const handleCoverChange=(e: FormEvent)=>{
    setFileInputIndex(fileInputIndex + 1);
    if (e.currentTarget.files && e.currentTarget.isDefaultNamespace.length !== 0) {
      const file = e.currentTarget.files[0];
      imgCropperRef.current && imgCropperRef.current.showModal(file);
    }
  }

  const handleDeleteCover=()=>{
    setIsPrevCover(false);
    setPrevCoverURL('');
  }

  const handleCropperImg=(file:File|null)=>{
    if (file) {
      setCropperImg(file);
      form.setFieldValue('cover', file);
      const url = URL.createObjectURL(file);
      setPrevCoverURL(url);
    }
    setIsPrevCover(true);
  }
  const handleOk=()=>{
    form.submit();
  }
  const handleCancel=()=>{
    setIsModalOpen(false)  
  }

  const handleFinishForm=(values:any)=>{
    console.log(values);
    const {cateId,name,desc,cover} = values;
    addContent(cateId, name, desc).then((data: any) => {
      if (data) {
        const { id } = data;
        let formData: FormData = new FormData();
        formData.append('cover', cover);
        formData.append('id', id);
        uploadContentCover(formData).then((data: any) => {
          setPrevCoverURL("");
          setIsPrevCover(false);
          form.setFieldValue("name","");
          form.setFieldValue("desc","");
          form.setFieldValue("cover",null);
          setIsModalOpen(false);

        });
        publishMessage('/channel', '发布了', 'ccId', id);
      }
    });
  }
  return (
    <RadioWrapper>
      <div className="upload-radio">
        <img src={radioImg} alt="radio-img" />
        <p className="tip" onClick={(e) => uploadBtn()}>
          点击添加
        </p>
      </div>
      <Modal title="上传声音" width={'36%'} open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
      <Form name="upload-video" layout={'vertical'} form={form} onFinish={handleFinishForm}>
          <Form.Item label="名称" name="name" required={true} rules={[{ required: true, message: '视频名称不能为空' }]}>
            <Input placeholder="请输入名称" />
          </Form.Item>
          <Form.Item label="电台分类" name="cateId" initialValue={cId} rules={[{ required: true, message: '视频分类不能为空' }]}>
            <Select
              defaultValue={cId}
              style={{ width: '100%' }}
        
              options={channel}
            />
          </Form.Item>
          <Form.Item label="简介" name="desc" required={true} rules={[{ required: true, message: '视频简介不能为空' }]}>
            <Input.TextArea placeholder="请输入简介" />
          </Form.Item>
          <Form.Item
                label="封面"
                name={'cover'}
                required={true}
                rules={[{ required: true, message: '视频封面不能为空' }]}
              >
                <div className="create-playlist-img-container">
                  {!isPrevCover && (
                    <input type="file" accept="image/*" key={fileInputIndex} onChange={(e) => handleCoverChange(e)} />
                  )}
                  {!isPrevCover && <PictureOutlined className="g-pic-prev" />}
                  {isPrevCover && <img src={prevCoverURL} />}
                  {isPrevCover && (
                    <div className="mask">
                      <DeleteOutlined onClick={handleDeleteCover} />
                    </div>
                  )}
                </div>
              </Form.Item>
        </Form>
      
      <ImgCropper ref={imgCropperRef} title="上传声音封面" aspectRatio={1} getCropperFile={(file) => handleCropperImg(file)} />  
      </Modal> 
    </RadioWrapper>
  );
};
export default memo(Radio);
