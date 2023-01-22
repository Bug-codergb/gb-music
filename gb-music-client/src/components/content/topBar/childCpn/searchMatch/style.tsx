import styled from 'styled-components';
export const SearchMatchWrapper = styled.div`
  position: absolute;
  background-color: #fff;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
  width: 340px;
  z-index: 99999965;
  left: 43%;
  top: 105%;
  transform: translate(-50%, 0);
  border-radius: 5px;
  padding: 20px 0;
  .search-title {
    padding: 3px 10px;
    background-color: #f5f5f7;
    font-size: 12px;
    display: flex;
    align-items: center;
    height: 50px;
  }
  .list {
    & > li {
      font-size: 12px;
      padding: 2px 20px;
      display: flex;
      align-items: center;
      height: 30px;
      &:hover {
        background-color: #f2f2f2;
        cursor: pointer;
      }
    }
  }
  .no-tip {
    text-align: center;
    i {
      color: #ec4141;
      font-size: 30px;
    }
  }
`;
