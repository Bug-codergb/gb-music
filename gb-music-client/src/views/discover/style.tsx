import styled from 'styled-components';
export const DiscoverWrapper = styled.div`
  background-color: #f5f5f5;
  .list-outer {
    background-color: #2c323b;
    height: 55px;
  }
  .discover-list {
    width: 1190px;
    margin: 0 auto;
    display: flex;
    height: 100%;
    li {
      cursor: pointer;
      height: 100%;
      span {
        font-size: 16px;
        padding: 0 15px;
        display: flex;
        align-items: center;
        height: 100%;
        color: #dddddd;
      }
      &.active {
        span {
          font-weight: bold;
          background-color: #ec4141;
          color: #fff;
        }
      }
    }
  }
`;
