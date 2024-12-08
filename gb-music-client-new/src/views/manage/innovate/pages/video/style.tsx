import styled from 'styled-components';
export const VideoWrapper = styled.div`
  background-color: #fff;
  height:100%;
  .table-box{
    height:100%;
    overflow-y:auto;
    justify-content:space-between;
  }
  .video-time {
    margin: 0 0 30px 0;
    .create-time {
      color: #9b9b9b;
      font-size: 13px;
    }
  }
     @media screen and (max-width:1400px){
    .vio-list{
      grid-template-columns: repeat(4,24%)!important;
    }
    
  }
    @media screen and (max-width:1230px){
    .vio-list{
      grid-template-columns: repeat(3,32%)!important;
    }
    
  }
   
  .vio-list {
    display: grid;
    grid-template-columns: repeat(5,19%);
    justify-content: space-between;
    & > li {
      background-color:#fff;
      margin:0 0 15px 0;
      padding:14px;
      border-radius:4px;
      &> div{
        width:100%!important;
        .img-container{
          width:100%;
          aspect-ratio:1.64333333!important;
          height:auto!important;
        }
      }
      .play-count{
        transform: translate(-110%, 15%)!important;
        width:fit-content!important;
      }  
      .dt{
       transform: translate(-110%, -150%);
      }  
    }
    .del {
      cursor: pointer;
      i {
        color: #9b9b9b;
      }
    }
  }
  .vio-empty {
    padding: 200px 0;
  }
`;
