import styled from 'styled-components';
export const InnovationWrapper = styled.div`
  background-color: #f5f5f5;
  height:100%;
`;
export const CenterContent = styled.div`
  padding: 20px 15px;
  margin: 0 auto;
  background-color: #f5f5f5;
  .title {
    text-align: center;
    font-size: 60px;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif,
      'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
    color: #313131;
  }
  .choose {
    font-size: 14px;
    color: #000;
    text-align: center;
  }
  .choose-list {
    display: flex;
    width: 100%;
    justify-content: center;
    flex-wrap: wrap;
    margin: 80px 0;
    li {
      background-color: #fff;
      margin: 0 20px;
      padding: 40px 0;
      border-radius: 5px;
      font-size: 26px;
      text-align: center;
      width: 300px;
      cursor: pointer;
      &:hover {
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.06);
      }
    }
  }
`;
