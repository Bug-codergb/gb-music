import styled from 'styled-components';
export const VideoInfoWrapper = styled.div`
  margin: 20px;
  .desc {
    font-size: 14px;
    color: #656565;
  }
  .play-time {
    display: flex;
    justify-content: space-between;
    width: 40%;
    margin: 20px 0;
    .create-time,
    .play-count {
      & > span {
        color: #656565;
        margin: 0 5px 0 0;
      }
    }
  }
`;
