import styled from 'styled-components';
export const RecSongWrapper = styled.div`
  margin: 15px 0 0 0;
  .song-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    align-items: center;
    & > li {
      display: flex;
      align-items: center;
      width: 420px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      margin: 0 0 20px 0;
      justify-content: space-between;
      border-radius: 4px;
      .hot {
        padding: 0 30px 0 0;
        i {
          color: #f27a7a;
          font-size: 25px;
        }
        color: #9f9f9f;
      }
    }
    .state-outer {
      display: flex;
      align-items: center;
      .state-span {
        display: inline-block;
        max-width: 140px;
        margin: 0 5px 0 0;
      }
    }
  }
`;
