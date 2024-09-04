import styled from 'styled-components';
export const VideoDetailWrapper = styled.div`
  background-color: #fff;
`;
export const CenterContent = styled.div`
  width: 1220px;
  margin: 0 auto;
  background-color: #fff;
  display: flex;
  flex-wrap: nowrap;
`;
export const LeftContent = styled.div`
  border-right: 1px solid #e0e0e0;
  width: 820px;
  .video-header {
    margin: 30px 0;
    .video-container {
      height: 400px;
      width: 90%;
      background-color: #000;
      margin: 0 auto;
      text-align: center;
      padding: 0 20px 10px 20px;
      border-radius: 3px;
      video {
        height: 83%;
      }
      .control {
        margin: 15px 0 0 0;
        .progress {
          .ant-slider {
            padding: 0 !important;
            margin: 0 !important;
          }
          .ant-slider-track {
            background-color: #ec4141 !important;
          }
          .ant-slider-handle {
            border: 2px solid #ec4141;
          }
        }
        .control-btn {
          display: flex;
          align-items: center;
          justify-content: space-between;
          .btn-dt {
            display: flex;
            align-items: center;
            .play-or-pause {
              display: flex;
              align-items: center;
              cursor: pointer;
              span {
                display: inline-block;
                width: 30px;
                height: 30px;
                text-align: center;
                line-height: 26px;
                color: #fff;
                border: 2px solid #bdbdbd;
                border-radius: 50%;
                &:nth-child(2) {
                  i {
                    font-size: 20px;
                  }
                }
              }
            }
            .dt {
              color: #bdbdbd;
              margin: 0 0 0 15px;
            }
          }
          .rate {
            margin: 0 15px 0 0;
            cursor: pointer;
            position: relative;
            & > span {
              color: #bdbdbd;
              font-weight: bold;
            }

            .rate-list {
              position: absolute;
              top: 0;
              left: 50%;
              transform: translate(-50%, -120%);
              background-color: rgba(0, 0, 0, 0.8);
              padding: 0 15px;
              border-radius: 5px;
              & > li {
                color: #fff;
                padding: 5px 15px;
              }
              .active {
                color: #ec4747;
              }
            }
            .rate-enter {
              opacity: 0;
            }
            .rate-enter-active {
              opacity: 1;
              transition: opacity 500ms;
            }
            .rate-enter-done {
              opacity: 1;
            }
            .rate-exit {
              opacity: 1;
            }
            .rate-exit-active {
              opacity: 0;
              transition: opacity 500ms;
            }
            .rate-exit-done {
              opacity: 0;
            }
          }
          .volume {
            display: flex;
            align-items: center;
            justify-content: space-between;
            .volume-icon {
              margin: 0 10px 0 0;
              i {
                color: #bdbdbd;
                font-size: 20px;
              }
            }
            .volume-progress {
              width: 100px;
              .ant-slider-track {
                background-color: #ec4141 !important;
              }
              .ant-slider-handle {
                border: 2px solid #ec4141;
              }
            }
          }
          .full-screen {
            cursor: pointer;
            margin: 0 0 0 15px;
            i {
              color: #bdbdbd;
              font-size: 18px;
            }
          }
        }
      }
    }
  }
`;
export const RightContent = styled.div`
  flex: 1;
  width: 27%;
`;
