import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router-dom';
import CateList from '../../../../components/common/cateList';
import { getAlbumCate, getCateAlbumDetail } from '../../../../network/album';
import { ICategory } from '../../../../constant/category';
import { IAlbum } from '../../../../constant/album';
import MsgItem from '../../../../components/content/msgItem';

import { AlbumWrapper } from './style';
import { holder } from '../../../../utils/holder';
import { Empty, Image, Pagination } from 'antd';
import placeholder from '../../../../assets/img/holder/placeholder.png';

interface ICateAlbum {
  category: ICategory;
  album: IAlbum[];
  count: number;
}
const Album: FC<RouteComponentProps> = (props): ReactElement => {
  const [cateList, setCateList] = useState<ICategory[]>([]);
  const [albumDetail, setAlbum] = useState<ICateAlbum>();
  const [count, setCount] = useState<number>(0);
  const [cateId, setCateId] = useState<string>('');
  useEffect(() => {
    getAlbumCate<ICategory[]>().then((data) => {
      if(data.length!==0){
        setCateList(data);
        cateClick(data[0], 0);
      }
    });
  }, []);
  const cateClick = (item: ICategory, index: number) => {
    setCateId(item.id);
    getCateAlbumDetail<ICateAlbum>(item.id, 0, 28).then((data) => {
      setAlbum(data);
      setCount(data.count);
    });
  };
  const albumRouter = (item: IAlbum, index: number) => {
    props.history.push({
      pathname: '/Home/albumDetail',
      state: {
        id: item.id
      }
    });
  };
  const artistRouter = (item: IAlbum) => {
    props.history.push({
      pathname: '/Home/artistDetail',
      state: {
        id: item.artist?.id
      }
    });
  };
  const changePage = (val: number) => {
    getCateAlbumDetail<ICateAlbum>(cateId, (val - 1) * 28, 28).then((data) => {
      setAlbum(data);
      setCount(data.count);
    });
  };
  return (
    <AlbumWrapper className="center-content">
      <div className="album-header">
        <CateList cateList={cateList} cateClick={(item: ICategory, index: number) => cateClick(item, index)} />
      </div>
      <div className="cate-album-detail">
        <ul>
          {albumDetail &&
            albumDetail.album &&
            albumDetail.album.map((item, index) => {
              return (
                <li key={item.id}>
                  <MsgItem
                    isShowPlayCount={false}
                    img={
                      <Image
                        width={130}
                        height={130}
                        src={item.coverUrl}
                        preview={false}
                        className="cover-img"
                        fallback={placeholder}
                        placeholder={<Image preview={false} src={placeholder} width={130} height={130} />}
                      />
                    }
                    state={<span>{item.name}</span>}
                    itemWidth="150px"
                    scale={0.86}
                    cover={
                      <div className="mask" onClick={(e) => albumRouter(item, index)}>
                        {' '}
                      </div>
                    }
                  />
                  <p className="artist-name" onClick={(e) => artistRouter(item)}>
                    {item.artist?.name}
                  </p>
                </li>
              );
            })}
          {albumDetail &&
            albumDetail.album &&
            holder(albumDetail!.album.length, 7).map((item: number) => {
              return <li key={item}> </li>;
            })}
        </ul>
        {count > 28 && (
          <div className="page">
            <Pagination
              defaultCurrent={1}
              total={count}
              pageSize={28}
              showTitle={false}
              showSizeChanger={false}
              onChange={(val: number) => changePage(val)}
            />
          </div>
        )}
        {count < 1 && (
          <div className="empty">
            <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'暂无专辑'} />
          </div>
        )}
      </div>
    </AlbumWrapper>
  );
};
export default memo(Album);
