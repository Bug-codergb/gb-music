import styled from 'styled-components';
export const HotPlaylistWrapper = styled.ul`
  & > li {
    display: flex;
    padding: 5px 0;
    .img-container {
      width: 55px;
      height: 55px;
      overflow: hidden;
      border-radius: 5px;
      img {
        height: 100%;
        cursor: pointer;
      }
    }
    .msg {
      margin: 0 0 0 20px;
      width: 60%;
      .name {
        width: 100%;
        font-size: 14px;
        color: #323232;
        cursor: pointer;
      }
      .user-name {
        color: #656565;
        font-size: 13px;
      }
    }
  }
`;
