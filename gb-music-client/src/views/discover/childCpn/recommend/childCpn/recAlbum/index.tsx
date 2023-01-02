import React, { memo, FC, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import {Empty, Image, Spin} from 'antd';
import MsgItem from '../../../../../../components/content/msgItem';
import placeholder from '../../../../../../assets/img/holder/placeholder.png';
import { getRecAlbum } from '../../../../../../network/album';
import { IAlbum } from '../../../../../../constant/album';
import { RecAlbumWrapper } from './style';

interface IProps extends RouteComponentProps {}
const RecAlbum: FC<IProps> = (props) => {
  const [recAlbum, setAlbum] = useState<IAlbum[]>([]);
  useEffect(() => {
    getRecAlbum<IAlbum[]>(0, 10).then((data) => {
      setAlbum(data);
    });
  }, []);
  const albumRouter = (item: IAlbum, index: number) => {
    props.history.push({
      pathname: '/Home/albumDetail',
      state: {
        id: item.id
      }
    });
  };
  return (
    <Spin size={'large'} tip={'加载中...'} spinning={recAlbum.length === 0} style={{ backgroundColor: '#fef9f9' }}>
      <RecAlbumWrapper style={{ height: recAlbum.length === 0 ? '200px' : 'auto' }}>
        <ul className="rec-album">
          {recAlbum.length !== 0 &&
            recAlbum.map((item, index) => {
              return (
                <li key={item.id}>
                  <MsgItem
                    img={
                      <Image
                        width={130}
                        height={130}
                        src={item.coverUrl}
                        preview={false}
                        placeholder={<Image preview={false} src={placeholder} width={130} height={130} />}
                      />
                    }
                    isShowPlayCount={false}
                    state={<span>{item.name}</span>}
                    itemWidth="150px"
                    scale={0.86}
                    cover={
                      <div className="mask" onClick={(e) => albumRouter(item, index)}>
                        {' '}
                      </div>
                    }
                  />
                </li>
              );
            })}
        </ul>
        {
          recAlbum && recAlbum.length===0 &&<Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={"暂无热门专辑"}/>
        }
      </RecAlbumWrapper>
    </Spin>
  );
};
export default withRouter(memo(RecAlbum));
