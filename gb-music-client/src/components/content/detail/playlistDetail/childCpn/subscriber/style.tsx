import styled from 'styled-components';
export const SubscriberWrapper = styled.div`
  .user-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    & > li {
      width: 50%;
      display: flex;
      align-items: center;
      margin: 0 0 20px 0;
      .img-container {
        width: 80px;
        height: 80px;
        overflow: hidden;
        border-radius: 50%;
        margin: 0 20px 0 0;
        img {
          height: 100%;
        }
      }
    }
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 20px 0;
  }
`;
