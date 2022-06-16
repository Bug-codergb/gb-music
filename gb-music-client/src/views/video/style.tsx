import styled from 'styled-components';
export const VideoWrapper = styled.div`
  background-color: #f5f5f5;
  .video-content {
    width: 1190px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    border-left: 1px solid #d3d3d3;
    border-right: 1px solid #d3d3d3;
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
