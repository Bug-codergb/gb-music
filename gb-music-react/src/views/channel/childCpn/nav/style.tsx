import styled from 'styled-components';
export const NavWrapper = styled.div`
  .channel-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    padding: 20px 30px;
    & > li {
      width: 70px;
      height: 70px;
      border: 2px solid transparent;
      border-radius: 4px;
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
