import styled from 'styled-components';
export const ImgUploadWrapper = styled.div`
  .global-upload-outer-cpn-style {
    background-color: #3399ff;
    .input-container {
      width: 100%;
      height: ${400 / 40}rem;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: #eeeeee;
      input {
        width: 100%;
        height: 100%;
        opacity: 0;
        position: absolute;
        cursor: pointer;
      }
      .msg-tip {
        display: flex;
        align-items: center;
        flex-direction: column-reverse;
        .img-icon {
          svg {
            width: ${70 / 40}rem;
            height: ${70 / 40}rem;
            color: #cc0101;
          }
        }
        .tip {
          font-size: ${24 / 40}rem;
          letter-spacing: 5px;
          margin: ${30 / 40}rem 0 0 0;
        }
      }
    }
  }
`;
