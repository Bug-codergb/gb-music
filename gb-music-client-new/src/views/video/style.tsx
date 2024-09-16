import styled from 'styled-components';
export const VideoWrapper = styled.div`
  background-color: #ffffff;
  width: 100%;
  .video-content {
    padding: 20px;
    background-color: #ffffff;
  }
  .video-nav-list {
    display: flex;
    align-items: center;
    & > li {
      margin: 0 30px 0 0;
      cursor: pointer;
      &.active {
        span {
          font-weight: bold;
          border-bottom: 3px solid #ec4141;
        }
      }
    }
  }
`;
