import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { CenterContentWrapper, ToplistDetailWrapper, RightContent, LeftContent } from './style';
import { getToplistDetail } from '../../../../network/toplist/toplist';
import { IToplist } from '../../../../constant/toplist';
import { ISong } from '../../../../constant/song';
import UserMsg from '../../../common/userMsg';
import { formatTime } from '../../../../utils/format';
import TabControl from '../../../common/tabControl';
import SongList from '../playlistDetail/childCpn/songList';
import Comment from './childCpn/comment';
import SimiToplist from './childCpn/simiToplist';

interface IDetail extends IToplist {
  songs: ISong[];
}
const ToplistDetail: FC<RouteComponentProps<any, any, { id: string; name: string; userId: string }>> = (
  props
): ReactElement => {
  const { id, name } = props.location.state;
  const [detail, setDetail] = useState<IDetail>();
  const [tid, setTId] = useState<string>(id);
  const [tName,setTname]=useState<string>(name);
  useEffect(() => {
    getToplistDetail(tid).then((data: any) => {
      setDetail(data);
    });
  }, [tid]);
  const userRouter = (id: string) => {
    props.history.push({
      pathname: '/Home/userDetail',
      state: {
        userId: id,
        id: '',
        name: ''
      }
    });
  };
  const toplistClick = (id: string,name:string) => {
    setTId(id);
    setTname(name)
  };
  return (
    <ToplistDetailWrapper>
      <CenterContentWrapper>
        {detail && (
          <LeftContent>
            <div className="toplist-detail-header">
              <div className="img-container">
                <img src={detail.coverUrl} alt="" />
              </div>
              <div className="msg">
                <div className="toplist-name">{detail.name}</div>
                <div className="user-time">
                  <UserMsg
                    avatarUrl={detail.user!.avatarUrl}
                    userName={detail.user!.userName}
                    userId={detail.user!.userId}
                    imgWidth="25px"
                    onClick={(id: string) => userRouter(id)}
                  />
                  <div className="time">
                    <span>创建于:</span>
                    <span>{formatTime(detail.createTime!, 'yyyy-MM-dd')}</span>
                  </div>
                </div>
                <div className="count">
                  <div className="song-count">
                    <span>歌曲:</span>
                    <span>{detail.songs.length}</span>
                  </div>
                  <div className="play-count">
                    <span>播放量:</span>
                    <span>{detail.playCount}</span>
                  </div>
                </div>
                <div className="desc">
                  <span>简介:</span>
                  {detail.description}
                </div>
              </div>
            </div>
            <div className="body-content">
              {detail.songs && (
                <TabControl
                  list={['歌曲列表', '评论']}
                  contentName={['songList', 'comment', 'sub']}
                  songList={<SongList songs={detail.songs} isShowUp={tName === '飙升榜'} tId={tid} />}
                  comment={<Comment id={detail.id} />}
                />
              )}
            </div>
          </LeftContent>
        )}
        <RightContent>
          <SimiToplist id={tid} onClick={(id,name) => toplistClick(id,name)} />
        </RightContent>
      </CenterContentWrapper>
    </ToplistDetailWrapper>
  );
};
export default withRouter(memo(ToplistDetail));
