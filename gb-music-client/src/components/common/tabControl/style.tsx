import styled from 'styled-components';
export const TabControlWrapper = styled.div`
  .list {
    display: flex;
    align-items: center;
    margin: 0 0 20px 0;
    li {
      margin: 0 20px 0 0;
      cursor: pointer;
      &.active {
        span {
          border-bottom: 3px solid #ec4141;
          padding: 0 0 4px 0;
          font-weight: bold;
        }
      }
    }
  }
`;
