import styled from 'styled-components';
import coverall from '../../../../../../../../assets/img/coverall.png';
export const AlbumWrapper = styled.div`
  display: flex;
  align-items: flex-start;
  .img-container {
    width: 190px;
    height: 150px;
    position: relative;
    img {
      width: 148px;
    }
    .mask {
      background-image: url(${coverall});
      background-repeat: no-repeat;
      background-position: -211px -1052px;
      background-size: 470px;
      position: absolute;
      z-index: 99;
      width: 190px;
      height: 100%;
      top: 0;
    }
  }
  .song-list {
    .album-name {
      font-size: 18px;
      font-weight: bolder;
      color: #373737;
      margin: 0 0 10px 0;
    }
    margin: 0 0 0 100px;
    & > li {
      width: 500px;
      display: flex;
      align-items: center;
      padding: 5px 0;
      .index {
        padding: 0 10px;
        color: #cacaca;
        font-size: 13px;
      }
      .love {
        padding: 0 10px;
        i {
          color: #afafaf;
          cursor: pointer;
        }
        .icon-loveit {
          color: #ec4141;
          cursor: pointer;
        }
      }
      .song-name {
        width: 50%;
        color: #0086b3;
        cursor: pointer;
        display: flex;
        align-items: center;
        & > span {
          font-size: 13px;
          display: inline-block;
          max-width: 155px;
          margin: 0 5px 0 0;
        }
      }
      .dt {
        font-size: 13px;
        color: #9b9b9b;
      }
      &:nth-child(even) {
        background-color: #f9f9f9;
      }
    }
  }
`;
