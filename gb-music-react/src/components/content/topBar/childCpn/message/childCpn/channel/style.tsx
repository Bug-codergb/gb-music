import styled from 'styled-components';

export const ChannelWrapper = styled.div`
  .channel-list {
    & > li {
      padding: 10px 0;
      border-bottom: 1px solid #f4f4f4;
      display: flex;
      align-items: flex-start;
      .symbol {
        width: 5px;
        height: 5px;
        overflow: hidden;
        border-radius: 50%;
        background-color: #ec4141;
        margin: 15px 0 0 0;
      }
      .right-channel-msg {
        margin: 0 0 0 10px;
        display: flex;
        align-items: flex-start;
        .img-container {
          width: 30px;
          height: 30px;
          overflow: hidden;
          border-radius: 50%;
          position: relative;
          img {
            position: absolute;
            height: 100%;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
          }
        }
        .right-msg {
          font-size: 13px;
          margin: 0 0 0 10px;
          & > span {
            font-size: 13px;
            color: #5d86b5;
            margin: 0 5px 0 0;
          }
          .cover {
            img {
              width: 120px;
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
