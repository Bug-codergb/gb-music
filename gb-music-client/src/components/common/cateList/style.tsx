import styled from 'styled-components';
export const CateListWrapper = styled.div`
  .cate-list {
    display: flex;
    align-items: center;
    li {
      margin: 0 15px 0 0;
      padding: 1px 10px;
      font-size: 13px;
      cursor: pointer;
      border-radius: 15px;
      &.active {
        color: #ec4141;
        background-color: #fdf5f5;
      }
    }
  }
`;
