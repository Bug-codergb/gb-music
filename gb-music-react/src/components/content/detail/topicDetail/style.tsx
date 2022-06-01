import styled from 'styled-components';
export const TopicDetailWrapper = styled.div`
  background-color: #f5f5f5;
`;
export const CenterContent = styled.div`
  width: 980px;
  border-right: 1px solid #d3d3d3;
  border-left: 1px solid #d3d3d3;
  margin: 0 auto;
  background-color: #fff;
  .header {
    width: 100%;
    height: 350px;
    background-repeat: no-repeat;
    background-color: pink;
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    .content {
      display: flex;
      flex-direction: column-reverse;
      align-items: center;
      .title {
        font-size: 36px;
        color: #fff;
      }
      .control-btn {
        display: flex;
        justify-content: space-between;
        width: 110%;
        margin: 20px 0 0 0;
        button {
          background-color: #f4f5f6;
          color: #d33333;
          font-size: 22px;
          padding: 5px 40px;
          border-radius: 8px;
          display: flex;
          align-items: center;
          flex-wrap: nowrap;
          &:hover {
            background-color: #fff;
          }
        }
        i {
          color: #d33333;
          font-size: 28px;
        }
      }
    }
  }
  .moment-list {
    padding: 0 20px;
    & > li {
      display: flex;
      align-items: flex-start;
      border-bottom: 1px solid #e0e0e0;
      padding: 20px 0;
      position: relative;
      .avatar {
        width: 50px;
        height: 50px;
        overflow: hidden;
        border-radius: 50%;
        img {
          height: 100%;
        }
      }
      .msg {
        flex: 1;
        margin: 0 0 0 10px;
        .user-name {
          color: #507daf;
          font-size: 13px;
        }
        .create-time {
          font-size: 13px;
          color: #9f9f9f;
          margin: 5px 0 0 0;
        }
        .content {
          font-size: 14px;
          color: #373737;
          margin: 15px 0 0 0;
        }
        .music {
          padding: 10px;
          background-color: #efeff0;
          display: flex;
          margin: 10px 0 0 0;
          border-radius: 5px;
          .img-container {
            width: 45px;
            height: 45px;
            overflow: hidden;
            border-radius: 5px;
            img {
              height: 100%;
            }
          }
          .song-info {
            margin: 0 0 0 10px;
            .artist-name,
            .song-name {
              font-size: 13px;
              color: #959596;
            }
            .song-name {
              color: #333;
            }
          }
        }
        .picture {
          margin: 10px 0;
          img {
            height: 200px;
            border-radius: 5px;
          }
        }
      }
      & > .operator {
        position: absolute;
        left: 100%;
        top: 5%;
        transform: translate(-150%, 0);
        cursor: pointer;
        & > i {
          font-size: 30px;
          color: #9b9b9b;
        }
        .del-outer {
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
          text-align: center;
          padding: 10px 5px;
          background-color: #fff;
          border-radius: 3px;
          i {
            font-size: 24px;
            color: #9b9b9b;
          }
        }
      }
      &#page {
        display: flex;
        justify-content: center;
        border: none;
      }
    }
  }
`;
