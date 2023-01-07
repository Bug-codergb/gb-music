import styled from 'styled-components';
export const NavBarWrapper = styled.div`
  .nav-list {
    background-color: #fff;
    margin: auto 0;
    li {
      padding: 12px 20px;
      font-size: 15px;
      cursor: pointer;
      &.active {
        color: #ec4141;
        font-weight: bolder;
        font-size: 16px;
        background-color: #f6f6f7;
      }
    }
  }
`;
