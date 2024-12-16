import styled from 'styled-components';
const appName = import.meta.env.VITE_APP_NAME
export const LoginCpnWrapper = styled.div`
  background-color: #fff;
  padding: 30px 40px;

  .title-system-name {
    margin: 0 0 40px;
    display: flex;
    justify-content: center;
    .title {
      font-weight: bold;
      position: relative;
      font-size: 40px;
      color: #ec5b5b;
      margin:0 0 0 20px;
    }
    img{
      width: 60px;
      border-radius: 4px;
    }
  }
  .title::after {
    content: '${()=> appName}';
    position: absolute;
    left: 0;
    top: 0;
    color: transparent;
    color: #da4f49;
    animation: light 5s infinite;
  }
  @keyframes light {
    0% {
      clip-path: circle(100px at 0% 20%);
    }
    50% {
      clip-path: circle(100px at 100% 50%);
    }
    100% {
      clip-path: circle(100px at 0% 50%);
    }
  }
  .user-name {
    margin: 0 0 8px 0;
  }
  .user-name,
  .password {
    margin:0 0 40px 0;
    border: 1px solid #da4f49;
    border-radius: 4px;
    display: flex;
    align-items: center;
    padding: 4px 20px;
    input {
      width: 300px;
      padding: 10px 20px 10px 10px;
    }
    span {
      margin-right: 10px;
     
      display: inline-block;
      white-space: nowrap;
    }
    svg{
      font-size: 16px;
      color: #ec5b5c;
    }
  }
  .user-name-check,
  .password-check {
    color: #da4f49;
    text-align: right;
    margin: 8px 0 15px 0;
  }
  .btn {
    cursor: pointer;
    border-radius: 4px;
    margin:10px 0 0 0;
  }
  .register-tip {
    margin: 20px 0 0 0;
    text-align: right;
    span {
      &:nth-child(2) {
        color:#da4f49;
        margin: 0 0 0 5px;
        cursor: pointer;
      }
    }
  }
`;
