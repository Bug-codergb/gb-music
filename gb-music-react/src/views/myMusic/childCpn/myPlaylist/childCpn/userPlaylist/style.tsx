import styled from 'styled-components';
export const UserPlaylistWrapper = styled.div`
  margin: 30px 0 0 0;
  .play-list {
    display: flex;
    flex-wrap: wrap;
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
