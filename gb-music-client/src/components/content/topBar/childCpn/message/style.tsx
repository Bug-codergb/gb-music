import styled from 'styled-components';
export const MessageWrapper = styled.div`
  z-index: 999999999;
  border-radius: 10px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
  padding: 20px 30px;
  position: absolute;
  left: 0;
  top: 100%;
  transform: translate(-70%, 3%);
  background-color: #fff;
  .title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0 0 20px 0;
    .info {
      color: #507daf;
      cursor: pointer;
    }
    .already {
      font-size: 16px;
      font-weight: bolder;
      color: #507daf;
      cursor: pointer;
    }
  }
  .msg-list {
    display: flex;
    flex-wrap: nowrap;
    border: 1px solid #bbbbbb;
    border-radius: 15px;
    & > li {
      background-color: #fff;
      color: #373737;
      padding: 4px 25px;
      white-space: nowrap;
      font-size: 13px;
      border-radius: 15px;
      cursor: pointer;
      &.active {
        background-color: #bbbbbb;
        color: #fff;
      }
    }
  }
  .msg-content {
    height: 400px;
    width: 380px;
    overflow-x: hidden;
    overflow-y: scroll;
    &::-webkit-scrollbar {
      width: 2px;
    }
  }
`;
