import styled from 'styled-components';
export const DiscoverWrapper = styled.div`
  background-color: #ffffff;
  .list-outer {
    background-color: #ffffff;
    height: 50px;
    margin: 0 0 15px 0;
    padding: 10px 0;
  }
  .discover-list {
    width: 1190px;
    margin: 0 auto;
    display: flex;
    height: 100%;
    li {
      cursor: pointer;
      height: 100%;
      margin: 0 25px 0 0;
      span {
        font-size: 16px;
        padding: 0;
        display: flex;
        align-items: center;
        height: 100%;
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
`;
