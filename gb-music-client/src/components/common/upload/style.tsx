import styled from 'styled-components';
export const UploadCpnWrapper = styled.div`
  background-color: #fff;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  padding: 40px 50px;
  border-radius: 8px;
  .name {
    display: flex;
    align-items: flex-start;
    margin: 0 0 20px 0;
    span {
      margin: 0 5px 0 0;
      white-space: nowrap;
    }
    textarea {
      resize: none;
      border: 1px solid #dbd9d2;
    }
  }
  .prev-outer {
    display: flex;
    background-color: #f2f2f2;
    height: 100px;
    margin: 0 0 20px 0;
    .prev-img {
      flex: 1;
      height: 100%;
      border-right: 1px dotted #cccac1;
      display: flex;
      align-items: center;
      justify-content: center;
      i {
        font-size: 38px;
        color: #f27a7a;
      }
    }
    .prev-vio {
      flex: 1;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      i {
        font-size: 40px;
        color: #ec4141;
      }
    }
    .prev-channel {
      flex: 1;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .prev-vio,
    .prev-img,
    .prev-channel {
      position: relative;
      input {
        position: absolute;
        width: 100%;
        height: 100%;
        opacity: 0;
        cursor: pointer;
      }
      img {
        height: 100%;
      }
    }
  }
  .control-btn {
    display: flex;
    justify-content: flex-end;
    button {
      font-size: 13px;
      padding: 5px 15px;
      margin: 0 0 0 30px;
      border-radius: 3px;
      &:nth-child(1) {
        background-color: #f27a7a;
        color: #fff;
      }
      &:nth-child(2) {
        background-color: #efefef;
        color: #000000;
      }
    }
  }
`;
