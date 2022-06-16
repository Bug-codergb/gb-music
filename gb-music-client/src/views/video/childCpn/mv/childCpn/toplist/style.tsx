import styled from 'styled-components';
export const ToplistWrapper = styled.div`
  .top-mv-list {
    display: flex;
    flex-wrap: wrap;
    li {
      width: 50%;
      border-right: 2px solid #f3f3f3;
      border-bottom: 2px solid #f3f3f3;
      padding: 20px;
      display: flex;
      &:nth-child(odd) {
        padding-left: 0;
      }
      &:nth-child(even) {
        border-right: none;
      }
    }
    .left-content {
      display: flex;
      align-items: center;
      .index {
        color: #9f9f9f;
        font-size: 20px;
        margin: 0 20px 0 0;
      }
      .img-container {
        width: 200px;
        border-radius: 3px;
        overflow: hidden;
        cursor: pointer;
        img {
          width: 100%;
        }
      }
    }
    .right-content {
      margin: 0 0 0 15px;
      .mv-name,
      .artist-name {
        color: #373737;
      }
      .mv-name {
        font-size: 16px;
        cursor: pointer;
        margin: 0 0 10px 0;
      }
      .artist-name {
        font-size: 13px;
        color: #676767;
        &:hover {
          color: #373737;
          cursor: pointer;
        }
      }
    }
  }
`;
