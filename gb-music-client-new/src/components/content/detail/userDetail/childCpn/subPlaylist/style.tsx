import styled from 'styled-components';
export const SubPlaylistWrapper = styled.div`
  padding: 0 20px;
  .title {
    font-size: 16px;
    margin:15px 0;
  }
  .sub-playlist {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    & > li {
      width: 175px;
      position: relative;
    }
    .img-container {
      width: 175px;
      height: 175px;
      border-radius: 5px;
      overflow: hidden;
      img {
        width: 100%;
      }
    }
    .playlist-name {
      margin: 10px 0 0 0;
    }
    .play-count {
      position: absolute;
      left: 100%;
      top: 0;
      transform: translate(-110%, 0);
      white-space: nowrap;
      display: flex;
      align-items: center;
      span {
        color: #fff;
      }
      i {
        font-size: 18px;
        color: #fff;
      }
    }
    .song-count {
      font-size: 12px;
      color: #9f9f9f;
    }
  }
  .page {
    display: flex;
    width: 100%;
    justify-content: flex-end;
  }
`;
