import styled from 'styled-components';
export const PlaylistDetailWrapper = styled.div`
  background-color: #fff;
`;
export const CenterContentWrapper = styled.div`
  background-color: #fff;
  display: flex;
  flex-wrap: nowrap;
`;

export const LeftContent = styled.div`
  width: 70%;
  border-right: 1px solid #e0e0e0;
`;
export const RightContent = styled.div`
  width: 28%;
  box-sizing: border-box;
  padding: 30px 15px 0 15px;
`;

export const DetailHeader = styled.div`
  padding: 20px;
  display: flex;
  .img-container {
    width: 170px;
    height: 170px;
    overflow: hidden;
    border-radius: 5px;
    img {
      width: 170px;
    }
  }
  .msg {
    margin: 0 0 0 20px;
    flex: 1;
    .title {
      font-size: 22px;
      font-weight: bold;
    }
    .user-msg {
      margin: 7px 0;
      display: flex;
      align-items: center;
      .time {
        margin: 0 0 0 30px;
      }
    }
    .time {
      font-size: 13px;
      span {
        font-size: 13px;
      }
    }
    .sub {
      border: 1px solid #d8d8d8;
      display: flex;
      align-items: center;
      width: 100px;
      justify-content: center;
      border-radius: 15px;
      cursor: pointer;
      .already {
        margin: 0 5px 0 0;
        padding: 6px 0;
        svg {
          font-size: 16px;
        }
      }
      i {
        color: #656565;
        font-size: 18px;
        margin: 0 10px 0 0;
      }
      span {
        color: #656565;
        font-size: 13px;
      }
      &.active {
        i,
        span {
          color: #ec4141;
        }
      }
    }
    .cate {
      display: flex;
      align-items: flex-start;
      height: 16px;
      margin: 8px 0;
      cursor: pointer;
      span {
        font-size: 13px;
        display: block;
        margin: 0 5px 0 0;
      }
      .cate-list {
        display: flex;
        align-items: center;
        li {
          font-size: 13px;
          color: #0086b3;
          margin: 0 5px 0 0;
        }
      }
    }
    .song-play {
      margin: 8px 0 0 0;
      display: flex;
      align-items: center;
      .song-count,
      .play-count {
        font-size: 13px;
        margin: 0 10px 0 0;
        span {
          font-size: inherit;
          margin: 0 5px 0 0;
        }
      }
    }
    .desc {
      margin: 8px 0 0 0;
      width: 90%;
      span {
        font-size: 13px;
      }
      font-size: 13px;
      color: #676767;
    }
  }
`;
export const ContentBody = styled.div`
  padding: 0 20px 0 30px;
`;
