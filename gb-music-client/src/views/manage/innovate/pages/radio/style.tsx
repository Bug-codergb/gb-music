import styled from 'styled-components';
export const RadioWrapper = styled.div`
  background-color: #fff;
  padding: 20px;
  .channel-list {
    display: flex;
    flex-wrap: wrap;
    & > li {
      width: 30%;
      padding: 0 0 0 20px;
      display: flex;
      align-items: center;
      border-right: 2px solid #f3f3f3;
      border-bottom: 2px solid #f3f3f3;
      margin: 0 0 15px 0;
      .right-msg {
        margin: 0 0 0 40px;
        flex: 1;
        height: 100%;
        .msg {
          color: #de5e5e;
          display: flex;
          align-items: center;
          height: 100%;
          cursor: pointer;
        }
      }
    }
    .img-container {
      width: 65px;
      height: 65px;
      background-repeat: no-repeat;
      background-size: 100px;
      background-position: -45px 0;
    }
    .channel-name {
      text-align: center;
      width: 65px;
      color: #db5e5e;
      font-weight: bold;
    }
  }
`;
