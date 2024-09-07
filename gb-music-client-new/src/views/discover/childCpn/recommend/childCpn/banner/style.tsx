import styled from 'styled-components';
export const BannerWrapper: any = styled.div`
  overflow: hidden;
  position: relative;
  width: 100%;
  height: 240px;
  .bgc {
    position: absolute;
    width: 100%;
    height: 100%;
    background-image: url(${(props) => (props as any).bgc});
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    filter: blur(30px);
  }
  .banner-outer {
    width: 70%;
    margin: 0 auto;
    height: 100%;
    .ant-carousel{
      height: 100%;
      .slick-slider{
        height: 100%;
        .slick-list{
        height: 100%;
          .slick-track{
            height: 100%;
            overflow-y: hidden;
          }
      }
      }
    }
    .img-container {
      width: 100%;
      height: 240px;
      .ant-image{
        width: 100%!important;
        height: 100%!important;
      }
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    .prev,
    .next {
      position: absolute;
      z-index: 9999;
      top: 50%;
      transform: translate(-50%, -50%);
      padding: 20px 0;
      cursor: pointer;
      i {
        color: #fff;
        font-size: 30px;
      }
    }
    .prev {
      left: 10%;
      transform: rotateZ(180deg) translate(50%, 50%);
    }
    .next {
      left: 90%;
    }
  }
`;
