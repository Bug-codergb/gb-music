import styled from 'styled-components';
export const NavBarWrapper = styled.div`
  .nav-list {
    display: flex;
    align-items: center;
    background-color: #fff;
    margin: auto 0;
    li {
      padding: 0 20px;
      font-size: 14px;
      cursor: pointer;
      &.active {
        color: #ec4141;
      }
    }
  }
`;
