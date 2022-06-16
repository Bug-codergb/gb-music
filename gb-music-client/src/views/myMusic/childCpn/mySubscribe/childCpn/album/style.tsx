import styled from 'styled-components';
export const AlbumWrapper = styled.div`
  .sub-albums {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:hover {
        background-color: #f0f1f2;
      }
      .index {
        padding: 0 10px;
        color: #cfcfcf;
        font-size: 13px;
      }
      .img-container {
        width: 60px;
        height: 60px;
        border-radius: 5px;
        overflow: hidden;
        margin: 0 20px 0 0;
        cursor: pointer;
        img {
          width: 100%;
        }
      }
      .name {
        width: 20%;
        cursor: pointer;
      }
      .publish-time {
        color: #9b9b9b;
        font-size: 13px;
      }
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 10px 0 0 0;
  }
`;
