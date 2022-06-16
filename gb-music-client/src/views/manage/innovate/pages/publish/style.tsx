import styled from 'styled-components';
export const PublishWrapper = styled.div`
  background-color: #fff;
  padding: 30px 20px 80px 20px;
  ul.path {
    display: flex;
    align-items: center;
    justify-content: center;
    padding-bottom: 10px;
    border-bottom: 1px solid #eeeeee;
    .path-item {
      padding: 0 40px;
      color: #333;
      cursor: pointer;
      span {
        font-size: 18px;
        padding: 0 0 3px 0;
      }
      span.active {
        border-bottom: 3px solid #dd001b;
      }
    }
  }
`;
