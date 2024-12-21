import styled from "styled-components"
export const MyRadioWrapper = styled.div`
  padding: 20px 20px 0 20px;
  height: 100%;

  @media screen and (max-width:1250px ){
    .channel-list{
      grid-template-columns: repeat(5,150px)!important;
    }
  }
  @media screen and (max-width:1050px){
    .channel-list{
      grid-template-columns: repeat(4,150px)!important;
    }
  }

  .channel-list{
    display: grid;
    justify-content: space-between;
    grid-template-columns: repeat(6,150px);
    &>li{
      margin: 0 0 20px 0;
      cursor: pointer;
      img{
        width: 100%;
        border-radius: 3px;
      }
      .channel-name{
        font-size: 15px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        margin: 10px 0 0 0;
      }
    }
  }
  .empty-div-container{
    height: 100%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
`