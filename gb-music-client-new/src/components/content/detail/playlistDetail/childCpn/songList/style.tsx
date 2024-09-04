import styled from 'styled-components';
export const SongListWrapper = styled.div`
  .song-list {
    & > li {
      padding: 5px 0;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:hover {
        background-color: #f0f1f2;
      }
    }
  }
`;
