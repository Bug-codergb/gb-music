import styled from 'styled-components';
export const VideoWrapper = styled.div`
  background-color: #fff;
  padding: 20px 30px 20px 20px;
  .video-time {
    margin: 0 0 30px 0;
    .create-time {
      color: #9b9b9b;
      font-size: 13px;
    }
  }
  .vio-list {
    display: flex;
    justify-content: space-between;
    & > li {
      width: 175px;
    }
    .del {
      cursor: pointer;
      i {
        color: #9b9b9b;
      }
    }
  }
  .vio-empty {
    padding: 200px 0;
  }
`;
