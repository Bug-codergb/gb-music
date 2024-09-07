import styled from 'styled-components';
import coverall from '../../../../assets/img/coverall.png';
export const ArtistWrapper = styled.div`
  padding: 20px;
  .filter {
    & > li {
      margin: 0 0 10px 0;
      display: flex;
      align-items: flex-start;
      .filter-name {
        white-space: nowrap;
        margin: 0 15px 0 0;
        font-size: 13px;
      }
    }
  }
  @media screen and (max-width: 1300px){
    .cate-artist{
      grid-template-columns: repeat(7,120px)!important;
    }
  }
  @media screen and (max-width: 1170px){
    .cate-artist{
      grid-template-columns: repeat(6,120px)!important;
    }
  }
  @media screen and (max-width: 1036px){
    .cate-artist{
      grid-template-columns: repeat(5,120px)!important;
    }
  }
  .cate-artist {
    display: grid;
    justify-content: space-between;
    grid-template-columns: repeat(8,120px);
    & > li {
      width: 120px;
      margin: 0 0 15px 0;
      .artist-name {
        font-size: 13px;
        cursor: pointer;
        &:hover {
          text-decoration: underline;
        }
      }
      .mask {
        position: absolute;
        background-image: url(${coverall});
        background-position: 0 -680px;
        z-index: 9999;
        width: 100%;
        height: 100%;
        cursor: pointer;
        top: 0;
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
`;
