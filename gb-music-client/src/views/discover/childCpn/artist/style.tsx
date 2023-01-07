import styled from 'styled-components';
import coverall from '../../../../assets/img/coverall.png';
export const ArtistWrapper = styled.div`
  margin: 0 auto;
  padding: 20px 15px;
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
  .cate-artist {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
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
