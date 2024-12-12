import styled from 'styled-components';
export const PlaylistWrapper = styled.div`
  .video-msg-list {
    & > li {
      padding: 15px 0;
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      border-bottom: 1px solid #e0e0e0;
      .video-msg-content {
        display: flex;
        align-items: flex-start;
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
        background-color: #000;
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
        .video-msg-info {
          display: flex;
          align-items: center;
          .operator {
            margin: 0 5px;
          }
          .user-name {
            color: #0086b3;
            cursor: pointer;
          }
          .video-name {
            color: #0086b3;
            cursor: pointer;
          }
        }
        .video-cover-desc {
          display: flex;
          align-items: flex-start;
          .desc {
            margin: 20px 0 0 20px;
          }
        }
        .video-cover {
          margin: 20px 0 0 0;
          width: 170px;
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
  .empty {
    padding: 50px 0;
  }
`;
