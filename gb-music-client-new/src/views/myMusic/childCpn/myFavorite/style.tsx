import styled from 'styled-components';
export const MyFavoriteWrapper = styled.div`
  padding: 20px;
  .user-favorite-list {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .img-container {
        width: 50px;
        height: 50px;
        overflow: hidden;
        border-radius: 4px;
        img {
          width: 50px;
        }
      }
      .index {
        padding: 0 10px;
        font-size: 13px;
        color: #cacad9;
      }
      .control-btn {
        padding: 0 10px 0 0;
        display: flex;
        align-items: center;
        i {
          color: #b4b4b4;
          margin: 0 10px 0 0;
          cursor: pointer;
          &:nth-child(1) {
            color: #ec4141;
          }
        }
      }
      .song-name {
        width: 20%;
        margin: 0 5px 0 20px;
        color: #0086b3;
        display: flex;
        align-items: center;
        cursor: pointer;
        & > span {
          font-size: 13px;
          display: inline-block;
          max-width: 155px;
          margin: 0 5px 0 0;
        }
      }
      .album-name {
        width: 15%;
        font-size: 13px;
        color: #676767;
        margin: 0 5px 0 0;
        &:hover {
          color: #000;
          cursor: pointer;
        }
      }
      .artist-name {
        width: 15%;
        font-size: 13px;
        color: #676767;
        &:hover {
          color: #000;
          cursor: pointer;
        }
      }
      .dt {
        width: 10%;
        color: #9f9f9f;
        font-size: 13px;
      }
      .time {
        color: #9b9b9b;
        font-size: 13px;
      }
    }
  }
  .empty-tip {
    padding: 100px 0;
  }
  .page {
    display: flex;
    justify-content: center;
  }
`;
