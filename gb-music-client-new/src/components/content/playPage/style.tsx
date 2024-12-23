import styled from 'styled-components';
import singlecover from '../../../assets/img/singlecover.png';
export const PlayPageWrapper = styled.div`
  background-color: #fff;
  .play {
    padding: 40px 0 0 0;
    display: flex;
    justify-content: space-around;
    position: relative;
    .play-album {
      display: flex;
      flex-direction: column;
      align-items: center;
      @keyframes test {
        from {
          transform: rotateZ(0deg);
        }
        to {
          transform: rotateZ(1turn);
        }
      }
      .rotate-album {
        width: 280px;
        height: 280px;
        border-radius: 50%;
        text-align: center;
        overflow: hidden;
        animation: test infinite linear 13s;
        background-color: #060606;
        background-image: url(${singlecover});
        background-repeat: no-repeat;
        background-position: center;
        background-size: 290px;
        line-height: 280px;
        img {
          width: 68%;
          vertical-align: middle;
          border-radius: 50%;
        }
      }
      .control-btn {
        margin: 50px 0 0 0;
        ul {
          display: flex;
          li {
            margin: 0 20px;
            height: 45px;
            width: 45px;
            border-radius: 50%;
            background-color: #f5f5f5;
            text-align: center;
            line-height: 48px;
            i {
              font-size: 24px;
            }
            &:hover {
              background-color: #ebebeb;
              cursor: pointer;
            }
          }
        }
      }
    }
    /*收藏到歌单*/
    .user-album {
      padding: 30px 20px;
      width: 500px;
      height: 400px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      background-color: #fff;
      z-index: 999;
      .exit {
        cursor: pointer;
        position: absolute;
        left: 100%;
        top: 0;
        transform: translate(-120%, 0) rotateZ(45deg);
        i {
          font-size: 24px;
          color: #d3d3d3;
        }
      }
      p {
        font-size: 16px;
        font-weight: bold;
        text-align: center;
      }
      .create-play-list {
        display: flex;
        align-items: center;
        i {
          font-size: 20px;
          margin: 0 10px 0 0;
        }
      }
      
    }
    .song-msg {
      width: 34%;
      .song-name {
        font-size: 19px;
        font-weight: bold;
        display: flex;
        color: #2f2f2f;
        word-break:break-all;
        margin:0 0 20px 0;
        &>span{
          font-size:18px;
        }
        .tag {
          margin: 0 0 0 10px;
          flex:1;
          white-space:nowrap;
          display:flex;
          align-items:center;
          span {
            color: #eb6363;
            border: 1px solid #eb6363;
            margin: 0 5px 0 0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            padding: 0 5px;
            border-radius: 4px;
            cursor: pointer;
            &:nth-child(1) {
              color: #fa8153;
              border: 1px solid #fa8153;
            }
          }
        }
      }
      & > ul {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        & > .album-name {
          width: 60%;
          background-color: #fff;
          cursor: pointer;
        }
        & > .artist-name {
          width: 30%;
          background-color: #fff;
          cursor: pointer;
        }
        & > li {
          white-space: nowrap;
          span {
            margin: 0 0 0 8px;
            color: #507daf;
          }
        }
      }
      .lyric {
        width: 400px;
        height: 300px;
        
        overflow-y: scroll;
        text-align: center;
        .no-tip {
          color: #ec4141;
          width:100%;
          display:flex;
          height:100%;
          justify-content:center;
          align-items:center;
        }

        li {
          padding: 3px 0 3px 10px;
          text-align: center;
          font-size: 14px;
          transition: font-size 0.2s;
          &.active {
            color: #ec4141;
            font-weight: bold;
            font-size: 18px;
          }
        }
      }
    }
  }
  .play-content {
    margin: 30px 0 0 0;
    display: flex;
    .play-left {
      width: 820px;
      border-right: 1px solid #f1f1f1;
      padding: 0 20px 0 0;
      .comment-title {
        font-size: 16px;
        font-weight: bold;
        margin: 0 0 12px 0;
      }
    }
    .play-right {
      flex: 1;
      padding: 30px 15px 0 15px;
    }
  }
`;
export const CenterContent = styled.div`
  padding: 0 20px;
  background-color: #fff;
`;
