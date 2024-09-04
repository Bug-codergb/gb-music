import styled from 'styled-components';
export const LoginCpnWrapper = styled.div`
  background-color: #fff;
  padding: 30px 40px 50px 30px;
  .title-system-name {
    margin: 0 0 40px;
    display: flex;
    justify-content: center;
    .title {
      font-weight: bold;
      position: relative;
      font-size: 40px;
      text-shadow: 0 0 20px rgba(236, 65, 65, 0.2);
      color: #656565;
    }
  }
  .title::after {
    content: 'ln-music';
    position: absolute;
    left: 0;
    top: 0;
    color: transparent;
    background: linear-gradient(to right, #00aeec, #4cc4ed);
    background-clip: text;
    -webkit-background-clip: text;
    clip-path: circle(100px at 0% 50%);
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
    input {
      width: 260px;
      border: 1px solid #00aeec;
      padding: 10px 22px;
      border-radius: 4px;
    }
    span {
      margin-right: 10px;
      width: 50px;
      display: inline-block;
      white-space: nowrap;
    }
  }
  .user-name-check,
  .password-check {
    color: #00aeec;
    text-align: right;
    margin: 8px 0 15px 0;
  }
  .btn {
    margin: 40px 0 0 0;
    cursor: pointer;
    border-radius: 4px;
  }
  .register-tip {
    margin: 20px 0 0 0;
    text-align: right;
    span {
      &:nth-child(2) {
        color: #00aeec;
        margin: 0 0 0 5px;
        cursor: pointer;
      }
    }
  }
`;
