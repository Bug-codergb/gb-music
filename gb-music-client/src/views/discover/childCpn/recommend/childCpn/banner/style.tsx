import styled from 'styled-components';
export const BannerWrapper: any = styled.div`
  overflow: hidden;
  position: relative;
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
    width: 1190px;
    margin: 0 auto;
    .img-container {
      width: 1160px;
      img {
        width: 100%;
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
