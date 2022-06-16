import styled from 'styled-components';
export const CommentWrapper = styled.div`
  .video-msg-list {
    & > li {
      padding: 10px 15px;
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      width: 100%;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .video-msg-content {
        display: flex;
        align-items: flex-start;
        width: 95%;
      }
      .left-content {
        display: flex;
        align-items: center;
      }
      .index {
        color: #ccc;
        font-size: 13px;
        margin: 0 10px 0 0;
      }
      .is-read {
        width: 7px;
        height: 7px;
        background-color: #ec4141;
        border-radius: 50%;
        margin: 0 10px 0 0;
      }
      .img-container {
        width: 40px;
        height: 40px;
        position: relative;
        border-radius: 50%;
        overflow: hidden;
        background-color: #000c17;
        img {
          width: 100%;
          position: absolute;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
        }
      }
      .right-content {
        margin: 10px 0 0 20px;
        width: 100%;
        .video-msg-info {
          display: flex;
          align-items: flex-start;
          width: 100%;
          .operator {
            margin: 0 5px;
            white-space: nowrap;
          }
          .user-name {
            color: #0086b3;
            cursor: pointer;
            white-space: nowrap;
          }
          .video-name {
            color: #0086b3;
            cursor: pointer;
            line-height: 24px;
            width: 100%;
          }
        }
        .video-cover {
          margin: 20px 0 0 0;
          width: 220px;
          overflow: hidden;
          cursor: pointer;
          img {
            width: 100%;
          }
        }
      }
      .delete-msg {
        cursor: pointer;
        i.iconfont {
          font-size: 20px;
          color: #9b9b9b;
        }
        &:hover {
          i {
            color: #000;
          }
        }
      }
    }
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 20px 0 0 0;
  }
  .empty {
    padding: 150px 0;
  }
`;
