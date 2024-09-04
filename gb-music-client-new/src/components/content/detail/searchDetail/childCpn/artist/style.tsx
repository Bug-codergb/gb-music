import styled from 'styled-components';
export const ArtistWrapper = styled.ul`
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
      padding: 0 20px 0 0;
      color: #c3c3db;
      font-size: 13px;
    }
    .img-container {
      width: 60px;
      height: 60px;
      border-radius: 5px;
      overflow: hidden;
      margin: 0 20px 0 0;
      cursor: pointer;
      img {
        width: 100%;
      }
    }
    .artist-name {
      color: #656565;
      cursor: pointer;
    }
  }
`;
