import React, { memo, FC, ReactElement, useEffect, useState, ChangeEvent } from 'react';
import { useAppDispatch } from '@/store/hooks';
import radioImg from '../../../../../../../assets/img/channel/radio.png';
import { RadioWrapper } from './style';
import { addContent, getAllChannel, uploadContentCover } from '@/network/channel';
import { IChannel } from '@/constant/channel';

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
      setChannel(data);
      setCid(data[0].id);
    });
  }, []);
  const liClick = (item: IChannel, index: number) => {
    setCurrentIndex(index);
    setCid(item.id);
  };
  const uploadBtn = () => {
    setIsShow(true);
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
  return (
    <RadioWrapper>
      <div className="upload-radio">
        <img src={radioImg} alt="radio-img" />
        <p className="tip" onClick={(e) => uploadBtn()}>
          点击添加
        </p>
      </div>
      {/*上传组件*/}
      {isShow && (
        <div className="upload-content">
          <div className="name">
            <span>名称:</span>
            <textarea rows={2} cols={50} value={name} onChange={(e) => nameChange(e)}>
              {' '}
            </textarea>
          </div>
          <div className="desc">
            <span>简介:</span>
            <textarea rows={5} cols={50} value={desc} onChange={(e) => descChange(e)}>
              {' '}
            </textarea>
          </div>
          {/*图片预览*/}
          <div className="prev-img">
            {!isShowPrev && <input type="file" onChange={(e) => inpChange(e)} />}
            {!isShowPrev && <i className="iconfont icon-tupian"> </i>}
            {isShowPrev && <img src={prevImgURL} alt="图片预览" />}
          </div>

          <ul className="channel-list">
            {channel.length !== 0 &&
              channel.map((item, index) => {
                return (
                  <li
                    key={item.id}
                    onClick={(e) => liClick(item, index)}
                    className={currentIndex === index ? 'active' : ''}
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
    </RadioWrapper>
  );
};
export default memo(Radio);
