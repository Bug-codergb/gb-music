import styled from 'styled-components';
export const HotChannelWrapper = styled.div`
  .title {
    margin: 25px 0 8px 8px;
    font-weight: bold;
  }
  .hot-channel-list {
    & > li {
      display: flex;
      align-items: center;
      padding: 8px 10px 8px 10px;
      justify-content: space-between;
      &:nth-child(odd) {
        background-color: #f7f7f7;
      }
      .left-content {
        display: flex;
        width: 70%;
        .img-container {
          width: 50px;
          height: 50px;
          overflow: hidden;
          border-radius: 4px;
          cursor: pointer;
          img {
            width: 100%;
            border: 1px solid rgba(0, 0, 0, 0.1);
          }
        }
        .right-msg {
          margin: 0 0 0 10px;
          width: 60%;
          p {
            margin: 0;
            padding: 0;
          }
          .name {
            font-size: 13px;
            width: 100%;
            cursor: pointer;
          }
          .user-channel {
            display: flex;
            justify-content: space-between;
          }
          .user-name {
            color: #666;
            font-size: 12px;
            cursor: pointer;
            &:hover {
              color: #000;
            }
          }
        }
      }
    }
    .right-content {
      flex: 1;
      .channel-name {
        color: #999999;
        font-size: 12px;
        border: 1px solid #999999;
        display: inline-block;
        padding: 0 5px;
        border-radius: 2px;
        white-space: nowrap;
        margin: 0 0 0 12px;
      }
    }
  }
`;
