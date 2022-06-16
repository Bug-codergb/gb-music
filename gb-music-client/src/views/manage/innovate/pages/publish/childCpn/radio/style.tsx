import styled from 'styled-components';
export const RadioWrapper = styled.div`
  position: relative;
  .upload-radio {
    width: 500px;
    height: 300px;
    margin: 30px auto;
    border: 1px dotted #cccccc;
    text-align: center;
    border-radius: 8px;
    img {
      width: 200px;
    }
    .tip {
      color: #5091cb;
      text-decoration: underline;
      cursor: pointer;
    }
  }
  .upload-content {
    padding: 30px 50px;
    background-color: #fff;
    border-radius: 8px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    .name,
    .desc {
      display: flex;
      margin: 0 0 20px 0;
      textarea {
        resize: none;
        border: 1px solid #cccac1;
      }
      span {
        margin: 0 5px 0 0;
      }
    }
    .prev-img {
      width: 92%;
      height: 100px;
      background-color: #f2f2f2;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      margin: 0 0 20px 0;
      input {
        position: absolute;
        height: 100%;
        width: 100%;
        opacity: 0;
        cursor: pointer;
      }
      i.iconfont {
        font-size: 40px;
        color: #ff3a3a;
        display: inline-block;
      }
      img {
        height: 100%;
      }
    }
    .channel-list {
      display: flex;
      flex-wrap: wrap;
      width: 450px;
      & > li {
        white-space: nowrap;
        margin: 0 15px 15px 0;
        background-color: #f7b3b3;
        font-size: 13px;
        color: #fff;
        padding: 4px 15px;
        border-radius: 5px;
        cursor: pointer;
        &:hover {
          background-color: #f27a7a;
        }
        &.active {
          background-color: #f27a7a;
        }
      }
    }
    .control-btn {
      display: flex;
      justify-content: flex-end;
      button {
        color: #fff;
        font-size: 13px;
        padding: 4px 15px;
        margin: 0 0 0 30px;
        cursor: pointer;
        &:nth-child(1) {
          background-color: #f27a7a;
        }
        &:nth-child(2) {
          background-color: #efefef;
          color: #656565;
        }
      }
    }
  }
`;
