import styled from 'styled-components';
export const LoginWrapper = styled.div`
  height: 740px;
  position: relative;
  .login-outer {
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 0 22px rgba(0, 0, 0, 0.34);
    position: absolute;
    left: 65%;
    top: 18%;
    transform: translate(0, 0);
    z-index: 99999999;
    .login-btn {
      width: 100%;
      padding: 11px 0;
      background-color: #ec4141;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
    }
  }
  .mask {
    width: 100%;
    height: 750px;
    position: absolute;
    top: 0;
    z-index: 995559;
    background-color: rgba(0, 0, 0, 0.1);
  }
  .verify-enter {
    opacity: 0;
  }
  .verify-enter-active {
    opacity: 1;
    transition: opacity 500ms;
  }
  .verify-enter-done {
    opacity: 1;
  }
  .verify-exit {
    opacity: 1;
  }
  .verify-exit-active {
    opacity: 0;
    transition: opacity 500ms;
  }
  .verify-exit-done {
    opacity: 0;
  }
`;
