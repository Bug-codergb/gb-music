import styled from 'styled-components';
export const MyMusicWrapper = styled.div`
  background-color: #ffffff;
  .my-music-list-outer {
    width: 100%;
    background-color: #fff;
  }
  .my-music-list {
    display: flex;
    align-items: center;
    background-color: #fff;
    height: 30px;
    margin: 15px 0 0 20px;
    li {
      margin: 0 25px 0 0;
      height: 100%;
      span {
        padding: 0 0 5px 0;
        cursor: pointer;
        display: inline-block;
        font-size: 16px;
        color: #333333;
      }
      &.active {
        span {
          font-weight: bold;
          border-bottom: 3px solid #ec4141;
        }
      }
    }
  }
  .my-music-content {
    padding: 20px 15px 0 15px;
  }
`;
