import styled from 'styled-components';
export const VideoWrapper = styled.div`
  .new-title {
    margin: 20px 0;
  }
  .video-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    & > li {
      margin: 0 0 20px 0;
      width: 180px;
    }
  }
  .page {
    display: flex;
    justify-content: center;
  }
  .empty {
    padding: 150px 0;
  }
`;
