import React, { memo, FC, ReactElement, useEffect, useState, useRef } from 'react';
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts";
import { Carousel, Image } from 'antd';
import { CarouselRef } from 'antd/lib/carousel';
import { BannerWrapper } from './style';
import { IBanner } from '@/constant/banner';
import { getBanner } from '@/network/banner';

import { changeSongDetailAction } from '@/components/content/playCoin/store/asyncThunk';
import { useNavigate } from 'react-router-dom';
import placeholder from '../../../../../../assets/img/holder/banner-holder.png';

const Banner: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [banner, setBanner] = useState<IBanner[]>([]);
  const [picUrl, setPicUrl] = useState<string>('');
  const dispatch = useAppDispatch();
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
        dispatch(changeSongDetailAction({id:item.songId!}));
        break;
      case 3:
        navigate('/Home/videoDetail',{
          state: {
            id: item.vId
          }
        });
        break;
      case 2:
        navigate('/Home/albumDetail',{
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
                    width={1220}
                    height={300}
                    src={item.picUrl}
                    preview={false}
                    placeholder={<Image preview={false} src={placeholder} width={1220} height={300} />}
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
export default memo(Banner);
