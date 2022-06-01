import styled from 'styled-components';
export const ToplistDetailWrapper = styled.div`
  background-color: #f5f5f5;
`;
export const CenterContentWrapper = styled.div`
  width: 1190px;
  margin: 0 auto;
  background-color: #fff;
  border-right: 1px solid #d3d3d3;
  border-left: 1px solid #d3d3d3;
  display: flex;
  align-items: flex-start;
`;
export const LeftContent = styled.div`
  width: 920px;
  border-right: 1px solid #e0e0e0;
  .toplist-detail-header {
    padding: 30px 20px 30px 30px;
    display: flex;
    .img-container {
      width: 170px;
      height: 170px;
      img {
        width: 100%;
      }
    }
    .msg {
      margin: 0 0 0 20px;
      .toplist-name {
        font-weight: bold;
        font-size: 24px;
      }
      .user-time {
        display: flex;
        align-items: center;
        margin: 10px 0;
        .time {
          margin: 0 0 0 30px;
          span {
            font-size: 12px;
          }
        }
      }
      .count {
        margin: 0 0 10px 0;
        display: flex;
        align-items: center;
        .play-count,
        .song-count {
          margin: 0 20px 0 0;
          span {
            font-size: 13px;
            color: #676767;
          }
        }
      }
      .desc {
        font-size: 13px;
        color: #262626;
        span {
          font-size: 13px;
        }
      }
    }
  }
  .body-content {
    padding: 0 0 0 30px;
  }
`;
export const RightContent = styled.div`
  flex: 1;
  padding: 20px 0;
`;
