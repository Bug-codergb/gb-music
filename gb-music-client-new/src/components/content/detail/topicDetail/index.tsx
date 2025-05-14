import React, { memo, FC, ReactElement, useEffect, useState, MouseEvent } from 'react';
import { TopicDetailWrapper, CenterContent } from './style';
import { useNavigate,useLocation } from 'react-router-dom';
import { getTopicDetail } from '../../../../network/topic';
import { ITopic } from '../../../../constant/topic';
import { IMoment } from '../../../../constant/moment';
import { formatTime } from '../../../../utils/format';
import Reply from '../../../common/reply';
import Comment from '../../../common/comment';
import { IComment } from '../../../../constant/comment';
import { useAppDispatch, useAppSelector } from '@/store/hooks';
import { getAllComment, publishComment } from '../../../../network/comment';
import { thumb as thumbMoment } from '../../../../network/thumbs';
import { changeUserDetailAction } from '@/views/Login/store/asyncThunk';
import { changeSongDetailAction } from '../../playCoin/store/asyncThunk';
import { delMoment, getAllMoment } from '@/network/moment';
import { Dropdown, type MenuProps, Modal } from 'antd';
import { DeleteOutlined } from '@ant-design/icons';

interface ITopicDetail extends ITopic {
  moments: IMoment[];
}

const TopicDetail: FC<{ id: string }> = (props): ReactElement => {
  const location = useLocation();
  const { userMsg } = useAppSelector((state) => {
    return state['loginReducer'];
  });
  const navigate = useNavigate()
  const [modal, contextHolder] = Modal.useModal();
  const { id } = location.state;
  const [comment, setComment] = useState<IComment[]>([]);
  const [total, setTotal] = useState<number>(0);
  const [currentIndex, setCurrentIndex] = useState<number>(0);
  const [liveIndex, setLiveIndex] = useState<number>(-1);

  const [topicDetail, setTopicDetail] = useState<ITopicDetail>();
  const items: MenuProps['items'] = [
    {
      key: '1',
      icon: <DeleteOutlined />,
      label: <div>删除</div>
    }
  ];
  useEffect(() => {
    getTopicDetail<ITopicDetail>(id, '0', '30').then((data) => {
      setTopicDetail(data);
    });
  }, [id]);
  useEffect(() => {
    document.addEventListener('click', () => {
      setLiveIndex(-1);
    });
  }, []);
  const dispatch = useAppDispatch();
  //function handle
  const publish = (content: string, item: IMoment) => {
    publishComment(content, 'mId', item.id).then((data) => {
      getAllComment<{ count: number; comments: IComment[] }>(item.id, 'mId', 0, 30).then((data) => {
        setComment(data.comments);
        setTotal(data.count);
      });
    });
  };
  const thumb = (item: IMoment) => {
    thumbMoment('momentId', item.id).then((data) => {
      dispatch(changeUserDetailAction());
    });
  };
  const showComment = (item: IMoment, index: number) => {
    setCurrentIndex(index);
    getAllComment<{ count: number; comments: IComment[] }>(item.id, 'mId', 0, 30).then((data) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  };
  const reply = (item:IMoment,index:number) => {
    getAllComment<{ comments: IComment[]; count: number }>(item.id, 'mId', 0, 30).then((data) => {
      setComment(data.comments);
      setTotal(data.count);
    });
  };
  const playSong = (item: IMoment) => {
    console.log(item);
    dispatch(changeSongDetailAction({id:item.song.id}));
  };
  //删除按钮显示
  const delClick = (e: MouseEvent<HTMLDivElement>, item: IMoment, index: number): void => {
    e.stopPropagation();
    setLiveIndex(index);
  };
  const config = {
    title: '提示',
    content: (
      <>
        <div>确认删除吗？</div>
      </>
    )
  };
  const handleDelete = async (item: any) => {
    if(!userMsg || Object.keys(userMsg).length === 0){
      modal.confirm({
        type:"warning",
        title:"提示",
        content:"您还未登录，登录后享受更多内容，去登录？"
      }).then((ret)=>{
        if(ret){
          navigate("/Login")
        }
      })
      return
    }
    const confirmed = await modal.confirm(config);

    if(confirmed){
      delMoment(item.id).then((data) => {
        getTopicDetail<ITopicDetail>(id, '0', '30').then((data) => {
          setTopicDetail(data);
        });
      });
    }
  };
  return (
    <TopicDetailWrapper>
      <CenterContent>
        <div className="header" style={{ backgroundImage: `url(${topicDetail?.coverUrl})` }}>
          <div className="content">
            <div className="title">{topicDetail?.name}</div>
          </div>
        </div>
        <ul className="moment-list">
          {topicDetail &&
            topicDetail.moments &&
            topicDetail.moments.length !== 0 &&
            topicDetail.moments.map((item, index) => {
              return (
                <li key={item.id}>
                  <div className="avatar">
                    <img src={item.user.avatarUrl} alt="" />
                  </div>
                  <div className="msg">
                    <div className="user-name">{item.user.userName}</div>
                    <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd hh:mm:ss')}</div>
                    <div className="content">{item.content}</div>
                    <div className="music">
                      <div className="img-container" onClick={(e) => playSong(item)}>
                        <img src={item.song.album.coverUrl} alt="" />
                      </div>
                      <div className="song-info">
                        <div className="song-name">{item.song.name}</div>
                        <div className="artist-name">{item.song.artist.name}</div>
                      </div>
                    </div>
                    <div className="picture">
                      <img src={item.picUrl} alt="" />
                    </div>
                    {/*评论*/}
                    {
                      <Reply
                        isShowBtn={true}
                        isShowPublish={false}
                        onClick={(content: string) => publish(content, item)}
                        thumbClick={() => thumb(item)}
                        showCommentClick={() => showComment(item, index)}
                        id={item.id}
                      />
                    }
                    {currentIndex === index && (
                      <Comment comments={comment} onClick={() => reply(item,index)} total={total} isPage={true} />
                    )}
                  </div>
                  {/*操作*/}
                  <div className="operator" onClick={(e) => delClick(e, item, index)}>
                    <Dropdown
                      trigger="hover"
                      menu={{ items, onClick: () => handleDelete(item) }}
                      placement="bottom"
                      arrow={{ pointAtCenter: true }}
                    >
                      <i className="iconfont icon-MoreVertical"> </i>
                    </Dropdown>
                  </div>
                </li>
              );
            })}
        </ul>
      </CenterContent>
      {
        contextHolder
      }
    </TopicDetailWrapper>
  );
};
export default memo(TopicDetail);
