import styled from 'styled-components';
export const TopBarWrapper = styled.div`
  padding: 15px 0;
  background-color: #fff;
`;
export const CenterContent = styled.div`
  width: 97vw;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  .logo {
    display: flex;
    align-items: center;
    cursor: pointer;
    img {
      width: 40px;
      border-radius: 5px;
    }
    .title {
      color: #ff4b53;
      margin: 0 10px;
      font-size: 18px;
      font-weight: bold;
    }
    .tip {
      font-size: 14px;
      color: #a2a2a2;
    }
  }
  .right-msg {
    display: flex;
    align-items: center;
    .message {
      margin: 0 20px 0 0;
    }
  }
`;
