import styled from 'styled-components';
export const TopBarWrapper = styled.div`
  height: 63px;
  background-color: #fff;
  z-index: 99999999;
  width: 100%;
`;
export const CenterContent = styled.div`
  height: 100%;
  width: 100%;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  .left-content {
    display: flex;
    align-items: center;
  }
  .right-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    .innovation {
      border: 1px solid #00aeec;
      height: 40px;
      display: flex;
      align-items: center;
      padding: 7px 15px;
      font-size: 13px;
      margin: 0 5vw 0 20px;
      border-radius: 3px;
      color: #333333;
      cursor: pointer;
      &:hover {
        color: #000;
      }
    }
    .msg {
      margin: 0 20px 0 30px;
      position: relative;
      i {
        font-size: 20px;
        color: #333333;
        cursor: pointer;
      }
      .count {
        position: absolute;
        left: 5%;
        top: 20%;
        background-color: #ec4141;
        color: #fff;
        font-size: 12px;
        padding: 1px 5px 3px 5px;
        transform: translate(60%, -20%);
        line-height: 13px;
        border-radius: 5px;
      }
    }
  }
  .logo {
    img {
      width: 45px;
      border-radius: 5px;
      cursor: pointer;
    }
  }
  .nav-bar {
    margin: 0 30px;
  }
  .search-outer {
    display: flex;
    align-items: center;
    position: relative;
    height: 40px;
    input {
      border: 1px solid #ec4141;
      padding: 8px 15px;
      font-size: 13px;
      border-radius: 3px 0 0 3px;
      width: 340px;
      height: 100%;
    }
    & > button {
      background-color: #ec4141;
      color: #fff;
      padding: 7px 20px;
      border-radius: 0 3px 3px 0;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      &:hover {
        background-color: #d73535;
        cursor: pointer;
      }
      i {
        font-size: 16px;
      }
    }
    .search-enter,
    .msg-enter {
      opacity: 0;
    }
    .search-enter-active,
    .msg-enter-active {
      opacity: 1;
      transition: opacity 500ms;
    }
    .search-enter-done,
    .msg-enter-done {
      opacity: 1;
    }
    .search-exit,
    .msg-exit {
      opacity: 1;
    }
    .search-exit-active,
    .msg-exit-active {
      opacity: 0;
      transition: opacity 500ms;
    }
    .search-exit-done,
    .msg-exit-done {
      opacity: 0;
    }
  }
  .msg-enter {
    opacity: 0;
  }
  .msg-enter-active {
    opacity: 1;
    transition: opacity 500ms;
  }
  .msg-enter-done {
    opacity: 1;
  }
  .msg-exit {
    opacity: 1;
  }
  .msg-exit-active {
    opacity: 0;
    transition: opacity 500ms;
  }
  .msg-exit-done {
    opacity: 0;
  }
`;
