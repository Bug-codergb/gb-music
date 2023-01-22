import styled from 'styled-components';
export const SearchDetailWrapper = styled.div`
  background-color: #fff;
  display: flex;
  .left-content {
    border-right: 1px solid #e0e0e0;
    width: 74%;
    .search-result-list {
      display: flex;
      align-items: center;
      margin: 20px 0 0 20px;
      & > li {
        padding: 0 10px;
        cursor: pointer;
        border-bottom: 3px solid transparent;
        &.active {
          border-bottom: 3px solid #ec4141;
          font-weight: bolder;
        }
      }
    }
    .search-content {
      margin: 20px 0 0 0;
    }
  }
  .right-content {
  }
`;
export const CenterContent = styled.div`
  width: 1220px;
  margin: 0 auto;
  background-color: #fff;
`;
