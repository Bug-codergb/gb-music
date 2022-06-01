import styled from 'styled-components';
export const MomentsWrapper = styled.ul`
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
      .time-name {
        display: flex;
        align-items: center;
        justify-content: space-between;
        & > .operator {
          cursor: pointer;
          position: relative;
          & > i {
            font-size: 30px;
            color: #9b9b9b;
          }
          .del-outer {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 12px 8px;
            background-color: #fff;
            border-radius: 3px;
            position: absolute;
            left: 0;
            top: 100%;
            i {
              font-size: 20px;
              color: #9b9b9b;
            }
          }
        }
      }
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
          .vip-song-name {
            display: flex;
            align-items: center;
            .is-vip {
              margin: 0 0 0 5px;
              border: 2px solid #fa8153;
              color: #fa8153;
              font-weight: 600;
              font-family: Arial, Helvetica, sans-serif;
              font-size: 12px;
              padding: 0 5px;
              border-radius: 4px;
              cursor: pointer;
              transform: scale(0.9);
              line-height: 14px;
            }
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
    &#page {
      display: flex;
      justify-content: center;
      border: none;
    }
  }
`;
