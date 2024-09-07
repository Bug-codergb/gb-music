import styled from 'styled-components';
import coverall from '../../../../assets/img/coverall.png';
export const AlbumWrapper = styled.div`
  padding: 20px;
  width: 100%;
  .album-header{
    margin: 0 0 15px 0;
  }
  @media screen and (max-width:1410px ){
    .cate-album-detail{
      &>ul{
        grid-template-columns: repeat(6,150px)!important;
      }
    }
  }
  @media screen and (max-width:1270px ){
    .cate-album-detail{
      &>ul{
        grid-template-columns: repeat(5,150px)!important;
      }
    }
  }
  @media screen and (max-width:1080px ){
    .cate-album-detail{
      &>ul{
        grid-template-columns: repeat(4,150px)!important;
      }
    }
  }
  .cate-album-detail {
    & > ul {
      display: grid;
      grid-template-columns: repeat(7,150px);
      justify-content: space-between;
      & > li {
        margin: 0 0 15px 0;
        width: 100%;
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
