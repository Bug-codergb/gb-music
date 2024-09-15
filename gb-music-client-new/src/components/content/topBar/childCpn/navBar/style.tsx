import styled from 'styled-components';
export const NavBarWrapper = styled.div`
  .nav-list {
    background-color: #fff;
    margin: auto 0;
    li {
      padding: 9px 20px;
      font-size: 15px;
      cursor: pointer;
      display: flex;
      align-items: center;
      &.active {
        color: #da4f49;
        font-weight: normal;
        font-size: 15px;
        background-color: #f6f6f7;
        .nav-icon {
          color: #da4f49;
        }
        .nav-name {
          color: #da4f49;
        }
      }
      .nav-name {
        font-size: 15px;
        color: #5e5e5e;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        text-align: left;
        flex: 1;
      }
      .nav-icon {
        font-size: 20px;
        margin: 0 10px 0 0;
        color: #5e5e5e;

        svg {
          font-size: 17px;
        }
      }
      .icon-sub {
        font-weight: 600;
      }
    }
    .nav-label {
      padding: 6px 20px;
      color: #9f9f9f;
      font-size: 12px;
    }
  }
`;
