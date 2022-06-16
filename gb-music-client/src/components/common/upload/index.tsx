import React, { memo, FC, ReactElement, ChangeEvent, useState } from 'react';
import { UploadCpnWrapper } from './style';
import { getVideoBase64, getVideoDuration } from '../../../utils/videoUtils';
interface IProps {
  names: {
    name: string;
    cols: number;
    rows: number;
    fn: (e: ChangeEvent<HTMLTextAreaElement>) => void;
  }[];
  defineBtn: (img?: File, vio?: File, dt?: number, channel?: File) => void;
  cancelBtn: () => void;
  isShowImgPrev: boolean;
  isShowVioPrev: boolean;
  isShowChannelPrev?: boolean;
}
const UploadCpn: FC<IProps> = (props): ReactElement => {
  const { names, defineBtn, cancelBtn, isShowImgPrev, isShowVioPrev, isShowChannelPrev } = props;
  const [isPrevImg, setIsPrevImg] = useState<boolean>(false);
  const [isPrevVio, setIsPrevVio] = useState<boolean>(false);
  const [imgURL, setImgURL] = useState<string>('');
  const [vioURL, setVioURL] = useState<string>('');

  const [dt, setDt] = useState<number>(0);
  const [img, setImg] = useState<File>();
  const [vio, setVio] = useState<File>();
  const [channel, setChannel] = useState<File>();

  const define = () => {
    defineBtn(img, vio, dt, channel);
  };
  const cancel = () => {
    cancelBtn();
  };
  const imgChange = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.currentTarget.files) {
      const file = e.currentTarget.files[0];
      setImg(file);
      const url: string = URL.createObjectURL(file);
      setImgURL(url);
      setIsPrevImg(true);
    }
  };
  const vioChange = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.currentTarget.files) {
      const file = e.currentTarget.files[0];
      const url: string = URL.createObjectURL(file);
      setVio(file);
      getVideoBase64(url).then((data: any) => {
        getVideoDuration(file).then((data: any) => {
          setDt(data);
        });
        setVioURL(data);
        setIsPrevVio(true);
      });
    }
  };
  //上传声音
  const channelChange = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.currentTarget.files) {
      const file = e.currentTarget.files[0];
      setChannel(file);
    }
  };
  return (
    <UploadCpnWrapper>
      {names.length !== 0 &&
        names.map((item, index) => {
          return (
            <div className="name">
              <span>{item.name}:</span>
              <textarea cols={item.cols} rows={item.rows} onChange={(e) => item.fn(e)}>
                {' '}
              </textarea>
            </div>
          );
        })}
      <div className="prev-outer">
        {isShowImgPrev && (
          <div className="prev-img">
            {!isPrevImg && <input type="file" title="请上传封面" onChange={(e) => imgChange(e)} />}
            {!isPrevImg && <i className="iconfont icon-tupian"> </i>}
            {isPrevImg && <img src={imgURL} alt="封面" />}
          </div>
        )}
        {isShowVioPrev && (
          <div className="prev-vio">
            {!isPrevVio && <input type="file" title="请上传视频" onChange={(e) => vioChange(e)} />}
            {!isPrevVio && <i className="iconfont icon-video"> </i>}
            {isPrevVio && <img src={vioURL} alt="视频" />}
          </div>
        )}
        {isShowChannelPrev && (
          <div className="prev-channel" title="请选择声音">
            {<input type="file" onChange={(e) => channelChange(e)} />}
          </div>
        )}
      </div>
      <div className="control-btn">
        <button onClick={(e) => define()}>确定</button>
        <button onClick={(e) => cancel()}>取消</button>
      </div>
    </UploadCpnWrapper>
  );
};
export default memo(UploadCpn);
