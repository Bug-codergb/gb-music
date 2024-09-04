import styled from 'styled-components';
export const RecVideoWrapper = styled.div`
  margin: 50px 0 0 0;
  .rev-video-title {
    font-size: 14px;
    font-weight: bolder;
    color: #000;
    margin: 0 0 10px 10px;
  }
  .video-list {
    & > li {
      padding: 8px 10px;
      display: flex;
      align-items: flex-start;
      &:nth-child(odd) {
        background-color: #f7f7f7;
      }
      .img-container {
        width: 110px;
        height: 68px;
        overflow: hidden;
        border-radius: 5px;
        background-color: #000c17;
        position: relative;
        img {
          position: absolute;
          width: 100%;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
          cursor: pointer;
        }
      }
      .right-msg {
        width: 45%;
        margin: 0 0 0 10px;
        .video-name {
          font-size: 13px;
          color: #000000d9;
        }
        .creator {
          margin: 10px 0 0 0;
          & > span {
            font-size: 12px;
            color: #666;
            &:hover {
              color: #333;
              cursor: pointer;
            }
          }
        }
      }
    }
  }
`;
