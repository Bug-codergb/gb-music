import styled from 'styled-components';
export const ChannelDetailWrapper = styled.div`
  background-color: #f5f5f5;
`;
export const CenterContent = styled.div`
  width: 1190px;
  margin: 0 auto;
  padding: 20px 15px;
  border-left: 1px solid #d3d3d3;
  border-right: 1px solid #d3d3d3;
  background-color: #fff;
`;
export const LeftContent = styled.div`
  width: 70%;
  border-right: 1px solid #e0e0e0;
  .header {
    display: flex;
    margin: 0 0 20px 0;
  }
  .img-container {
    width: 170px;
    height: 170px;
    img {
      width: 100%;
    }
  }
  .right-msg {
    margin: 0 0 0 20px;
    width: 72%;
    .channel-name {
      font-size: 22px;
      color: #000;
      font-weight: bolder;
      margin: 0 0 15px 0;
    }
    .sub {
      background-color: #fff;
      margin: 0 0 15px 0;
      .already {
        margin: 0 5px 0 0;
        padding: 6px 0;
        svg {
          font-size: 16px;
        }
      }
      &.active {
        i {
          font-size: 18px;
          color: #ec4141;
        }
        span {
          font-size: 13px;
          color: #ec4141;
        }
      }
    }
    .desc {
      margin: 10px 0 10px 0;
      width: 90%;
      span {
        font-size: 13px;
      }
    }
  }
`;
export const RightContent = styled.div`
  width: 28%;
`;
