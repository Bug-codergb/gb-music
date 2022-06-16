import styled from 'styled-components';
export const ArtistWrapper = styled.div`
  .sub-artist {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    & > li {
      padding: 10px 0;
      width: 150px;
      .artist-name {
        font-size: 14px;
      }
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
`;
