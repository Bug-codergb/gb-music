import styled from 'styled-components';
export const HomeWrapper = styled.div`
  height: 100%;
  width:100%;
  position: relative;
  .ant-layout{
    height: 100%;  
  }
  .content-body {
    width: 100%;
    height: 100%;
    overflow-y: scroll;
    display: flex;
    flex-direction: column;
    .router-loading {
      width: 1220px;
      margin: 0 auto;
      padding: 30px 0;
    }
  }
  .gb-music-header{
    background-color:#fff;
    padding: 0 20px!important;
    box-shadow: 0 15px 20px rgba(0,0,0,.7);
    border-bottom: 1px solid #d3d3d3;
  }
  .gb-music-sider{
    height: 100%;
    background-color: white;
    margin: 2px 0 0 0;
    min-width: 190px!important;
    max-width: 190px!important;
    width: 190px!important;
    border-right: 1px solid #d3d3d3;
  }
  .gb-music-footer{
    padding: 0 20px;
    background-color: #fff;
    height: 12vh;
    overflow: hidden;
  }
  .gb-music-content{
    height: 100%;
    
    background-color: white;
  }
  .back-to-top {
    display: flex;
    align-items: center;
    flex-direction: column-reverse;
    font-size: 12px;
    color: #9b9b9b;
    width: 50px;
    height: 50px;
    padding: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    position: fixed;
    top: 90%;
    left: 94%;
    border-radius: 5px;
    cursor: pointer;
    background-color: #fff;
    svg {
      font-size: 20px;
      color: #9b9b9b;
    }
  }
`;
