import styled from 'styled-components';
export const HomeWrapper = styled.div`
  height:100%;
  overflow-y:hidden;
  display:flex;
  flex-direction:column;
  .card-container p {
    margin: 0;
  }
  .card-container > .ant-tabs-card .ant-tabs-content {
    height: 120px;
    margin-top: -16px;
  }
  .card-container > .ant-tabs-card .ant-tabs-content > .ant-tabs-tabpane {
    padding: 16px;
    background: #fff;
  }
  .card-container > .ant-tabs-card > .ant-tabs-nav::before {
    display: none;
  }
  .card-container > .ant-tabs-card .ant-tabs-tab,
  [data-theme='compact'] .card-container > .ant-tabs-card .ant-tabs-tab {
    background: transparent;
    border-color: transparent;
  }
  .card-container > .ant-tabs-card .ant-tabs-tab-active,
  [data-theme='compact'] .card-container > .ant-tabs-card .ant-tabs-tab-active {
    background: #fff;
    border-color: #fff;
  }
  #components-tabs-demo-card-top .code-box-demo {
    padding: 24px;
    overflow: hidden;
    background: #f5f5f5;
  }
  [data-theme='compact'] .card-container > .ant-tabs-card .ant-tabs-content {
    height: 120px;
    margin-top: -8px;
  }
  [data-theme='dark'] .card-container > .ant-tabs-card .ant-tabs-tab {
    background: transparent;
    border-color: transparent;
  }
  [data-theme='dark'] #components-tabs-demo-card-top .code-box-demo {
    background: #000;
  }
  [data-theme='dark'] .card-container > .ant-tabs-card .ant-tabs-content > .ant-tabs-tabpane {
    background: #141414;
  }
  [data-theme='dark'] .card-container > .ant-tabs-card .ant-tabs-tab-active {
    background: #141414;
    border-color: #141414;
  }
  .ant-tabs-tab-btn {
    font-size: 20px;
    color: #646465;
  }
  .ant-tabs-tab.ant-tabs-tab-active .ant-tabs-tab-btn {
    color: #333333;
    font-size: 20px;
    text-shadow: 0 0 0.25px currentColor;
  }
  .ant-tabs-card > .ant-tabs-nav .ant-tabs-tab,
  .ant-tabs-card > div > .ant-tabs-nav .ant-tabs-tab {
    padding: 8px 24px;
  }
  .vio-list {
    background-color: #fff;
    padding: 15px 0;
    flex:1;
    overflow-y:auto;
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 20px;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .index {
        width: 2%;
        color: #cacad9;
        font-size: 13px;
      }
      .img-container {
        width: 140px;
        border-radius: 4px;
        overflow: hidden;
        margin: 0 20px 0 0;
        img {
          width: 100%;
        }
      }
      .state {
        width: 30%;
        margin: 0 5px 0 0;
        font-size: 17px;
        color:#333;
      }
      .create-time {
        width: 10%;
        color: #9b9b9b;
        margin: 0 0 0 10px;
      }
      .play-count {
        color: #9b9b9b;
        width: 5%;
        i {
          color: #9b9b9b;
          font-size: 14px;
        }
      }
      .comment {
        width: 5%;
        color: #9b9b9b;
        i {
          color: #9b9b9b;
          font-size: 13px;
        }
      }
      .thumb {
        width: 5%;
        color: #9b9b9b;
        i {
          color: #9b9b9b;
        }
      }
      &.vio-empty {
        padding: 100px 0;
        display: flex;
        justify-content: center;
        background-color: #fff;
      }
    }
  }
  .channel-list {
    background-color: #fff;
    padding: 15px 0;
    flex:1;
    overflow-y:auto;
    & > li {
      display: flex;
      align-items: center;
      display: flex;
      align-items: center;
      padding: 10px 20px;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .index {
        width: 2%;
        color: #cacad9;
        font-size: 13px;
      }
      .img-container {
        width: 90px;
        border-radius: 4px;
        overflow: hidden;
        margin: 0 20px 0 0;
        img {
          width: 100%;
        }
      }
      .state {
        width: 30%;
        margin: 0 5px 0 0;
        font-size: 17px;
        color:#fff;
      }
      .create-time {
        width: 10%;
        color: #9b9b9b;
        margin: 0 0 0 10px;
      }
      .play-count {
        color: #9b9b9b;
        width: 5%;
        i {
          color: #9b9b9b;
          font-size: 14px;
        }
      }
      .comment {
        width: 5%;
        color: #9b9b9b;
        i {
          color: #9b9b9b;
          font-size: 13px;
        }
      }
      &.ch-empty {
        padding: 100px 0;
        justify-content: center;
        background-color: #fff;
      }
    }
  }
`;
export const UserMomentWrapper = styled.div`
  background-color: #fff;
  padding: 20px;
  width: 100%;
  overflow-y:auto;
  flex:1;
  & > ul {
    overflow-y:auto;
    width: 100%;
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      width: 100%;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .index {
        margin: 0 10px 0 0;
      }
      .img-container {
        width: 130px;
        background-color: #000;
        height: 60px;
        overflow: hidden;
        border-radius: 4px;
        position: relative;
        margin: 0 20px 0 0;
        img {
          position: absolute;
          left: 50%;
          top: 50%;
          width: 100%;
          transform: translate(-50%, -50%);
        }
      }
      .content {
        width: 50%;
        margin: 0 35px 0 0;
        color:#333;
      }
      .user-name {
        color: #0086b3;
        margin: 0 30px 0 0;
      }
      .create-time {
        font-size: 13px;
        color: #9c9c9c;
      }
    }
  }
  .m-empty{
    padding: 120px 0;
  }
`;
