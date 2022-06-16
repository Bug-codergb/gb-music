import styled from 'styled-components';
export const MessageWrapper = styled.div`
  position: fixed;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  z-index: 9898989898989;
  background-color: #fff;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  & > .outer {
    padding: 20px 30px;
    & > p {
      text-align: center;
      margin: 0 0 30px 0;
    }
    & > .control-btn {
      display: flex;
      justify-content: center;
      button {
        padding: 3px 15px;
        background-color: #ec4141;
        cursor: pointer;
        color: #fff;
        font-size: 13px;
        margin: 0 15px;
        &:nth-child(2) {
          background-color: #efefef;
          color: #363636;
        }
      }
    }
  }
`;
