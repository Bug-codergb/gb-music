import React, { memo, FC, ReactElement, useEffect, useState, ChangeEvent } from 'react';
import { VideoWrapper } from './style';
import { addVideo, getVideoCate, uploadCover, uploadVideo } from '@/network/video';
import { ICategory } from '@/constant/category';
import { getVideoBase64, getVideoDuration } from '../../../../../../../utils/videoUtils';
import { useAppDispatch } from '@/store/hooks';
import { publishMessage } from '../../../../../../../network/message';
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
    setIsShow(true);
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
  return (
    <VideoWrapper>
      <div className="upload-outer">
        <i className="iconfont icon-upload"> </i>
        <div className="tip">丰富的音乐灵感/创作碎片等</div>
        <span className="upload-btn" onClick={(e) => upload()}>
          点击上传
        </span>
      </div>
      {isShow && (
        <div className="upload">
          <div className="name">
            <span>名称:</span>
            <textarea rows={2} cols={50} onChange={(e) => nameChange(e)} value={name}>
              {' '}
            </textarea>
          </div>
          <div className="desc">
            <span>简介:</span>
            <textarea rows={7} cols={50} value={desc} onChange={(e) => descChange(e)}>
              {' '}
            </textarea>
          </div>
          <div className="preview">
            <div className="img-preview">
              {!isShowImg && <input type="file" title="选择封面" onChange={(e) => imgPrev(e)} />}
              {!isShowImg && <i className="iconfont icon-tupian"> </i>}
              {isShowImg && <img src={prevImgURL} alt="封面预览" />}
            </div>
            <div className="video-preview">
              {!isShowVio && <input type="file" title="选择视频" onChange={(e) => vioPrev(e)} />}
              {!isShowVio && <i className="iconfont icon-video"> </i>}
              {isShowVio && <img src={prevVioURL} alt="视频预览" />}
            </div>
          </div>
          <div className="cate-title">分类:</div>
          <ul className="cate-list">
            {cateList.length !== 0 &&
              cateList.map((item, index) => {
                return (
                  <li
                    key={item.id}
                    className={currentIndex === index ? 'active' : ''}
                    onClick={(e) => liClick(item, index)}
                  >
                    {item.name}
                  </li>
                );
              })}
          </ul>
          <div className="control-btn">
            <button className="define" onClick={(e) => define()}>
              确定
            </button>
            <button className="cancel" onClick={(e) => cancel()}>
              取消
            </button>
          </div>
        </div>
      )}
    </VideoWrapper>
  );
};
export default memo(Video);
