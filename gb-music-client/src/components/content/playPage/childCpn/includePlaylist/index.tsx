import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { IncludePlaylistWrapper } from './style';
import { getIncludePlaylist } from '../../../../../network/playlist';
import { IPlaylist } from '../../../../../constant/playlist';
import { RouteComponentProps, withRouter } from 'react-router-dom';

interface IProps extends RouteComponentProps {
  id: string;
}
const IncludePlaylist: FC<IProps> = memo((props): ReactElement => {
  const [playList, setPlayList] = useState<IPlaylist[]>([]);
  const { id } = props;
  useEffect(() => {
    if (id) {
      getIncludePlaylist(id).then((data: any) => {
        setPlayList(data);
      });
    }
  }, [id]);
  const playlistRouter = (item: IPlaylist) => {
    props.history.push({
      pathname: '/Home/playlistDetail',
      state: {
        id: item.id
      }
    });
  };
  const userRouter = (item: IPlaylist) => {
    if (item.user) {
      props.history.push({
        pathname: '/Home/userDetail',
        state: {
          userId: item.user?.userId
        }
      });
    }
  };
  return (
    <IncludePlaylistWrapper>
      {playList.length !== 0 &&
        playList.map((item, index) => {
          return (
            <li key={item.id}>
              <div className="img-container" onClick={(e) => playlistRouter(item)}>
                <img src={item.coverUrl} alt={item.name} />
              </div>
              <div className="msg">
                <div className="name text-nowrap" onClick={(e) => playlistRouter(item)}>
                  {item.name}
                </div>
                <div className="creator text-nowrap" onClick={(e) => userRouter(item)}>
                  by {item.user!.userName}
                </div>
              </div>
            </li>
          );
        })}
    </IncludePlaylistWrapper>
  );
});
export default withRouter(IncludePlaylist);
