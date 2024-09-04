import styled from 'styled-components';
export const VerifyWrapper: any = styled.div`
  background-color: #fff;
  position: absolute;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
  border-radius: 5px;
  padding: 20px 0;
  box-sizing: content-box;
  left: 65.3%;
  top: 50%;
  transform: translate(0, -50%);
  z-index: 98988989898;
  .verify-slider {
    width: 335px;
    display: flex;
    justify-content: center;
    margin: 0 auto;
    .ant-slider {
      height: 40px !important;
      width: 100% !important;
    }
    .ant-slider-track {
      height: 40px !important;
      background-color: ${(props) => (props as any).trackColor};
      opacity: 0.6;
    }
    .ant-slider-handle.ant-tooltip-open {
      box-shadow: 0 0 3px rgba(0, 0, 0, 0.4);
      border-color: #fff;
    }
    .ant-slider-handle {
      height: 40px;
      width: 40px;
      border-radius: 3px;
      top: 22.5% !important;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: ${(props) => (props as any).handleBgc};
      i {
        color: #c9cccf;
      }
      .icon-duihao {
        font-size: 20px;
      }
      &:hover {
        background-color: ${(props) => (props as any).handleColor};
        i {
          color: #fff;
        }
        border-color: ${(props) => (props as any).handleColor};
      }
    }
    .ant-slider-step,
    .ant-slider-rail {
      height: 40px !important;
    }
    .ant-slider-rail {
      background-color: #fff;
      border: 1px solid #e4e7eb;
    }
  }
  .img-outer {
    padding: 0 30px;
    position: relative;
    .refresh {
      position: absolute;
      left: 92%;
      top: 0;
      transform: translate(-100%, 0);
      background-color: rgba(0, 0, 0, 0.1);
      cursor: pointer;
      padding: 0 15px;
      i {
        color: #f5f5f5;
        font-size: 20px;
      }
    }
  }
  .img-container {
    position: relative;
    margin: 15px 0 0 0;
    .inner {
      position: absolute;
      left: 0;
      top: 0;
    }
  }
  .title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #e4e7eb;
    padding: 0 30px;
    box-sizing: content-box;
    .cancel {
      i {
        display: inline-block;
        transform: rotateZ(45deg);
        font-size: 24px;
      }
    }
  }
`;
