import styled from 'styled-components';
export const InnovateDetailWrapper = styled.div`
  background-color: #fff;
  height: 100%;
  overflow-y: auto;
`;
export const CenterContent = styled.div`
  padding: 20px 15px;
  background-color: #fff;
`;
export const LeftContent = styled.div`
  width: 80%;
  .header {
    display: flex;
    margin: 0 0 20px 0;
    .upload-outer {
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
    }
  }
  .img-container {
    width: 170px;
    height: 170px;
    img {
      width: 100%;
    }
  }
  .right-msg {
    margin: 0 0 0 20px;
    width: 70%;
    .upload-channel {
      display: flex;
      align-items: center;
      justify-content: space-between;
      & > button {
        background-color: #ec4141;
        color: #fff;
        padding: 5px 15px;
        border-radius: 18px;
        cursor: pointer;
      }
    }
    .channel-name {
      font-size: 22px;
      color: #000;
      font-weight: bolder;
      margin: 0 0 15px 0;
    }
    .desc {
      margin: 10px 0 10px 0;
      width: 80%;
    }
  }
`;
export const RightContent = styled.div`
  width: 18%;
`;
