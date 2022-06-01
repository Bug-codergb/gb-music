import styled from 'styled-components';
export const VipOuterWrapper = styled.div`
  box-shadow: 0 0 24px rgba(0, 0, 0, 0.2);
  padding: 0 0 30px 0;
  position: fixed;
  background-color: #fff;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 600px;
  z-index: 99999999999;
  .top-bar {
    height: 40px;
    background-color: #333333;
    text-align: right;
    i {
      color: #fff;
      display: inline-block;
      font-size: 30px;
      transform: rotateZ(45deg);
      cursor: pointer;
      margin: -3px 10px 0 0;
    }
  }
  .body-content {
    p {
      text-align: center;
      margin: 20px 0 0 0;
    }
    .control-btn {
      display: flex;
      justify-content: center;
      margin: 30px 0;
      & > li {
        width: 150px;
        text-align: center;
        p {
          text-align: center;
          margin: 10px 0 0 0;
        }
      }
    }
    .pay {
      width: 200px;
      background-color: #fb5e5a;
      margin: 30px auto 0;
      text-align: center;
      color: #fff;
      padding: 5px 0;
      border-radius: 15px;
      cursor: pointer;
    }
  }
`;
