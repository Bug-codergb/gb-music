import styled from 'styled-components';
export const SongListItemWrapper = styled.div`
  display: flex;
  align-items: center;
  .index {
    padding: 0 15px;
    color: #cfcfcf;
    font-size: 13px;
  }
  .control-btn {
    padding: 0 15px 0 0;
    i {
      color: #b4b4b4;
      cursor: pointer;
    }
    .icon-loveit {
      color: #ec4141;
    }
  }
  .up {
    display: flex;
    align-items: center;
    i {
      color: #ec4141;
    }
    .down {
      transform: rotateZ(180deg);
    }
    & > span {
      font-size: 13px;
      color: #9b9b9b;
      min-width: 40px;
    }
  }
  .name {
    width: 30%;
    color: #0086b3;
    cursor: pointer;
    display: flex;
    align-items: center;
    margin:0 10px 0 0;
    & > span {
      font-size: 13px;
      margin: 0 5px 0 0;
    }
    .song-name{
      text-overflow:ellipsis;
      overflow:hidden
    }
  }
  .creator {
    width: 20%;
    font-size: 13px;
    color: #656565;
    cursor: pointer;
  }
  .al-name {
    font-size: 13px;
    width: 22%;
    color: #656565;
    cursor: pointer;
  }
  .time {
    font-size: 13px;
  }
  .dt {
    color: #9b9b9b;
    font-size: 13px;
  }
`;
