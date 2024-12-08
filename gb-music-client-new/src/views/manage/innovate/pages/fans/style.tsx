import styled from 'styled-components';
export const FansWrapper = styled.div`
  background-color: #fff;
  width:100%;
  height:100%;
  .table-box{
    overflow-y:auto;
  }
    @media screen and (max-width:1415px){
    .fan-list{
      grid-template-columns: repeat(2,49%)!important;
    }
  }
  
    @media screen and (max-width:1230px){
    .fan-list{
      grid-template-columns: repeat(1,100%)!important;
    }
    
  }
  .fan-list {
      display: grid;
      grid-template-columns: repeat(3,32%);
      justify-content: space-between;
    & > li {
      display: flex;
      align-items: center;
      padding: 20px 30px 20px 20px;
      background-color:#fff;
      margin:0 0 20px 0;
      border-radius:4px;
      .right-msg {
      
        margin:0 0 0 20px;
        & > div {
          padding: 0 10px;
          .name {
            font-size: 14px;
            color: #999999;
            margin:0 0 10px 0;
          }
          .value {
            font-weight: bold;
            font-size: 18px;
            color: #333;
          }
        }
      }
    }
    .user-name{
      font-size:18px;
      color:#333;
      margin:0 0 18px 0;
      text-overflow : ellipsis;
      overflow : hidden;
      white-space : nowrap;
    }  
    .img-container {
      width: 120px;
      height: 120px;
      position: relative;
      border-radius: 8px;
      overflow: hidden;
      img {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
      }
      svg{
        font-size:30px;
      }  
    }
  }
  .fans-empty {
    background-color:#fff;
    display: flex;
    justify-content: center;
    height:100%;
    display:flex;
    align-items:center;
  }
`;
