import styled from 'styled-components';
export const UserMsgWrapper = styled.div`
  display: flex;
  align-items: center;
  position: relative;
  & > .avatar {
    height: 42px;
    width: 42px;
    background-color:#dcdcdc;
    border-radius: 50%;
    text-align: center;
    line-height: 42px;
    overflow: hidden;
    cursor: pointer;
    position: relative;
    i {
      font-size: 25px;
      color: #fff;
      margin: 0 0 0 1px;
    }
    & > img {
      height: 100%;
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
    }
  }
  .user-name {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
  }
  .is-vip {
    color: #eb6363;
    border: 1px solid #eb6363;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    padding: 0 5px;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
    margin: 0 10px;
    transform: scale(0.9);
  }
  .userInfo-enter,
  .userIno-exit-done,
  .profile-enter,
  .profile-exit-done {
    opacity: 0;
  }
  .userInfo-enter-active,
  .profile-enter-active {
    opacity: 1;
    transition: opacity 300ms;
  }
  .userInfo-enter-done,
  .userInfo-exit,
  .profile-enter-done,
  .profile-exit {
    opacity: 1;
  }
  .userInfo-exit-active,
  .profile-exit-active {
    opacity: 0;
    transition: opacity 300ms;
  }
`;
