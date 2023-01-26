import styled from 'styled-components';
export const NavBarWrapper = styled.div`
  .nav-list {
    background-color: #fff;
    margin: auto 0;
    li {
      padding: 12px 20px;
      font-size: 15px;
      cursor: pointer;
      display: flex;
      align-items: center;
      &.active {
        color: #7293fe;
        font-weight: bolder;
        font-size: 16px;
        background-color: #f6f6f7;
        .nav-icon{
          color: #7293fe;
        }
      }
      .nav-icon{
        font-size: 20px;
        margin: 0 10px 0 0;
        color: #5c5c5c;
      }
      .icon-sub{
        font-weight: 600;
      }
    }
    .nav-label{
      padding: 6px 20px;
      color: #9f9f9f;
      font-size: 12px;
    }
  }
`;
