import styled from 'styled-components';
export const MsgDetailWrapper = styled.div`
  background-color: #f5f5f5;
`;
export const CenterContentWrapper = styled.div`
  width: 1160px;
  margin: 0 auto;
  border-left: 1px solid #d3d3d3;
  border-right: 1px solid #d3d3d3;
  background-color: #fff;
  padding: 30px 20px;
  .msg-nav-list {
    display: flex;
    align-items: center;
    & > li {
      padding: 0 16px 5px 16px;
      border-bottom: 1px solid transparent;
      cursor: pointer;
      margin: 0 5px 0 0;
      &.active {
        border-bottom: 2px solid #ec4141;
        font-weight: bold;
      }
    }
  }
  .msg-detail-content {
    padding: 5px 0 30px 0;
  }
`;
