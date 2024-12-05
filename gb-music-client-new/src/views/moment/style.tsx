import styled from 'styled-components';
export const MomentWrapper = styled.div`
  background-color: #ffffff;
`;
export const CenterContent = styled.div`
  display: flex;
  background-color: #fff;
`;
export const LeftContent = styled.div`
  width: 70%;
  border-right: 1px solid #e0e0e0;
  .moment-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px;
    position: relative;
    h3 {
      font-weight: bolder;
      font-size: 15px;
    }
    .control-btn {
      display: flex;
      align-items: center;
      & > button {
        background-color: #ec4141;
        font-size: 13px;
        display: flex;
        align-items: center;
        color: #fff;
        padding: 2px 15px;
        border-radius: 15px;
        cursor: pointer;
        margin: 0 0 0 20px;
      }
    }
  }
`;
export const RightContent = styled.div`
  width: 28%;
  padding: 20px 10px 0 15px;
`;
