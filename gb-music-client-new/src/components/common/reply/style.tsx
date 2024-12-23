import styled from 'styled-components';
export const ReplyWrapper = styled.div`
  width: 100%;
  .control-btn {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    margin: 0 0 10px 0;
    & > li {
      margin: 0 15px 0 0;
      cursor: pointer;
      &.active {
        i {
          color: #ec4141;
        }
      }
      i {
        color: #656564;
      }
      &:nth-child(2) {
        i {
          font-size: 14px;
        }
      }
    }
  }
  .publish {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
  }
  textarea {
    border: 1px solid #e5e5e5;
    resize: none;
    height: 55px;
    padding: 5px;
    flex:1;
  }
  .reply-btn {
    font-size: 13px;
    width: 50px;
    background-color: #f27a7a;
    color: #fff;
    padding: 5px 12px;
    border-radius: 3px;
    margin: 0 0 0 20px;
    cursor: pointer;
  }
`;
