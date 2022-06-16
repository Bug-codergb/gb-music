import styled from 'styled-components';
export const ControlBtnWrapper = styled.div`
  padding: 0 20px;
  display: flex;
  align-items: center;
  margin: 0 0 15px 0;
  .thumb,
  .sub-video {
    padding: 0 15px;
    border: 1px solid #d8d8d8;
    margin: 0 20px 0 0;
    display: flex;
    align-items: center;
    border-radius: 15px;
    cursor: pointer;
    i {
      margin: 0 10px 0 0;
      color: #373737;
    }
    span {
      color: #373737;
    }
    &:hover {
      background-color: #f2f2f2;
    }
  }
  .thumb {
    i {
      font-size: 18px;
    }
    &.active {
      i {
        color: #ec4141;
      }
      span {
        color: #ec4141;
      }
    }
  }
  .sub-video {
    padding: 2px 15px;
    .already {
      margin: 0 5px 0 0;
      svg {
        font-size: 16px;
      }
    }
    &.active {
      i,
      span {
        color: #ec4141;
      }
    }
  }
`;
