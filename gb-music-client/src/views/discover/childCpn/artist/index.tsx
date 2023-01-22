import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { getArtistCate, getArtistType, getCateArtist } from '../../../../network/artist';

import { ICategory } from '../../../../constant/category';
import { IArtist } from '../../../../constant/artist';
import CateList from '../../../../components/common/cateList';

import MsgItem from '../../../../components/content/msgItem';
import { Empty, Image, Pagination } from 'antd';

import placeholder from '../../../../assets/img/holder/placeholder.png';

import { ArtistWrapper } from './style';
import { holder } from '../../../../utils/holder';
import TypeList from '../../../../components/common/typeList';

const Artist: FC<RouteComponentProps> = (props): ReactElement => {
  const [count, setCount] = useState<number>(0);
  const [cates, setCates] = useState<ICategory[]>([]);
  const [types, setTypes] = useState<ICategory[]>([]);
  const [artists, setArtists] = useState<IArtist[]>([]);
  const [cate, setCate] = useState<string>('0');
  const [type, setType] = useState<string>('0');
  const [letter, setLetter] = useState<string>('全部');
  const letters: string[] = [
    '全部',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  useEffect(() => {
    getArtistCate<ICategory[]>().then((data) => {
      setCates(data);
      //cateClick(data[0],0);
    });
    getArtistType<ICategory[]>().then((data) => {
      setTypes(data);
    });
    getCateArtist<{ artists: IArtist[]; count: number }>('0', '0', '全部', 0, 40).then((data) => {
      setArtists(data.artists);
      setCount(data.count);
    });
  }, []);
  const cateClick = (item: ICategory, index: number) => {
    getCateArtist(item.id, type, letter, 0, 40).then((data: any) => {
      setArtists(data.artists);
      setCount(data.count);
      setCate(item.id);
    });
  };
  //type
  const typeClick = (item: ICategory, index: number) => {
    getCateArtist(cate, item.id, letter, 0, 40).then((data: any) => {
      setArtists(data.artists);
      setType(item.id);
      setCount(data.count);
    });
  };
  //letter
  const letterClick = (item: string, index: number) => {
    getCateArtist(cate, type, item, 0, 40).then((data: any) => {
      setArtists(data.artists);
      setLetter(item);
      setCount(data.count);
    });
  };
  const playlistRouter = (item: IArtist, index: number) => {
    props.history.push({
      pathname: '/Home/artistDetail',
      state: {
        id: item.id
      }
    });
  };
  const changePage = (val: number) => {
    getCateArtist(cate, type, letter, (val - 1) * 40, 40).then((data: any) => {
      setArtists(data.artists);
    });
  };
  return (
    <ArtistWrapper className="center-content">
      <ul className="filter">
        <li>
          <span className="filter-name">语种: </span>
          <CateList cateList={cates} cateClick={(item, index) => cateClick(item, index)} />
        </li>
        <li>
          <span className="filter-name">分类: </span>
          <CateList cateList={types} cateClick={(item, index) => typeClick(item, index)} />
        </li>
        <li>
          <span className="filter-name">筛选: </span>
          <TypeList types={letters} letterClick={(item, index) => letterClick(item, index)} />
        </li>
      </ul>
      <ul className="cate-artist">
        {artists.length !== 0 &&
          artists.map((item, index) => {
            return (
              <li key={item.id} title={item.name}>
                <MsgItem
                  img={
                    <Image
                      width={120}
                      height={120}
                      src={item.avatarUrl}
                      preview={false}
                      fallback={placeholder}
                      placeholder={<Image preview={false} src={placeholder} width={120} height={120} />}
                    />
                  }
                  state={<span className="artist-name">{item.name}</span>}
                  isShowPlayCount={false}
                  itemWidth="120px"
                  scale={1}
                  cover={
                    <div className="mask" onClick={(e) => playlistRouter(item, index)}>
                      {' '}
                    </div>
                  }
                />
              </li>
            );
          })}
        {artists &&
          holder(artists.length, 9).map((item: number) => {
            return <li key={item}> </li>;
          })}
      </ul>
      {count > 40 && (
        <div className="page">
          <Pagination
            defaultCurrent={1}
            total={count}
            pageSize={40}
            showTitle={false}
            showSizeChanger={false}
            onChange={(val: number) => changePage(val)}
          />
        </div>
      )}
      {count < 1 && (
        <div className="empty">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'尽情期待'} />
        </div>
      )}
    </ArtistWrapper>
  );
};
export default withRouter(memo(Artist));
