import styled from 'styled-components';
export const NavListWrapper = styled.div`
  border-right: 1px solid #eeeeee;
  .publish {
    background-color: #dd001b;
    color: #fff;
    padding: 7px 15px;
    width: 160px;
    margin: 20px 0 20px 10px;
    border-radius: 17px;
    cursor: pointer;
  }
  .title {
    font-size: 18px;
    color: #333333;
    padding-left: 30px;
    i.iconfont {
      color: #a4a4a4;
    }
  }
  .nav-item {
    padding: 9px 70px 9px 55px;
    cursor: pointer;
    &.active {
      color: #ec4141;
    }
    &:hover {
      background-color: #eeeeee;
    }
  }
`;
