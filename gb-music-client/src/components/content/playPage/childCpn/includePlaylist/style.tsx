import styled from 'styled-components';
export const IncludePlaylistWrapper = styled.ul`
  width: 100%;
  & > li {
    display: flex;
    padding: 5px 0;
    width: 100%;
    .img-container {
      width: 60px;
      height: 60px;
      overflow: hidden;
      border-radius: 5px;
      cursor: pointer;
      img {
        width: 100%;
        border-radius: 5px;
      }
    }
    .msg {
      width: 80%;
      margin: 0 0 0 15px;
      .name {
        color: #323232;
        width: 95%;
        cursor: pointer;
      }
      .creator {
        font-size: 13px;
        color: #9f9f9f;
        margin: 10px 0 0 0;
        cursor: pointer;
      }
    }
  }
`;
