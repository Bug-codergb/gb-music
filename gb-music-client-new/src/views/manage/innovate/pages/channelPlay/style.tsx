import styled from 'styled-components';
export const ChannelPlayWrapper = styled.div`
  background-color: #fff;
  padding: 20px 20px 30px 20px;
  height: 100%;
  overflow-y: auto;
  .program-list {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 0 10px 10px;
      &:nth-child(odd) {
       
      }
      &:nth-child(1),
      &:nth-child(2),
      &:nth-child(3) {
        .index {
          color: #ff3a3a;
        }
      }
      .index {
        margin: 0 15px 0 0;
       
        padding: 5px 6px;
        border-radius: 8px;
        font-size: 13px;
        color: #656565;
        font-weight: normal;
      }
      .img-container {
        width: 50px;
        cursor: pointer;
        img {
          width: 100%;
        }
      }
      .name {
        margin: 0 0 0 20px;
        font-size: 14px;
        color: #656565;
        width: 20%;
        cursor: pointer;
      }
      .channel-name {
        width: 15%;
        color: #656565;
      }
      .cate {
        width: 15%;
        font-size: 13px;
        color: #0086b3;
      }
      .create-time {
        color: #ccc;
        font-size: 13px;
        width: 15%;
      }
      .play-count {
        & > span {
          color: #ccc;
          margin: 0 0 0 5px;
        }
        i {
          color: #ccc;
        }
      }
    }
  }
  .empty {
    padding: 180px 0;
  }
`;
