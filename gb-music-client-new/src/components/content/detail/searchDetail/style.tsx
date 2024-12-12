import styled from 'styled-components';
export const SearchDetailWrapper = styled.div`
  background-color: #fff;
  width:100%;
  height:100%;
  display: flex;
  .left-content {
    border-right: 1px solid #e0e0e0;
    width: 74%;
    height:100%;
    overflow-y:auto;
    padding:10px 16px 0 0;
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
  }
  .right-content {
  }
`;
export const CenterContent = styled.div`
  background-color: #fff;
  width:100%;
   height:100%;
   padding:0 16px;
`;
