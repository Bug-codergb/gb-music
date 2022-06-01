import styled from 'styled-components';
export const PlaylistWrapper = styled.div`
  padding: 20px 15px;
  border-left: 1px solid #d3d3d3;
  border-right: 1px solid #d3d3d3;
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    .current-cate {
      border: 1px solid #d8d8d8;
      font-size: 13px;
      padding: 3px 20px;
      border-radius: 15px;
    }
  }
  .cate-play-list {
    margin: 20px 0 0 0;
    & > ul {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      & > li {
        width: 150px;
        position: relative;
        .user-msg {
          position: absolute;
          left: 0;
          top: 65%;
          width: 100%;
          display: flex;
          align-items: center;
          color: #ffffff;
          padding: 0 10px 5px 10px;
          box-sizing: border-box;
          background: linear-gradient(transparent, 50%, rgba(0, 0, 0, 0.6));
          span {
            font-size: 13px;
            margin: 0 0 0 5px;
            cursor: pointer;
          }
        }
        .cover-img {
          transform: scale(1) translate(-50%, -50%);
          transition: transform 0.3s;
          &:hover {
            transform: scale(1.2) translate(-50%, -50%);
          }
        }
      }
    }
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 10px 0;
  }
`;
