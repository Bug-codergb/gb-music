import styled from 'styled-components';
export const SongWrapper = styled.ul`
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
      color: #cfd2d9;
      font-size: 13px;
      padding: 0 15px 0 0;
    }
    .name {
      width: 30%;
      color: #0086b3;
      display: flex;
      align-items: center;
      cursor: pointer;
      & > span {
        font-size: 13px;
        max-width: 155px;
        display: inline-block;
        margin: 0 5px 0 0;
      }
    }
    .album-name,
    .artist-name {
      color: #656565;
      font-size: 13px;
      width: 20%;
      cursor: pointer;
    }
    .dt {
      color: #9b9b9b;
      font-size: 12px;
    }
  }
`;
