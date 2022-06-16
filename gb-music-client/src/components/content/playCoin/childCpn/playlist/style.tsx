import styled from 'styled-components';
export const PlaylistWrapper = styled.div`
  position: absolute;
  background-color: #fff;
  top: -10%;
  left: -10%;
  transform: translate(-100%, -100%);
  width: 400px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
  padding: 15px 0;
  border-radius: 5px;
  .title {
    font-size: 20px;
    font-weight: bolder;
    margin: 0 0 0 15px;
  }
  .control {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    padding: 0 15px;
    margin: 10px 0;
    .total {
      font-size: 13px;
      color: #656565;
    }
    .sub-all {
      cursor: pointer;
      i {
        color: #656565;
        font-size: 16px;
      }
      span {
        font-size: 14px;
        color: #656565;
      }
    }
  }
  .play-list-song {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 15px;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .play-icon {
        i {
          font-size: 18px;
          color: #ec4141;
        }
        margin: 0 10px 0 0;
      }
      .name {
        width: 45%;
        color: #333333;
        font-size: 14px;
        cursor: pointer;
      }
      .artist-name {
        width: 30%;
        color: #666666;
        font-size: 14px;
        cursor: pointer;
      }
      .dt {
        width: 20%;
        color: #cfcfcf;
        font-size: 13px;
      }
      .active {
        color: #ec4141;
      }
    }
  }
`;
