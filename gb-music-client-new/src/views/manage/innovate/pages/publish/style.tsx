import styled from 'styled-components';
export const PublishWrapper = styled.div`
  background-color: #fff;
  height:100%;
  
  ul.path {
    display: flex;
    align-items: center;
    justify-content: center;
    padding-bottom: 10px;
    border-bottom: 1px solid #eeeeee;
    background-color:#fff;
    padding:20px;
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
  .publish-content{
    flex:1;
    display:flex;
    align-items:center;
    justify-content:center;
    background-color:#fff;
  }  
`;
