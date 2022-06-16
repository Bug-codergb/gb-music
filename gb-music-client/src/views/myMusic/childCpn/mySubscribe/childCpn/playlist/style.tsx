import styled from 'styled-components';
export const PlaylistWrapper = styled.div`
  .sub-playlist {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    & > li {
      width: 150px;
      margin: 0 0 20px 0;
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
`;
