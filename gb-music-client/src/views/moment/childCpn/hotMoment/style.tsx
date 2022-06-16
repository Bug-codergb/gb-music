import styled from 'styled-components';
export const HotMomentWrapper = styled.ul`
  & > li {
    display: flex;
    margin: 0 0 10px 0;
    .img-container {
      width: 90px;
      height: 60px;
      overflow: hidden;
      background-color: #656565;
      position: relative;
      border-radius: 5px;
      img {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        height: 100%;
      }
    }
    .msg {
      width: 60%;
      margin: 0 0 0 20px;
      .name {
        width: 100%;
      }
      .user-name {
        font-size: 13px;
        color: #656565;
      }
    }
  }
`;
