import styled from 'styled-components';
export const SimiToplistWrapper = styled.div`
  h3 {
    font-weight: bold;
    margin: 0 0 5px 15px;
  }
  .simi-toplist {
    & > li {
      display: flex;
      align-items: flex-start;
      padding: 5px 15px;
      &:hover {
        background-color: #f7f7f7;
      }
      .img-container {
        border-radius: 4px;
        overflow: hidden;
        width: 60px;
        cursor: pointer;
        img {
          width: 100%;
        }
      }
      .name {
        margin: 0 0 0 10px;
      }
    }
  }
`;
