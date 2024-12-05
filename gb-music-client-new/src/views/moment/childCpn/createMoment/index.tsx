import React, { 
  memo,
  FC,
  ReactElement,
  ChangeEvent,
  useState,
  useImperativeHandle, 
  forwardRef,
  useRef,
  FormEvent
} from 'react';
import { Button, Modal ,Select} from 'antd';
import {
  CreateMomentWrapper
} from "./style"
import { Form, Input } from 'antd';
import { PictureOutlined, DeleteOutlined } from '@ant-design/icons';
import ImgCropper from "@/views/myMusic/childCpn/myPlaylist/childCpn/imgCropper/index"
import { getAllTopic } from '@/network/topic';
import { getSearchSong,uploadMomentPic,addMoment } from '@/network/moment';
import { ITopic } from '@/constant/topic';
import { ISong } from '@/constant/song';
const { TextArea } = Input;
interface IProps {
  onClick: () => void;
  publishSuccess: () => void;
}


const CreateMoment:FC<IProps> = forwardRef((props,ref)=>{
  const { onClick, publishSuccess } = props;

  const [content,setContent] = useState("");
  const [topic, setTopic] = useState<ITopic[]>([]);
  const [topicItem, setTopicItem] = useState<string>('');

  const [isModalOpen, setIsModalOpen] = useState(false);

  const [songList, setSongList] = useState<ISong[]>([]);
  const showModal=()=>{
    setIsModalOpen(true)

    setIsPrev(false);
    setSongList([])
    setTopic([]);
    setTopicItem('');
    setPrevUrl('')
    setCropperImg(null)
    form.setFieldValue('cover', null);
    form.setFieldValue('content', '');
    form.setFieldValue('topicItem', '');
    form.setFieldValue('songId', '');

    getAllTopic().then((data: any) => {
      setTopic(data);
      if (data.length !== 0) {
        for(let item of data){
          item.label = item.name;
          item.value = item.id;
        }
        setTopicItem(data[0].id);
      }
    });
    getSearchSong('').then((data: any) => {
      if(data.length!==0){
        for(let item of data){
          item.label = item.name;
          item.value = item.id;
        }
      }
      setSongList(data);
      
    });

  }
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

  const handleOk=()=>{
    form.submit()
  }
  const handleCancel=()=>{
    setIsModalOpen(false)
  }

  const [cropperImg, setCropperImg] = useState<File | null>(null);
  const handleDeleteFile = () => {
    setIsPrev(false);
    setPrevUrl('');
    setCropperImg(null);
    form.setFieldValue('cover', null);
  };

  useImperativeHandle(ref,()=>{
    return {
      showModal
    }
  })
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
    console.log(values)
    const { songId, cover:file,content} = values;
    addMoment(content, songId, topicItem).then((data: any) => {
      if (data) {
        const { id } = data;
        const formData = new FormData();
        formData.append('picture', file);
        uploadMomentPic(id, formData).then((data) => {
          
          onClick();
          publishSuccess();
          setIsModalOpen(false);
        });
      }
    });
  }

  return <Modal title="创建话题" width="40%" centered={false} open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
     <CreateMomentWrapper>
        <Form form={form} onFinish={onFinish}>
          <Form.Item label="内容" name="content" rules={[{ required: true }]}>
            <TextArea placeholder="聊一聊" autoSize={{ minRows: 5, maxRows: 9 }} />
          </Form.Item>
          <Form.Item label="话题" name="topicItem" rules={[{ required: true }]}>
            <Select options={topic} placeholder="请选择话题"></Select>
          </Form.Item>
          <Form.Item label="歌曲" name="songId" rules={[{ required: true }]}>
            <Select options={songList} optionFilterProp="label" showSearch={true} placeholder="请选择歌曲"></Select>
          </Form.Item>
          <Form.Item label="图片" name="cover" rules={[{ required: true }]}>

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
        </CreateMomentWrapper>
      <ImgCropper ref={imgCropperRef} aspectRatio={16/9} realWidth={300} getCropperFile={(file) => handleCropperImg(file)} />
    </Modal>
})
export default memo(CreateMoment);