import styled from 'styled-components';
export const ComboWrapper = styled.div`
  width: 700px;
  position: fixed;
  left: 50%;
  top: 40%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  z-index: 9999999;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  padding: 0 0 30px 0;
  .title {
    background-color: #333333;
    color: #fff;
    padding: 10px 0 10px 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    i {
      color: #fff;
      display: inline-block;
      font-size: 25px;
      transform: rotateZ(45deg);
      cursor: pointer;
      margin: -3px 10px 0 0;
    }
  }
  .tip {
    padding: 30px 10px;
    text-align: center;
    font-size: 16px;
  }
  .combo-list {
    display: flex;
    padding: 0 20px;
    justify-content: space-between;
    flex-wrap: wrap;
    .holder {
      height: 0;
    }
    & > li {
      width: 150px;
      height: 150px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.08);
      margin: 0 0 15px 0;
      border-radius: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column-reverse;
      cursor: pointer;
      &.active {
        border: 2px solid #ff6b6b;
      }
      .name {
        font-size: 18px;
        font-weight: bolder;
        color: #333333;
      }
      .price {
        font-size: 28px;
        color: #ff3a3a;
      }
    }
  }
  .now-pay {
    display: block;
    background-color: #fb5a59;
    color: #fff;
    padding: 10px 15px;
    text-align: center;
    width: 300px;
    margin: 20px auto;
    font-size: 14px;
    cursor: pointer;
    span {
      font-size: 17px;
    }
  }
`;
