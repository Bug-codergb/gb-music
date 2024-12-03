import styled from 'styled-components';
export const MVWrapper = styled.div`
  margin: 20px 0 0 0;
  @media screen and (max-width: 1300px) {
    .mv-list {
      grid-template-columns: repeat(4, 200px) !important;
    }
  }
  @media screen and (max-width: 1090px) {
    .mv-list {
      grid-template-columns: repeat(3, 200px) !important;
    }
  }
  .mv-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin:20px 0 0 0;
    display: grid;
    justify-content: space-between;
    grid-template-columns: repeat(5, 200px);
    & > li {
      margin: 0 0 15px 0;
      width: 200px;
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
