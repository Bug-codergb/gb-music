import styled from 'styled-components';
import coverall from '../../../../assets/img/coverall.png';
export const AlbumWrapper = styled.div`
  margin: 0 auto;
  padding: 20px 15px;
  .cate-album-detail {
    & > ul {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      & > li {
        margin: 0 14px 15px 0;
        width: 150px;
        img {
          width: 130px;
          left: 0;
          top: 0;
          transform: translate(0, 0);
        }
        .mask {
          position: absolute;
          width: 100%;
          height: 100%;
          background-image: url(${coverall});
          background-position: 0 -845px;
          cursor: pointer;
          z-index: 999;
        }
        .artist-name {
          font-size: 12px;
          color: #9f9f9f;
          cursor: pointer;
          margin: 0;
        }
      }
    }
    .page {
      display: flex;
      justify-content: center;
    }
    .empty {
      padding: 150px 0;
    }
  }
`;
