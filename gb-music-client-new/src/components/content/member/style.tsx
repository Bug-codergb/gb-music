import styled from 'styled-components';
import bgc from '../../../assets/img/member-bgc.png';
export const MemberWrapper = styled.div`
  background-color: #f3f4f5;
`;
export const CenterContent = styled.div`
  width: 1220px;
  margin: 0 auto;
  padding-bottom: 30px;
  .header-msg {
    display: flex;
    align-items: flex-start;
    background-image: url(${bgc});
    background-repeat: no-repeat;
    background-position: center right;
    background-size: auto 210px;
    padding: 30px 40px;
    .img-container {
      width: 150px;
      height: 150px;
      overflow: hidden;
      position: relative;
      img {
        width: 150px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
      }
    }
    .right-msg {
      margin: 0 0 0 20px;
      .user-name {
        font-weight: bold;
        font-size: 23px;
        margin: 0 0 10px 0;
      }
      .expireTime {
        span {
          margin: 0 5px 0 0;
        }
      }
    }
  }
  .body-content {
    background-color: #fff;
    display: flex;
    align-items: center;
    flex-direction: column-reverse;
    .combo-list {
      display: flex;
      padding: 40px 0 0 40px;
      & > li {
        width: 180px;
        height: 150px;
        display: flex;
        cursor: pointer;
        justify-content: center;
        align-items: center;
        flex-direction: column-reverse;
        box-shadow: 0 0 12px rgba(0, 0, 0, 0.2);
        margin: 0 20px 0 0;
        border-radius: 8px;
        &.active {
          border: 2px solid #ff6b6b;
        }
        .name {
          font-weight: bolder;
          font-size: 18px;
        }
        .price {
          color: #ff3a3a;
          font-size: 22px;
        }
      }
    }
    .pay {
      padding: 10px 50px;
      width: 160px;
      display: block;
      background-color: #ff3a3a;
      color: #fff;
      border-radius: 18px;
      margin: 20px auto;
    }
    .history-vip {
      width: 100%;
      & > li {
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #9b9b9b;
        .history-info {
          .vip {
          }
          .time {
            margin: 5px 0;
          }
          .order {
          }
        }
        .price {
          color: #ec4141;
          & > span {
            font-size: 28px;
            color: #ec4141;
          }
          .status {
            font-size: 16px;
            margin: 0 0 0 20px;
          }
          .finish {
            color: #7ec050;
          }
          .delete {
            font-size: 14px;
            margin: 0 0 0 20px;
            cursor: pointer;
            color: #eb4d45;
          }
          .go-pay {
            margin: 0 0 0 20px;
            font-size: 14px;
            cursor: pointer;
            color: #5a9cf8;
          }
        }
      }
    }
  }
  .privilege {
    margin: 20px 0 0 0;
    & > p {
      text-align: center;
      font-weight: bold;
      font-size: 25px;
    }
    .control-btn {
      display: flex;
      justify-content: center;
      margin: 30px 0;
      & > li {
        width: 150px;
        text-align: center;
        p {
          text-align: center;
          margin: 10px 0 0 0;
        }
      }
    }
  }
`;
