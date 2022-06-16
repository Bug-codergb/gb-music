import styled from 'styled-components';
export const AlbumWrapper = styled.ul`
  & > li {
    display: flex;
    align-items: center;
    padding: 10px 20px;
    &:nth-child(odd) {
      background-color: #f9f9f9;
    }
    .index {
      color: #c3c3db;
      padding: 0 20px 0 0;
      font-size: 13px;
    }
    .img-container {
      width: 60px;
      height: 60px;
      border-radius: 5px;
      overflow: hidden;
      img {
        width: 100%;
      }
      margin: 0 20px 0 0;
    }
    .name {
      width: 60%;
      color: #656565;
      font-size: 13px;
    }
    .publish-time {
      font-size: 13px;
      color: #9b9b9b;
    }
  }
`;
