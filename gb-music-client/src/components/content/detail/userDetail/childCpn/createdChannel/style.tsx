import styled from 'styled-components';
export const CreatedChannelWrapper = styled.div`
  .title {
    font-size: 18px;
    margin: 0 10px 0 20px;
  }
  .channels {
    & > li {
      display: flex;
      align-items: center;
      padding: 8px 0 8px 20px;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:hover {
        background-color: #f0f1f2;
      }
      .img-container {
        width: 60px;
        height: 60px;
        border-radius: 5px;
        overflow: hidden;
        cursor: pointer;
        img {
          width: 100%;
        }
      }
      .channel-name {
        margin: 0 0 0 20px;
        cursor: pointer;
        width: 30%;
        color: #373737;
      }
      .play-count {
        width: 15%;
        color: #969697;
        font-size: 12px;
      }
      .create-time {
        color: #969697;
        font-size: 12px;
      }
    }
  }
  .page {
    display: flex;
    justify-content: flex-end;
    padding: 0 20px 0 0;
  }
`;
