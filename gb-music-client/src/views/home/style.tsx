import styled from 'styled-components';
export const HomeWrapper = styled.div`
  position: relative;
  .content-body {
    width: 100%;
    margin: 0 auto;
    .router-loading {
      width: 1190px;
      margin: 0 auto;
      padding: 30px 0;
    }
  }
  .back-to-top {
    display: flex;
    align-items: center;
    flex-direction: column-reverse;
    font-size: 12px;
    color: #9b9b9b;
    width: 50px;
    height: 50px;
    padding: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    position: fixed;
    top: 90%;
    left: 94%;
    border-radius: 5px;
    cursor: pointer;
    background-color: #fff;
    svg {
      font-size: 20px;
      color: #9b9b9b;
    }
  }
`;
