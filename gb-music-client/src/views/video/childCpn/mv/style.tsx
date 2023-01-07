import styled from 'styled-components';
export const MVWrapper = styled.div`
  margin: 20px 0 0 0;
  .mv-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    & > li {
      margin: 0 0 15px 0;
      width: 180px;
    }
  }
  .page {
    padding: 20px 0;
    display: flex;
    justify-content: center;
    margin: 0 0 30px 0;
  }
  .empty {
    padding: 150px 0;
  }
`;
