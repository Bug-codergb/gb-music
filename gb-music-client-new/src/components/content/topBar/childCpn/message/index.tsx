import React, { memo, FC, ReactElement, useEffect, useState, MouseEvent } from 'react';
import { MessageWrapper } from './style';
import { getAllMsg, readMessage } from '../../../../../network/message';
import { IMessage } from '../../../../../constant/message';
import Comment from './childCpn/comment';
import Album from './childCpn/album';
import Video from './childCpn/video';
import Playlist from './childCpn/playlist';
import Channel from './childCpn/channel';
import { useNavigate } from 'react-router-dom';
const Message: FC = (props): ReactElement => {
  const navigate= useNavigate()
  const [count, setCount] = useState<number>(0);
  const [msg, setMsg] = useState<IMessage>();
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const [msgItem, setMsgItem] = useState<string>('');
  const msgList = ['评论', '专辑', '视频', '歌单', '声音'];
  useEffect(() => {
    getAllMsg().then((data: any) => {
      setMsg(data.message);
      setMsgItem(msgList[0]);
    });
  }, []);
  const liClick = (e: MouseEvent<HTMLLIElement>, item: string, index: number) => {
    e.stopPropagation();
    setCurrentIndex(index);
    setMsgItem(item);
  };
  const read = () => {
    if (msg) {
      const { album, channel, comment, playlist, video } = msg;
      let aIds = album.map((item: any) => {
        return item.id;
      });
      let cIds = channel.map((item: any) => {
        return item.id;
      });
      let pIds = playlist.map((item: any) => {
        return item.id;
      });
      let vIds = video.map((item: any) => {
        return item.id;
      });
      let comIds = comment.map((item: any) => {
        return item.id;
      });
      let ids: string[] = aIds.concat(cIds).concat(pIds).concat(vIds).concat(comIds);
      readMessage(ids).then((data) => {
        console.log(data);
      });
    }
  };
  const checkoutAllMsg = () => {
    navigate('/Home/msgDetail')

  };
  return (
    <MessageWrapper>
      <div className="title">
        <div className="info" onClick={(e) => checkoutAllMsg()}>
          全部消息
        </div>
        <div className="already" onClick={(e) => read()}>
          一键已读
        </div>
      </div>
      <ul className="msg-list">
        {msgList &&
          msgList.map((item, index) => {
            return (
              <li
                key={item}
                className={currentIndex === index ? 'active' : ''}
                onClick={(e) => liClick(e, item, index)}
              >
                {item}
              </li>
            );
          })}
      </ul>
      <div className="msg-content">
        {msgItem === '评论' && <Comment comment={msg?.comment} />}
        {msgItem === '专辑' && <Album albums={msg?.album} />}
        {msgItem === '视频' && <Video video={msg?.video} />}
        {msgItem === '歌单' && <Playlist playlist={msg?.playlist} />}
        {msgItem === '声音' && <Channel channel={msg?.channel} />}
      </div>
    </MessageWrapper>
  );
};
export default memo(Message);
