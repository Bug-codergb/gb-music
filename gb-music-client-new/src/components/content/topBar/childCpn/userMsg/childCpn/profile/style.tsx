import styled from 'styled-components';
export const ProfileWrapper = styled.div`
  position: fixed;
  left: 50%;
  top: 45%;
  transform: translate(-50%, -50%);
  z-index: 999999696;
  background-color: #fff;
  padding: 30px 30px 50px 30px;
  box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
  .title {
    font-size: 16px;
    font-weight: bold;
    margin: 0 0 20px 0;
  }
  .msg {
    display: flex;
    align-items: flex-start;
    .setting {
      margin: 0 20px 0 0;
      .user-name,
      .password {
        margin: 0 0 10px 0;
        span {
          margin: 0 10px 0 0;
          color: #373737;
        }
        input {
          border: 1px solid #e1e4e8;
          width: 280px;
          color: #000;
          height: 40px;
          padding: 5px 0 5px 10px;
        }
      }
    }
    .avatar {
      width: 100px;
      height: 100px;
      overflow: hidden;
      background-color: #f2f2f2;
      text-align: center;
      img {
        height: 100%;
      }
      .outer {
        background-color: inherit;
        width: 100%;
        overflow: hidden;
        position: relative;
        height: 50px;
        i {
          font-size: 35px;
          line-height: 100px;
        }
        input {
          position: absolute;
          display: block;
          opacity: 0;
          width: 100%;
        }
      }
    }
  }
  .control-btn {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin: 40px 0 0 0;
    height: 35px;
    button {
      height: 100%;
      cursor: pointer;
      margin: 0 10px;
      display: flex;
      align-items: center;
      padding: 5px 15px;
      font-size: 13px;
      background-color: #f6a0a0;
      color: #fff;
      &:nth-child(2) {
        background-color: #e5e5e5;
        color: #353535;
      }
    }
  }
`;
