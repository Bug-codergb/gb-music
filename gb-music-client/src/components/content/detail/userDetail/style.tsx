import styled from 'styled-components';
export const UserDetailWrapper = styled.div`
  background-color: #FFFF;
`;
export const CenterContentWrapper = styled.div`
  width: 1220px;
  display: flex;
  margin: 0 auto;
  background-color: #ffffff;
`;
export const LeftContentWrapper = styled.div`
  width: 70%;
  border-right: 1px solid #e0e0e0;
  padding: 0 0 20px 0;
  .user-detail-header {
    display: flex;
    padding: 30px;
    position: relative;
    .left-content {
      width: 180px;
      height: 180px;
      overflow: hidden;
      border-radius: 50%;
      position: relative;
      background-color: #000c17;
      img {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
      }
    }
    .right-content {
      margin: 0 0 0 20px;
      width: 60%;
      .user-name {
        font-size: 20px;
        font-weight: bolder;
        color: #373737;
        margin: 0;
        padding: 0;
      }
      .line {
        padding: 0;
        margin: 5px 0;
        border-bottom: 1px solid #e5e5e5;
      }
      .fans {
        display: flex;
        & > li {
          display: flex;
          flex-direction: column-reverse;
          align-items: center;
          &:nth-child(1) {
            padding: 0 30px 0 0;
          }
          &:nth-child(2) {
            border-left: 1px solid #e5e5e5;
            border-right: 1px solid #e5e5e5;
            padding: 0 30px;
          }
          &:nth-child(3) {
            padding: 0 0 0 30px;
          }
          .count {
            font-size: 20px;
            color: #373737;
          }
          .description {
            color: #676767;
            font-size: 13px;
          }
        }
      }
      .desc {
        color: #676767;
      }
    }
    .pay-attention {
      border: 1px solid #d8d8d8;
      white-space: nowrap;
      position: absolute;
      left: 100%;
      transform: translate(-120%, 0);
      padding: 3px 20px;
      border-radius: 15px;
      cursor: pointer;
      i.iconfont {
        color: #ec4141;
      }
    }
  }
`;

export const RightContentWrapper = styled.div`
  width: 28%;
  box-sizing: border-box;
  padding: 30px 15px 0 15px;
`;
