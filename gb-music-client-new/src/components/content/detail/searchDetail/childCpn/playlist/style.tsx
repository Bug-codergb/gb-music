import styled from 'styled-components';
export const PlaylistWrapper = styled.ul`
  & > li {
    display: flex;
    align-items: center;
    padding: 10px 20px;
    &:nth-child(odd) {
      background-color: #f9f9f9;
    }
    &:hover {
      background-color: #f0f1f2;
    }
    .index {
      padding: 0 15px 0 0;
      color: #cacad9;
    }
    .img-container {
      width: 60px;
      height: 60px;
      overflow: hidden;
      border-radius: 5px;
      margin: 0 20px 0 0;
      cursor: pointer;
      img {
        width: 100%;
      }
    }
    .name {
      width: 30%;
      color: #656565;
      font-size: 13px;
      cursor: pointer;
    }
    .createTime {
      font-size: 12px;
      color: #676767;
      width: 20%;
    }
    .creator {
      font-size: 13px;
      color: #656565;
    }
  }
`;
