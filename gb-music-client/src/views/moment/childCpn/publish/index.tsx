import React, { memo, FC, ReactElement, useState, FormEvent, useRef, ChangeEvent, useEffect } from 'react';
import { addMoment, getSearchSong, uploadMomentPic } from '../../../../network/moment';
import { PublishWrapper } from './style';
import { ISong } from '../../../../constant/song';
import { getAllTopic } from '../../../../network/topic';
import { ITopic } from '../../../../constant/topic';
interface IProps {
  onClick: () => void;
  publishSuccess: () => void;
}

const Publish: FC<IProps> = memo((props): ReactElement => {
  const { onClick, publishSuccess } = props;

  const [isShow, setIsShow] = useState<boolean>(true);
  const [songList, setSongList] = useState<ISong[]>([]);

  const [songId, setSongId] = useState<string>('');
  const [content, setContent] = useState<string>('');
  const [file, setFile] = useState<Blob>(new Blob());

  const [albumURL, setAlbumURL] = useState<string>('');
  const [prevURL, setPrevURL] = useState<string>('');
  const [isShowSongPrev, setIsShowSongPrev] = useState<boolean>(false);
  const [isShowPicPrev, setIsShowPicPrev] = useState<boolean>(false);

  const [topic, setTopic] = useState<ITopic[]>([]);
  const [topicItem, setTopicItem] = useState<string>('');
  const ulRef = useRef<HTMLUListElement>(null);
  useEffect(() => {
    getAllTopic().then((data: any) => {
      setTopic(data);
      if (data.length !== 0) {
        setTopicItem(data[0].id);
      }
    });
  }, []);
  const changeShow = (): void => {
    setIsShow(!isShow);
  };
  const songInp = (e: FormEvent<HTMLInputElement>): void => {
    getSearchSong(e.currentTarget.value).then((data: any) => {
      setSongList(data);
      if (ulRef.current!.offsetHeight > 300) {
        ulRef.current!.style.height = '300px';
        ulRef.current!.style.overflowY = 'scroll';
      }
    });
  };
  const selectSong = (item: ISong) => {
    setAlbumURL(item.album.coverUrl);
    setIsShowSongPrev(true);
    setSongId(item.id);
    setIsShow(!isShow);
  };
  const fileChange = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.currentTarget.files) {
      setPrevURL(URL.createObjectURL(e.currentTarget.files[0]));
      setIsShowPicPrev(!isShowPicPrev);
      setFile(e.currentTarget.files[0]);
    }
  };
  const contentText = (e: FormEvent<HTMLTextAreaElement>): void => {
    setContent(e.currentTarget.value);
  };
  const define = () => {
    addMoment(content, songId, topicItem).then((data: any) => {
      if (data) {
        const { id } = data;
        const formData = new FormData();
        formData.append('picture', file);
        uploadMomentPic(id, formData).then((data) => {
          console.log(data);
          onClick();
          publishSuccess();
        });
      }
    });
  };
  const cancel = () => {
    onClick();
  };
  const topicChange = (e: ChangeEvent<HTMLSelectElement>) => {
    setTopicItem(e.target.value);
  };
  return (
    <PublishWrapper>
      <div className="publish" style={{ display: isShow ? 'block' : 'none' }}>
        <textarea cols={58} rows={6} placeholder="聊一聊" onInput={(e) => contentText(e)} />
        <select className="topic-list" onChange={(e) => topicChange(e)}>
          {topic &&
            topic.length !== 0 &&
            topic.map((item, index) => {
              return (
                <option key={item.id} value={item.id}>
                  {item.name}
                </option>
              );
            })}
        </select>
        <div className="container">
          <div className="pic">
            {!isShowPicPrev && <input type="file" onChange={(e) => fileChange(e)} />}
            {!isShowPicPrev && <i className="iconfont icon-tupian"> </i>}
            {isShowPicPrev && <img src={prevURL} alt="" />}
          </div>
          <div className="song" onClick={(e) => changeShow()}>
            {!isShowSongPrev && <i className="iconfont icon-yinfu"> </i>}
            {isShowSongPrev && <img src={albumURL} alt="" />}
          </div>
        </div>
        <div className="control-btn">
          <button onClick={(e) => define()}>确定</button>
          <button onClick={(e) => cancel()}>取消</button>
        </div>
      </div>
      <div className="song-list" style={{ display: isShow ? 'none' : 'block' }}>
        <div className="search-outer">
          <i className="iconfont icon-search"> </i>
          <input type="text" placeholder="歌曲名称" onInput={(e: FormEvent<HTMLInputElement>) => songInp(e)} />
        </div>
        <ul className="songs" ref={ulRef}>
          {songList &&
            songList.length !== 0 &&
            songList.map((item, index) => {
              return (
                <li key={item.id}>
                  <div className="song-name text-nowrap" onClick={(e) => selectSong(item)}>
                    {item.name}
                  </div>
                  <div className="album-name text-nowrap">{item.album.name}</div>
                </li>
              );
            })}
        </ul>
        <div className="back">
          <button onClick={(e) => changeShow()}>返回</button>
        </div>
      </div>
    </PublishWrapper>
  );
});
export default Publish;
