import React, { memo, FC, ReactElement, useEffect, useState, useRef } from 'react';
import { useDispatch } from 'react-redux';
import { Carousel, Image } from 'antd';
import { CarouselRef } from 'antd/lib/carousel';
import { BannerWrapper } from './style';
import { IBanner } from '../../../../../../constant/banner';
import { getBanner } from '../../../../../../network/banner';

import { changeSongDetailAction } from '../../../../../../components/content/playCoin/store/actionCreators';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import placeholder from '../../../../../../assets/img/holder/banner-holder.png';

const Banner: FC<RouteComponentProps> = (props): ReactElement => {
  const [banner, setBanner] = useState<IBanner[]>([]);
  const [picUrl, setPicUrl] = useState<string>('');
  const dispatch = useDispatch();
  useEffect(() => {
    getBanner<IBanner[]>().then((data) => {
      setBanner(data);
    });
  }, []);
  const bannerRef = useRef<CarouselRef>(null);
  const change = (from: number, to: number): void => {
    if(banner && banner[to]){
      setPicUrl(banner[to].picUrl);
    }
  };
  const prevClick = (): void => {
    bannerRef.current?.prev();
  };
  const nextClick = (): void => {
    bannerRef.current?.next();
  };
  const bannerClick = (item: IBanner, index: number) => {
    switch (item.type) {
      case 1:
        dispatch(changeSongDetailAction(item.songId!));
        break;
      case 3:
        props.history.push({
          pathname: '/Home/videoDetail',
          state: {
            id: item.vId
          }
        });
        break;
      case 2:
        props.history.push({
          pathname: '/Home/albumDetail',
          state: {
            id: item.alId
          }
        });
        break;
      default:
        return;
    }
  };
  return (
    <BannerWrapper bgc={picUrl}>
      <div className="bgc"> </div>
      <div className="banner-outer">
        <div className="prev" onClick={(e) => prevClick()}>
          <i className="iconfont icon-arrow-right"> </i>
        </div>
        <div className="next" onClick={(e) => nextClick()}>
          <i className="iconfont icon-arrow-right"> </i>
        </div>
        <Carousel
          autoplay={true}
          beforeChange={(from: number, to: number) => change(from, to)}
          effect="fade"
          ref={bannerRef}
        >
          {banner &&
            banner.length !== 0 &&
            banner.map((item, index) => {
              return (
                <div key={item.id} className="img-container">
                  <Image
                    width={1190}
                    height={370}
                    src={item.picUrl}
                    preview={false}
                    placeholder={<Image preview={false} src={placeholder} width={1190} height={370} />}
                    onClick={(e) => bannerClick(item, index)}
                  />
                </div>
              );
            })}
          {banner && banner.length < 1 && (
            <div>
              <Image width={1190} height={370} src={placeholder} preview={false} />
            </div>
          )}
        </Carousel>
      </div>
    </BannerWrapper>
  );
};
export default withRouter(memo(Banner));
