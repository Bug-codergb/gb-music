import styled from 'styled-components';
export const RadioWrapper = styled.div`
  height:100%;
  overflow:hidden;
  .table-box{
    overflow-y:auto!important;
  }
 @media screen and (max-width:1240px){
    .channel-list{
      grid-template-columns: repeat(2,49%)!important;
    }
    
  }

  .channel-list {
    grid-template-columns: repeat(3,32%);
    justify-content: space-between;
    display: grid;
    & > li {
    
      background-color:#fff;
      padding: 20px 0 20px 20px;
      display: flex;
      align-items: center;
      border-radius:5px;
    
      margin: 0 0 15px 0;
      .right-msg {
        margin: 0 0 0 40px;
        flex: 1;
        height: 100%;
        .msg {
          color: #de5e5e;
          display: flex;
          align-items: center;
          height: 100%;
          cursor: pointer;
        }
      }
    }
    .img-container {
      width: 65px;
      height: 65px;
      background-repeat: no-repeat;
      background-size: 100px;
      background-position: -45px 0;
    }
    .channel-name {
      text-align: center;
      width: 65px;
      color: #db5e5e;
      font-weight: bold;
    }
  }
`;
