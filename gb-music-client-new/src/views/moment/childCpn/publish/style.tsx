import styled from 'styled-components';
export const PublishWrapper = styled.div`
  position: absolute;
  background-color: #fff;
  left: 50%;
  top: 100%;
  transform: translate(-50%, 0);
  box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
  padding: 30px;
  z-index: 999;
  textarea {
    padding: 20px;
    border: 1px solid #e5e5e5;
    resize: none;
  }
  .container {
    height: 100px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    .pic {
      background-color: #fff;
      height: 100%;
      width: 49%;
      overflow: hidden;
      border: 3px dotted #ececec;
      position: relative;
      text-align: center;
      line-height: 100px;
      input {
        position: absolute;
        width: 100%;
        height: 100%;
        opacity: 0;
        display: block;
      }
      i {
        font-size: 28px;
        color: #ec4141;
      }
      img {
        height: 100%;
      }
    }
    .song {
      background-color: #fff;
      border: 3px dotted #ececec;
      height: 100%;
      width: 49%;
      overflow: hidden;
      text-align: center;
      line-height: 100px;
      cursor: pointer;
      img {
        height: 100%;
      }
      i {
        font-size: 30px;
        color: #ec4141;
      }
    }
  }
  .control-btn {
    display: flex;
    margin: 15px 0 0 0;
    justify-content: flex-end;
    & > button {
      cursor: pointer;
      background-color: #f6a0a0;
      color: #fff;
      font-size: 13px;
      margin: 0 0 0 10px;
      padding: 2px 10px;
      &:nth-child(2) {
        background-color: #efefef;
        color: #676767;
      }
    }
  }
  .song-list {
    .back {
      margin: 15px 0 0 0;
      display: flex;
      justify-content: flex-end;
      button {
        background-color: #ec4141;
        color: #fff;
        font-size: 13px;
        padding: 3px 15px;
        cursor: pointer;
      }
    }
    .songs {
      margin: 15px 0 0 0;
      li {
        display: flex;
        align-items: center;
        padding: 8px 0;
        &:nth-child(odd) {
          background-color: #f9f9f9;
        }
        .song-name {
          width: 60%;
          font-size: 13px;
          color: #363636;
          cursor: pointer;
        }
        .album-name {
          width: 35%;
          color: #676767;
          font-size: 13px;
        }
      }
    }
  }
  .search-outer {
    border: 1px solid #e5e5e5;
    padding: 2px 10px;
    width: 400px;
    input {
      color: #a9a9a9;
      margin: 0 0 0 8px;
      width: 80%;
      font-size: 13px;
    }
  }
  .topic-list {
    width: 200px;
    outline: none;
    border: 1px solid #ebebeb;
    margin: 5px 0 15px 0;
    padding: 5px 0;
  }
`;
