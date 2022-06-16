import styled from 'styled-components';
export const UserInoWrapper = styled.div`
  position: absolute;
  background-color: #fff;
  width: 240px;
  height: 240px;
  box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
  left: 40%;
  top: 100%;
  transform: translate(-50%, 0);
  z-index: 999998;
  border-radius: 5px;
  .user-info,
  .exit,
  .vip {
    border-bottom: 1px solid #ededed;
    justify-content: center;
    padding: 15px 0;
    display: flex;
    align-items: center;
    cursor: pointer;
    i {
      font-size: 20px;
      margin: 0 15px 0 0;
    }
  }
  .user-info {
    margin: 20px 0 0 0;
  }
`;
