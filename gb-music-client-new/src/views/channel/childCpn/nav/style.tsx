import styled from 'styled-components';
export const NavWrapper = styled.div`
@media screen and (max-width: 1440px){
    .channel-list{
      grid-template-columns: repeat(10,70px)!important;
    }
  }
  @media screen and (max-width: 1280px){
    .channel-list{
      grid-template-columns: repeat(9,70px)!important;
    }
  }
  @media screen and (max-width: 1200px){
    .channel-list{
      grid-template-columns: repeat(8,70px)!important;
    }
  }
  @media screen and (max-width: 1100px){
    .channel-list{
      grid-template-columns: repeat(7,70px)!important;
    }
  }
  @media screen and (max-width: 975px){
    .channel-list{
      grid-template-columns: repeat(6,70px)!important;
    }
  }

  .channel-list {
    padding: 20px 30px 5px 30px;
    display: grid;
      justify-content: space-between;
      grid-template-columns: repeat(14,70px);
    & > li {
      width: 70px;
      height: 70px;
      border: 2px solid transparent;
      border-radius: 4px;
      margin:0 0 15px 0;
      &:hover {
        background-color: #f6f7f7;
        cursor: pointer;
      }
      &.active {
        border-color: #db5e5e;
      }
    }
    .img-container {
      width: 48px;
      height: 48px;
      margin: 0 auto;
      background-repeat: no-repeat;
    }
    .active {
      .img-container {
        background-position: -48px 0;
      }
      .title {
        color: #db5e5e;
      }
    }
    .title {
      text-align: center;
      font-size: 12px;
      color: #888;
    }
  }
`;
