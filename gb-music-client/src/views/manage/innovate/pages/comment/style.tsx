import styled from 'styled-components';
export const CommentWrapper = styled.div`
  background-color: #fff;
  padding: 0 0 20px 0;
  h3 {
    font-weight: bolder;
    padding: 10px 0 8px 10px;
    font-size: 18px;
    color: #656565;
  }
  .comment-list {
    & > li {
      background-color: #fff;
      padding: 20px 0;
      border-bottom: 1px solid #e8e8e9;
      /* &:nth-child(odd){
        background-color: #f9f9f9;
      }*/
      .comment-content {
        display: flex;
        align-items: center;
        width: 100%;
      }
      .index {
        font-size: 13px;
        padding: 0 15px;
        color: #cacaca;
      }
      .content {
        color: #507daf;
        max-width: 850px;
        min-width: 850px;
        margin: 0 10px 0 0;
      }
      .create-time {
        color: #cacaca;
        font-size: 13px;
        width: 150px;
      }
      .del-btn {
        cursor: pointer;
        i {
          color: #cacaca;
          &:hover {
            color: #656565;
          }
        }
      }
      &.holder {
        background-color: #fff;
        padding: 22px 0;
      }
      .album-container,
      .channel-container,
      .playlist-container,
      .toplist-container,
      .channel-container {
        flex-wrap: wrap;
        margin: 10px 0 0 0;
        padding: 0 20px;
        .source {
          color: #ff4b53;
          margin: 0 10px 10px 20px;
          width: 100%;
          font-size: 13px;
        }
        .info {
          display: flex;
          align-items: flex-start;
          background-color: rgba(239, 239, 240, 0.6);
          padding: 10px 20px;
          border-radius: 4px;
          margin: 0 0 0 20px;
        }
        .img-container {
          width: 80px;
          height: 80px;
          overflow: hidden;
          border-radius: 4px;
          margin: 0 20px 0 0;
          img {
            width: 100%;
          }
        }
        .name {
          font-weight: bold;
          color: #0086b3;
        }
      }
      .moment-container,
      .video-container {
        margin: 10px 0 0 0;
        padding: 0 20px;
        .source {
          color: #ff4b53;
          margin: 0 10px 10px 20px;
          width: 100%;
          font-size: 13px;
        }
        .info {
          display: flex;
          align-items: flex-start;
          background-color: rgba(239, 239, 240, 0.6);
          padding: 10px 20px;
          margin: 0 0 0 20px;
          border-radius: 4px;
        }
        .img-container {
          width: 100px;
          height: 60px;
          background-color: #000;
          position: relative;
          overflow: hidden;
          border-radius: 4px;
          margin: 0 20px 0 0;
          img {
            width: 100%;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
          }
        }
        .name {
          font-weight: bold;
          color: #0086b3;
          width: 80%;
          text-align: justify;
        }
      }
      .comment-container,
      .song-container {
        margin: 10px 0 0 0;
        padding: 0 20px;
        .source {
          color: #ff4b53;
          margin: 0 10px 10px 20px;
          width: 100%;
          font-size: 13px;
        }
        .reply-name {
          background-color: rgba(239, 239, 240, 0.6);
          padding: 10px 20px;
          border-radius: 4px;
          margin: 0 0 0 20px;
        }
        .name {
          padding: 10px 20px;
          background-color: rgba(239, 239, 240, 0.6);
          color: #0086b3;
          margin: 0 0 0 20px;
        }
      }
    }
  }
  .page {
    display: flex;
    justify-content: center;
  }
  .comment-empty {
    display: flex;
    justify-content: center;
    padding: 200px 0;
  }
`;
