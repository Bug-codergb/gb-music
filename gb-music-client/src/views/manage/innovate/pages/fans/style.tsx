import styled from 'styled-components';
export const FansWrapper = styled.div`
  background-color: #fff;
  padding: 20px 0;
  .fan-list {
    display: flex;
    flex-wrap: wrap;
    & > li {
      display: flex;
      align-items: center;
      padding: 20px 30px 20px 20px;
      border-left: 2px solid #f3f3f3;
      border-bottom: 2px solid #f3f3f3;
      .right-msg {
        display: flex;
        & > div {
          padding: 0 10px;
          .name {
            font-size: 14px;
            color: #999999;
          }
          .value {
            font-weight: bold;
            font-size: 18px;
            color: #333;
          }
        }
      }
    }
    .img-container {
      width: 120px;
      height: 120px;
      background-color: #000c17;
      position: relative;
      border-radius: 8px;
      overflow: hidden;
      img {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
      }
    }
  }
  .fans-empty {
    padding: 200px 0;
    display: flex;
    justify-content: center;
  }
`;
