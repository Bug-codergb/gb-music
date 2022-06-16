import styled from 'styled-components';
export const MyMusicWrapper = styled.div`
  /* margin: 20px auto 0;*/
  background-color: #f5f5f5;

  .my-music-list-outer {
    width: 100%;
    background-color: #2c323b;
  }
  .my-music-list {
    display: flex;
    align-items: center;
    background-color: #2c323b;
    li {
      height: 55px;
      span {
        padding: 0 15px;
        cursor: pointer;
        color: #dddddd;
        display: inline-block;
        line-height: 55px;
        font-size: 16px;
      }
      &.active {
        font-weight: bolder;
        background-color: #ec4141;
        span {
          color: #ffffff;
        }
      }
    }
  }
  .my-music-content {
    border-left: 1px solid #e0e0e0;
    border-right: 1px solid #e0e0e0;
    padding: 20px 15px 0 15px;
  }
`;
