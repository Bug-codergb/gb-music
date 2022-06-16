import styled from 'styled-components';
export const SimilarWrapper = styled.div`
  .artist-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    & > li {
      width: 110px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      margin: 0 0 20px 0;
      .img-container {
        width: 100px;
        height: 100px;
        overflow: hidden;
        border-radius: 50%;
        border: 1px solid #f9f9f9;
        img {
          width: 100%;
        }
      }
      .artist-name {
        text-align: center;
        margin: 5px 0 0 0;
        width: 86px;
      }
    }
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 20px 0;
  }
`;
