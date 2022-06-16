import styled from 'styled-components';
export const InnovateConWrapper = styled.div`
  .control-btn {
    display: flex;
    justify-content: flex-end;
    & > button {
      background-color: #ec4141;
      color: #fff;
      padding: 4px 15px;
      display: flex;
      align-items: center;
      border-radius: 18px;
      cursor: pointer;
      & > span {
        font-size: 13px;
        margin: 0 0 0 10px;
      }
      & > i {
        font-size: 18px;
      }
    }
  }
  .program-list {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:nth-child(even) {
        background-color: #fff;
      }
      &:hover {
        background-color: #f0f1f2;
      }
      .index {
        padding: 0 20px;
        color: #656565;
      }
      .img-container {
        width: 70px;
        height: 70px;
        margin: 0 20px 0 0;
        img {
          width: 100%;
          border-radius: 5px;
        }
      }
      .name {
        width: 26%;
        margin: 0 20px 0 0;
        font-weight: bold;
        font-size: 16px;
        color: #656565;
        cursor: pointer;
      }
      .cate {
        width: 15%;
        color: #5091cb;
        font-size: 13px;
        span {
          color: #959595;
          font-size: 13px;
          margin: 0 4px 0 0;
        }
      }
      .create-time {
        font-size: 13px;
        color: #959595;
        width: 15%;
      }
      .del-btn {
        background-color: #ec4141;
        font-size: 13px;
        padding: 3px 15px;
        color: #fff;
        cursor: pointer;
      }
    }
  }
`;
