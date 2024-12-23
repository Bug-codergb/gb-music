import styled from 'styled-components';
import coverall from '../../../assets/img/coverall.png';
export const PlayCoinWrapper = styled.div`
  background-color: #fff;
  height: 90px;

  border-top: 1px solid #e0e0e0;
  width: 100%;
  position: fixed;
  left: 0;
  top: 100%;
  transform: translate(0, -100%);
  z-index: 99;

  display: flex;
  justify-content: center;
`;
export const CenterContent = styled.div`
  position: relative;
  width: 1380px;
  height: 100%;
  display: flex;
  align-items: center;
  flex-direction: row;
  background-color: #fff;
  justify-content: space-between;
  padding: 10px 0;
  .img-container {
    width: 50px;
    height: 50px;
    overflow: hidden;
    border-radius: 5px;
    position: relative;
    img {
      width: 50px;
    }
    .mask {
      position: absolute;
      width: 100%;
      height: 100%;
      z-index: 100;
      top: 0;
      background-image: url(${coverall});
      background-position: 0 -80px;
    }
  }
  .msg {
    display: flex;
    align-items: center;
    width: 230px;
    .right-msg {
      margin: 0 0 0 15px;
      p {
        margin: 0;
        max-width: 120px;
      }
      .song-name-outer {
        display: flex;
        align-items: center;
        .vip {
          cursor: pointer;
          margin: 0 0 0 5px;
          font-size: 12px;
          color: #fa8153;
          font-weight: 600;
          line-height: 13px;
          transform: scale(0.85);
          border: 2px solid #fa8153;
          border-radius: 4px;
          padding: 0 4px 1px 4px;
        }
      }
      .song-name {
        margin: 0;
        font-size: 16px;
        color: #353536;
      }
      .artist-name {
        font-size: 13px;
        color: #353536;
      }
    }
  }
  .control {
    background-color: #fff;
    width: 800px;
    .control-btn {
      display: flex;
      width: 550px;
      justify-content: space-evenly;
      margin: 0 auto 5px;
      align-items: center;
      .lyric {
        cursor: pointer;
      }
      .mode {
        cursor: pointer;
        i {
          font-size: 24px;
          color: #262626;
        }
      }
      .prev {
        transform: rotateZ(180deg);
      }
      .next,
      .prev {
        cursor: pointer;
        i {
          font-size: 30px;
        }
      }
      .play-or-pause {
        background-color: #ebebed;
        width: 40px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        border-radius: 50%;
        cursor: pointer;
        &:hover {
          background-color: #ddddde;
        }
        i {
          font-size: 20px;
          margin: 0 0 0 1px;
          &.icon-pause {
            font-size: 25px;
          }
        }
      }
    }
    .progress {
      display: flex;
      align-items: center;
      justify-content: space-between;
      .progress-bar {
        width: 90%;
        .ant-slider {
          margin: 0 6px !important;
        }
      }
      /*.ant-slider-handle {
        width: 12px;
        height: 12px;
        top: 10%;
        transform: 0;
        border-color: #ec4141;
      }
      .ant-slider-track {
        background-color: #ec4141;
      }
      .ant-slider-rail {
        background-color: #ececec;
      }*/
      .current-time,
      .dt {
        color: #99999b;
        font-size: 12px;
      }
    }
  }
  .operator {
    background-color: #fff;
    width: 240px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 0 0 60px;
    .volume {
      width: 120px;
      align-items: center;
      justify-content: space-between;
      display: flex;
      i {
        font-size: 20px;
      }
      .volume-bar {
        width: 100px;
        /*.ant-slider-handle {
          width: 11px;
          height: 11px;

          border-color: #ec4141;
        }
        .ant-slider-track {
          background-color: #ec4141;
        }*/
      }
    }
    .playlist {
      position: relative;
      cursor: pointer;
      i {
        font-size: 24px;
      }
    }
  }
  .cur-lyric {
    font-size: 18px;
    padding: 10px 30px;
    border-radius: 12px;
    background-color: rgba(0, 0, 0, 0.5);
    position: absolute;
    top: 0;
    left: 50%;
    transform: translate(-50%, -120%);
    z-index: 999;
    color: #fff;
  }
  .lyric {
    &.active {
      color: #ec4141;
    }
  }
  .playlist-enter,
  .lyric-enter {
    opacity: 0;
  }
  .playlist-enter-active,
  .lyric-enter-active {
    opacity: 1;
    transition: opacity 500ms;
  }
  .playlist-enter-done,
  .lyric-enter-done {
    opacity: 1;
  }
  .playlist-exit,
  .lyric-exit {
    opacity: 1;
  }
  .playlist-exit-active,
  .lyric-exit-active {
    opacity: 0;
    transition: opacity 500ms;
  }
  .playlist-exit-done,
  .lyric-exit-done {
    opacity: 0;
  }
`;
