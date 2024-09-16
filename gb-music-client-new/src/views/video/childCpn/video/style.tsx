import styled from 'styled-components';
export const VideoWrapper = styled.div`
  width: 100%;
  .new-title {
    margin: 20px 0;
  }
  @media screen and (max-width: 1300px) {
    .video-list {
      grid-template-columns: repeat(4, 200px) !important;
    }
  }
  @media screen and (max-width: 1090px) {
    .video-list {
      grid-template-columns: repeat(3, 200px) !important;
    }
  }
  .video-list {
    width: 100%;
    display: grid;
    justify-content: space-between;
    grid-template-columns: repeat(5, 200px);
    margin: 20px 0 0 0;
    & > li {
      margin: 0 0 20px 0;
      width: 200px;
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
