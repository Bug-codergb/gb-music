import styled from 'styled-components';
export const TypeListWrapper = styled.div`
  .types {
    display: flex;
    flex-wrap: wrap;
    & > li {
      padding: 1px 12px;
      font-size: 12px;
      cursor: pointer;
      border-radius: 15px;
      margin: 0 15px 10px 0;
      &.active {
        background-color: #fdf5f5;
        color: #ec4141;
      }
    }
  }
`;
