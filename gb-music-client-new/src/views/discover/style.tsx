import styled from 'styled-components';
export const DiscoverWrapper = styled.div`
  background-color: #ffffff;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  .list-outer {
    background-color: #ffffff;
    height: 50px;
    padding: 10px 20px;
    margin: 0 0 3px 0;
  }
  .discover-list {
    width: 1190px;
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
        color: #646464;
        border-bottom: 3px solid transparent;
      }
      &.active {
        span {
          color:#333;
          font-weight:bold;
          border-bottom: 3px solid #da4f49;
        }
      }
    }
  }
  .discover-content{
    flex: 1;
    overflow-y: auto;
  }
`;
