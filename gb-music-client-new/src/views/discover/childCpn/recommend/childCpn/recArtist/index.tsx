import React, { memo, FC, ReactElement, useEffect, useState, useRef, MouseEvent } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { getRecArtist } from '../../../../../../network/artist';
import {Carousel, Empty, Image} from 'antd';
import MsgItem from '../../../../../../components/content/msgItem';
import { RecArtistWrapper } from './style';

import { IArtist } from '../../../../../../constant/artist';
import { CarouselRef } from 'antd/lib/carousel';
import placeholder from '../../../../../../assets/img/holder/user-placehoder.png';
const RecArtist: FC<RouteComponentProps> = (props): ReactElement => {
  const [recArtist, setArtist] = useState<IArtist[] | []>([]);
  const carouselRef = useRef<CarouselRef>(null);
  useEffect(() => {
    getRecArtist<IArtist[]>(0, 12).then((data) => {
      //console.log(data);
      setArtist(data);
    });
  }, []);
  //function handle
  const leftClick = () => {
    carouselRef.current?.prev();
  };
  const rightClick = () => {
    carouselRef.current?.next();
  };
  const artistRouter = (item: IArtist, index: number): void => {
    props.history.push({
      pathname: '/Home/artistDetail',
      state: {
        id: item.id
      }
    });
  };
  return (
    <RecArtistWrapper>
      <Carousel ref={carouselRef} dots={false}>
        {[0, 1].map((item, index) => {
          return (
            <ul className="artist-list" key={item}>
              {recArtist.length !== 0 &&
                recArtist.slice(item * 6, (item + 1) * 6).map((item, index) => {
                  return (
                    <li key={item.id}>
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
                        state={<span>{item.name}</span>}
                        isShowPlayCount={false}
                        itemWidth="120px"
                        scale={1}
                        cover={
                          <div className="mask" onClick={(e) => artistRouter(item, index)} title={item.name}>
                            {' '}
                          </div>
                        }
                      />
                    </li>
                  );
                })}
              {
                recArtist && recArtist.length==0 &&<Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={"暂无热门歌手"}/>
              }
            </ul>

          );
        })}
      </Carousel>
      <div className="left-arrow" onClick={(e: MouseEvent<HTMLDivElement>) => leftClick()}>
        <i className="iconfont icon-arrow-right"> </i>
      </div>
      <div className="right-arrow" onClick={(e: MouseEvent<HTMLDivElement>) => rightClick()}>
        <i className="iconfont icon-arrow-right"> </i>
      </div>
    </RecArtistWrapper>
  );
};
export default withRouter(memo(RecArtist));
