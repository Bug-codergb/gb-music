import styled from 'styled-components';

export const PlaylistWrapper = styled.div`
  .playlist-msg-list {
    & > li {
      display: flex;
      align-items: flex-start;
      padding: 10px 0;
      border-bottom: 1px solid #f4f4f4;
      .symbol {
        width: 5px;
        height: 5px;
        border-radius: 50%;
        background-color: #ec4141;
        margin: 15px 0 0 0;
      }
      .playlist-right-msg {
        margin: 0 0 0 10px;
        width: 310px;
        display: flex;
        .img-container {
          width: 30px;
          height: 30px;
          overflow: hidden;
          position: relative;
          border-radius: 50%;
          img {
            height: 100%;
            position: absolute;
            transform: translate(-50%, -50%);
            left: 50%;
            top: 50%;
          }
        }
        .right-msg {
          margin: 0 0 0 10px;
          font-size: 13px;
          & > span {
            color: #5d86b5;
            font-size: 13px;
            margin: 0 3px 0 0;
          }
          .cover {
            margin: 5px 0 0 5px;
            img {
              width: 120px;
              border-radius: 5px;
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
