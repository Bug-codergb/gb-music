import styled from 'styled-components';
export const ToastWrapper = styled.div`
  position: fixed;
  left: 50%;
  top: 40%;
  transform: translate(-50%, -50%);
  background-color: rgba(236, 65, 65, 0.7);
  border-radius: 10px;
  color: #fff;
  z-index: 999999999999;
  .container {
    padding: 18px 30px;
  }
  .toast-enter {
    opacity: 0;
  }
  .toast-enter-active {
    opacity: 1;
    transition: opacity 1000ms;
  }
  .toast-enter-done {
    opacity: 1;
  }
  .toast-exit {
    opacity: 1;
  }
  .toast-exit-active {
    opacity: 0;
    transition: opacity 1000ms;
  }
  .toast-exit-done {
    opacity: 0;
  }
`;
