import React, { memo, FC, ReactElement, useState, MouseEvent, ChangeEvent } from 'react';
import { message } from 'antd';
import { CreatePlayListWrapper } from './style';
interface IProps {
  onClick: Function;
  cancelClick: Function;
}
const CreatePlayList: FC<IProps> = ({ onClick, cancelClick }): ReactElement => {
  const [name, setName] = useState<string>('');
  const [desc, setDesc] = useState<string>('');
  const [file, setFile] = useState<File | null>(null);

  const nameInp = (e: any): void => {
    setName(e.target.value);
  };
  const descInp = (e: any): void => {
    setDesc(e.target.value);
  };
  //确定
  const define = (): void => {
    if(file){
      onClick(name, desc, file);
    }else{
      message.warning('请选择歌单封面');
    }
  };
  const cancel = (): void => {
    cancelClick();
  };
  //选择封面
  const selectFile = (e: ChangeEvent<HTMLInputElement>): void => {
    if (e.target.files) {
      setFile(e.target.files[0]);
    }
  };
  return (
    <CreatePlayListWrapper>
      <div className="create-my-playlist">
        <div className="name">
          <span>名称:</span>
          <textarea rows={2} cols={40} value={name} onInput={(e: any) => nameInp(e)}>
            {' '}
          </textarea>
        </div>
        <div className="desc">
          <span>简介:</span>
          <textarea rows={10} cols={40} value={desc} onInput={(e: any) => descInp(e)}>
            {' '}
          </textarea>
        </div>
        <div>添加封面</div>
        <div className="upload-cover">
          <input
            type="file"
            onChange={(e: ChangeEvent<HTMLInputElement>) => {
              selectFile(e);
            }}
          />
          <i className="iconfont icon-tupian"> </i>
        </div>
        <div className="control-btn">
          <button onClick={(e: MouseEvent<HTMLButtonElement>) => define()}>确定</button>
          <button onClick={(e: MouseEvent<HTMLButtonElement>) => cancel()}>取消</button>
        </div>
      </div>
    </CreatePlayListWrapper>
  );
};
export default memo(CreatePlayList);
