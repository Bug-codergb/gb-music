import styled from 'styled-components';
export const UserPlaylistWrapper = styled.div`
  margin: 30px 0 0 0;
  @media screen and (max-width: 1410px) {
    .play-list {
      grid-template-columns: repeat(6, 150px) !important;
    }
  }
  @media screen and (max-width: 1270px) {
    .play-list {
      grid-template-columns: repeat(5, 150px) !important;
    }
  }
  @media screen and (max-width: 1080px) {
    .play-list {
      grid-template-columns: repeat(4, 150px) !important;
    }
  }

  .play-list {
    display: grid;
    grid-template-columns: repeat(7, 150px);
    justify-content: space-between;
    li.play-list-item {
      width: 150px;
      margin: 0 0 20px 0;
    }
    li {
      width: 150px;
    }
  }
  .empty-tip {
    padding: 100px 0;
  }
`;
