import styled from 'styled-components';
export const CateTitleWrapper = styled.div`
  display: flex;
  justify-content: space-between;
  .list {
    display: flex;
    align-items: center;
    & > li {
      padding: 3px 15px;
      font-size: 13px;
      cursor: pointer;
      border-radius: 13px;
      &.active {
        color: #ec4141;
        background-color: #fcebeb;
      }
    }
  }
`;
