import styled from 'styled-components';
export const AlbumDetailWrapper = styled.div`
  background-color: #f5f5f5;
`;
export const CenterContentWrapper = styled.div`
  width: 1160px;
  margin: 0 auto;
  border-left: 1px solid #d3d3d3;
  border-right: 1px solid #d3d3d3;
  background-color: #fff;
  display: flex;
  flex-wrap: nowrap;
`;
export const LeftContent = styled.div`
  border-right: 1px solid #e0e0e0;
  width: 70%;
  .header {
    padding: 30px 0 30px 30px;
    display: flex;
    .img-container {
      width: 170px;
      height: 170px;
      overflow: hidden;
      img {
        width: 170px;
      }
    }
    .msg {
      margin: 0 0 0 20px;
      width: 70%;
      .title {
        font-size: 24px;
        font-weight: bold;
      }
      .user-msg {
        display: flex;
        align-items: center;
        margin: 10px 0;
        .avatar {
          width: 25px;
          height: 25px;
          overflow: hidden;
          border-radius: 50%;
          img {
            width: 100%;
          }
        }
        .user-name {
          font-size: 12px;
          color: #507daf;
          margin: 0 0 0 5px;
        }
      }
      .sub {
        .already {
          margin: 0 5px 0 0;
          padding: 6px 0;
          svg {
            font-size: 16px;
          }
        }
        &.active {
          span,
          i {
            color: #ec4141;
          }
        }
      }
      .publish-time,
      .desc {
        span {
          font-size: 13px;
          color: #373737;
        }
      }
      .publish-time {
        margin-top: 5px;
      }
      .desc {
        margin: 5px 0 0 0;
        span {
          color: #676767;
        }
      }
    }
  }
  .body-content {
    padding: 0 20px 0 30px;
  }
`;
export const RightContent = styled.div`
  width: 28%;
  padding: 30px 15px 0 15px;
`;
