import styled from 'styled-components';
export const ListItemWrapper = styled.div`
  display: flex;
  align-items: center;
  .index {
    padding: 0 10px 0 20px;
    color: #cacaca;
  }
  .love {
    padding: 0 15px 0 0;
    display: flex;
    align-items: center;
    i {
      color: #b0b0b0;
      margin: 0 5px;
      font-size: 17px;
      cursor: pointer;
    }
    .icon-loveit {
      color: #ec4141;
    }
  }
  .name {
    width: 30%;
    font-size: 13px;
    color: #507daf;
    cursor: pointer;
    & > span {
      font-size: 13px;
      max-width: 155px;
      margin: 0 5px 0 0;
    }
    display: flex;
    align-items: center;
  }
  .create-name {
    width: 20%;
    font-size: 13px;
    cursor: pointer;
  }
  .al-name {
    width: 20%;
    color: #656565;
    font-size: 13px;
    cursor: pointer;
    margin: 0 10px 0 0;
  }
  .time {
    color: #969697;
    font-size: 13px;
  }
`;
