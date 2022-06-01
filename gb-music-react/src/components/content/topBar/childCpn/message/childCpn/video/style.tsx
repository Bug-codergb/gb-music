import styled from 'styled-components';

export const VideoWrapper = styled.div`
  .video-msg-list {
    & > li {
      padding: 10px 0;
      display: flex;
      align-items: flex-start;
      border-bottom: 1px solid #f4f4f4;
      .symbol {
        width: 5px;
        height: 5px;
        border-radius: 50%;
        background-color: #ec4141;
        margin: 15px 0 0 0;
      }
      .video-right-msg {
        margin: 0 0 0 10px;
        display: flex;
        align-items: flex-start;
        .img-container {
          width: 30px;
          height: 30px;
          position: relative;
          border-radius: 50%;
          overflow: hidden;
          img {
            position: absolute;
            height: 100%;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
          }
        }
        .right-msg {
          width: 310px;
          margin: 0 0 0 10px;
          font-size: 13px;
          & > span {
            color: #5d86b5;
            font-size: 13px;
            margin: 0 5px 0 0;
          }
          .cover {
            margin: 10px 0 0 5px;
            img {
              width: 150px;
              border-radius: 4px;
            }
          }
        }
      }
    }
  }
  .empty {
    padding: 50px 0 0 0;
  }
`;
