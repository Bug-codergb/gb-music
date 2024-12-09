import React, { memo, FC, ReactElement, useEffect, useState, ChangeEvent ,useRef, FormEvent} from 'react';
import { Modal, Form, Input, Col, Row } from 'antd';
import {
  PictureOutlined,
  PlaySquareOutlined,
  DeleteOutlined
} from '@ant-design/icons';
import { VideoWrapper } from './style';
import { addVideo, getVideoCate, uploadCover, uploadVideo } from '@/network/video';
import { ICategory } from '@/constant/category';
import { getVideoBase64, getVideoDuration } from '../../../../../../../utils/videoUtils';
import { useAppDispatch } from '@/store/hooks';
import { publishMessage } from '../../../../../../../network/message';

import ImgCropper from '@/views/myMusic/childCpn/myPlaylist/childCpn/imgCropper/index';
const Video: FC = (): ReactElement => {
  const [cateList, setCateList] = useState<ICategory[]>([]);

  const [cateId, setCateId] = useState<string>('');
  const [name, setName] = useState<string>('');
  const [desc, setDesc] = useState<string>('');
  const [cover, setCover] = useState<File>();
  const [video, setVideo] = useState<File>();
  const [dt, setDt] = useState<string>('');

  const [currentIndex, setCurrentIndex] = useState<number>(0);

  const [isShow, setIsShow] = useState<boolean>(false);

  const [prevImgURL, setImgURL] = useState<string>('');
  const [prevVioURL, setVioURL] = useState<string>('');

  const [isShowImg, setIsShowImg] = useState<boolean>(false);
  const [isShowVio, setIsShowVio] = useState<boolean>(false);

  const dispatch = useAppDispatch();

  useEffect(() => {
    getVideoCate(0).then((data: any) => {
      setCateList(data);
      setCateId(data[0].id);
    });
  }, []);
  const liClick = (item: ICategory, index: number) => {
    setCurrentIndex(index);
    setCateId(item.id);
  };
  //封面预览
  const imgPrev = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.currentTarget.files) {
      const file = e.currentTarget.files[0];
      setCover(file);
      const url = URL.createObjectURL(file);
      setImgURL(url);
      setIsShowImg(true);
    }
  };
  //视频预览
  const vioPrev = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.currentTarget.files) {
      const file = e.currentTarget.files[0];
      setVideo(file);
      const url = URL.createObjectURL(file);
      getVideoBase64(url).then((data: any) => {
        setVioURL(data);
        setIsShowVio(true);
        getVideoDuration(file).then((data: any) => {
          setDt(data);
        });
      });
    }
  };
  const upload = () => {
    setIsModalOpen(true);
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
    } else if (!video) {
      //dispatch(changeShow('请选择视频', 1500));
    } else if (!cover) {
      //dispatch(changeShow('请选择封面', 1500));
    } else {
      addVideo(name, desc, 0, cateId, undefined).then((data: any) => {
        const { id } = data;
        if (id) {
          let formData: FormData = new FormData();
          formData.append('video', video);
          formData.append('dt', dt);
          uploadVideo(formData, id).then((data: any) => {});
          let coverFormData: FormData = new FormData();
          coverFormData.append('cover', cover);
          uploadCover(coverFormData, id).then((data: any) => {
            setIsShow(false);
            setDt('');
            setCover(undefined);
            setName('');
            setDesc('');
            setImgURL('');
            setVioURL('');
          });
          publishMessage('/video', '发布了', 'vId', id);
        }
      });
    }
  };
  const cancel = () => {
    setIsShow(false);
    setIsShowVio(false);
    setIsShowImg(false);
    setVioURL('');
    setImgURL('');
    setName('');
    setDesc('');
  };

  const [form] = Form.useForm();
  const [isModalOpen, setIsModalOpen] = useState(false);
  const handleOk = () => {
    form.submit();
    //setIsModalOpen(false);
  };
  const handleCancel = () => {
    setIsModalOpen(false);
  };

  const handleFinishForm = () => {};

  const imgCropperRef = useRef();
  const [cropperImg, setCropperImg] = useState<File | null>(null);
  const [isPrevCover,setIsPrevCover] = useState(false);
  const [prevCoverURL,setPrevCoverURL] = useState("");

  const [fileInputIndex, setFileInputIndex] = useState(0);
   const handleCoverChange=(e:FormEvent)=>{
    setFileInputIndex(fileInputIndex+1);
    if(e.currentTarget.files && e.currentTarget.isDefaultNamespace.length!==0){
      const file = e.currentTarget.files[0];
      imgCropperRef.current && imgCropperRef.current.showModal(file);
    }
  }
  const handleCropperImg=(file: File | null)=>{
    if (file) {
      setCropperImg(file);
      form.setFieldValue('cover', file);
      const url = URL.createObjectURL(file);
      setPrevCoverURL(url);
    }
    setIsPrevCover(true);
  }
  const handleDeleteCover=()=>{
    setIsPrevCover(false);
    setPrevCoverURL("");
    setCropperImg(null);
  }

  const [isPrevVideo,setIsPrevVideo] = useState(false);
  const [videoIndex,setVideoIndex] = useState(1)
  const [prevVideoURL,setPrevVideoURL]= useState("")

  const handleVideoChange=(e:FormEvent)=>{
    if(e.currentTarget.files && e.currentTarget.files[0]){
      const file = e.currentTarget.files[0];
      form.setFieldValue("video",file);
      setPrevVideoURL(URL.createObjectURL(file));
    }
    setVideoIndex(videoIndex+1);
    setIsPrevVideo(true);
  }
  const handleDeleteVideo=()=>{
    setIsPrevVideo(false);
    setPrevVideoURL("")
  }
  return (
    <VideoWrapper>
      <div className="upload-outer">
        <i className="iconfont icon-upload"> </i>
        <div className="tip">丰富的音乐灵感/创作碎片等</div>
        <span className="upload-btn" onClick={(e) => upload()}>
          点击上传
        </span>
      </div>
      <Modal title="上传视频" width={'40%'} open={isModalOpen} onOk={handleOk} onCancel={handleCancel}>
        <Form name="upload-video" layout={'vertical'} form={form} onFinish={() => handleFinishForm()}>
          <Form.Item label="名称" name="name" required={true} rules={[{ required: true, message: '视频名称不能为空' }]}>
            <Input placeholder="请输入名称" />
          </Form.Item>
          <Form.Item label="简介" name="desc" required={true} rules={[{ required: true, message: '视频简介不能为空' }]}>
            <Input.TextArea placeholder="请输入简介" />
          </Form.Item>
          <Row gutter={12}>
            <Col span={12}>
              <Form.Item label="封面" name={"cover"} required={true} rules={[{ required: true, message: '视频封面不能为空' }]}>
                <div className='create-playlist-img-container'>
                  {!isPrevCover && <input type="file" accept='image/*' key={fileInputIndex} onChange={(e)=>handleCoverChange(e)}/>}
                  {!isPrevCover && <PictureOutlined className="g-pic-prev"/>}
                  {isPrevCover && <img src={prevCoverURL} />}
                  {isPrevCover && (
                <div className="mask">
                  <DeleteOutlined onClick={handleDeleteCover} />
                </div>
              )}
                </div>
              </Form.Item>
            </Col>
            <Col span={12}>
              <Form.Item label="视频源文件" name="video" required={true} rules={[{ required: true, message: '视频源文件不能为空' }]}>
                <div className='create-playlist-img-container'>
                  {!isPrevVideo && <input type="file" key={videoIndex} accept='video/*' onChange={(E)=>handleVideoChange(E)} />}
                  {!isPrevVideo && <PlaySquareOutlined className="g-pic-prev" />}
                  {
                    isPrevVideo && <video src={prevVideoURL}/>
                  }
                  {
                    isPrevVideo && (
                      <div className='mask'>
                        <DeleteOutlined onClick={handleDeleteVideo} />
                      </div>
                    )
                  }
                </div>
              </Form.Item>
            </Col>
          </Row>
        </Form>
      </Modal>
      <ImgCropper ref={imgCropperRef} aspectRatio={16/9} getCropperFile={(file) => handleCropperImg(file)} />
    </VideoWrapper>
  );
};
export default memo(Video);
