import styled from 'styled-components';
export const SuccessPageWrapper = styled.div`
  background-color: #fff;
  width: 800px;
  margin: 0 auto;
  padding: 100px 0 150px 0;
  display: flex;
  align-items: center;
  flex-direction: column-reverse;
  .success-icon {
    border: 3px solid #f27a7a;
    width: 80px;
    height: 80px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    .already {
      color: #f27a7a;
      svg {
        font-size: 30px;
      }
    }
  }
  .tip {
    text-align: center;
    font-weight: bolder;
    margin: 20px 0 0 0;
  }
  .success-msg {
    width: 170px;
    margin: 15px 0 0 0;
    & > li {
      text-align: center;
      margin: 0 0 5px 0;
      span {
        margin: 0 5px 0 0;
        &:nth-child(2) {
          font-weight: bold;
        }
      }
    }
  }
  .known {
    margin: 30px 0 0 0;
    cursor: pointer;
  }
`;
