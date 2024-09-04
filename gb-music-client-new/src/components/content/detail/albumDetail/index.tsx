import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { Map } from 'immutable';
import { CheckOutlined } from '@ant-design/icons';
import { getAlbumDetail } from '../../../../network/album';
import { formatTime } from '../../../../utils/format';
import { AlbumDetailWrapper, LeftContent, RightContent, CenterContentWrapper } from './style';
import { IAlbumDetail } from '../../../../constant/albumDetail';
import TabControl from '../../../common/tabControl';
import SongList from '../../songList';
import AlbumComment from './childCpn/comment/index';
import { cancelSub, sub } from '../../../../network/subscriber';
import Subscriber from './childCpn/subscriber';
import { useDispatch, useSelector } from 'react-redux';
import { changeUserDetailAction } from '../../../../views/Login/store/actionCreators';
import HotAlbum from './childCpn/hotAlbum';
import { ILogin, IUserDetail } from '../../../../constant/store/login';

const AlbumDetail: FC<RouteComponentProps<any, any, { id: string }>> = (props): ReactElement => {
  const { id } = props.location.state;
  const [aId, setAid] = useState<string>(id);
  const [albumDetail, setDetail] = useState<IAlbumDetail>();

  const dispatch = useDispatch();
  const { userDetail } = useSelector<Map<string, ILogin>, { userDetail: IUserDetail }>((state) => ({
    userDetail: state.getIn(['loginReducer', 'login', 'userDetail'])
  }));

  useEffect(() => {
    getAlbumDetail(aId).then((data: any) => {
      setDetail(data);
    });
  }, [aId]);
  //function handle
  const subAlbum = (): void => {
    if (!isSub()) {
      sub(aId, 'alId').then((data) => {
        dispatch(changeUserDetailAction());
      });
    } else if (isSub()) {
      cancelSub(aId, 'alId').then((data) => {
        dispatch(changeUserDetailAction());
      });
    }
  };
  const isSub = () => {
    let flag = -1;
    if (userDetail.subscriber && userDetail.subscriber.album) {
      flag = userDetail.subscriber.album.findIndex((item: { id: string; name: string }, index: number) => {
        if (item) return item.id === aId;
        else {
          return false;
        }
      });
    }
    return flag !== -1;
  };
  const hotClick = (id: string) => {
    setAid(id);
  };
  const artistRouter = () => {
    if (albumDetail) {
      props.history.push({
        pathname: '/Home/artistDetail',
        state: {
          id: albumDetail.artist.id
        }
      });
    }
  };
  return (
    <AlbumDetailWrapper>
      <CenterContentWrapper>
        {albumDetail && (
          <LeftContent>
            <div className="header">
              <div className="img-container">
                <img src={albumDetail!.coverUrl} alt="" />
              </div>
              <div className="msg">
                <div className="title">{albumDetail.name}</div>
                {/*歌手信息*/}
                <div className="user-msg" onClick={(e) => artistRouter()}>
                  <div className="avatar">
                    <img src={albumDetail.artist.avatarUrl} alt="avatar" />
                  </div>
                  <div className="user-name">{albumDetail.artist.name}</div>
                </div>
                {/*收藏*/}
                <div className={`sub ${isSub() ? 'active' : ''}`} onClick={(e) => subAlbum()}>
                  {!isSub() && <i className="iconfont icon-xinjianshoucangjia"> </i>}
                  {isSub() && <CheckOutlined className="already" />}
                  {!isSub() && <span>收藏</span>}
                  {isSub() && <span>已收藏</span>}
                </div>
                {/*发行时间*/}
                <div className="publish-time">
                  <span>发行时间: </span>
                  <span>{formatTime(parseInt(albumDetail.publishTime), 'yyyy-MM-dd')}</span>
                </div>
                <div className="desc">
                  <span>简介: </span>
                  <span>{albumDetail.description}</span>
                </div>
              </div>
            </div>
            <div className="body-content">
              <TabControl
                list={['歌曲列表', '评论', '收藏者']}
                contentName={['songList', 'comment', 'sub']}
                comment={<AlbumComment id={albumDetail.id} />}
                songList={<SongList albumDetail={albumDetail} />}
                sub={<Subscriber id={albumDetail.id} />}
              />
            </div>
          </LeftContent>
        )}
        <RightContent>
          <HotAlbum id={aId} onClick={(id: string) => hotClick(id)} />
        </RightContent>
      </CenterContentWrapper>
    </AlbumDetailWrapper>
  );
};
export default withRouter(memo(AlbumDetail));
