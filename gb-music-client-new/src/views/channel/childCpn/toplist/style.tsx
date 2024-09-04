import styled from 'styled-components';
export const ToplistWrapper = styled.div`
  .rank {
    padding: 0 30px;
    .tip {
      font-size: 12px;
      color: #ce0c0c;
    }
  }
  .channel-list {
    margin: 5px 0 0 0;
    padding: 0 30px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    & > li {
      width: 48%;
      border-bottom: 2px solid #e7e7e7;
      display: flex;
      padding: 20px 0;
      .img-container {
        img {
          width: 170px;
          border: 1px solid rgba(0, 0, 0, 0.2);
        }
      }
      .right-msg {
        margin: 0 0 0 20px;
        .title {
          font-size: 18px;
          color: #333;
          font-weight: bolder;
        }
      }
    }
  }
  .empty {
    padding: 200px 0;
  }
`;
