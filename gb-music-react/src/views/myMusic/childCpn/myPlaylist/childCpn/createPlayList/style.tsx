import styled from 'styled-components';
export const CreatePlayListWrapper = styled.div`
  position: absolute;
  left: 50%;
  top: 0;
  transform: translate(-50%, 0);
  z-index: 9999;
  .create-my-playlist {
    padding: 40px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    background-color: #fff;
    border-radius: 5px;
    color: #373737;
    textarea {
      border: 1px solid #f27a7a;
      resize: none;
      height: 35px;
      border-radius: 4px;
    }
    .name,
    .desc {
      display: flex;
      align-items: center;
      margin: 0 0 15px 0;
      span {
        white-space: nowrap;
        margin: 0 15px 0 0;
      }
    }
    .desc{
      &>textarea{
        height: 100px;
      }
    }
    .upload-cover {
      margin: 10px 0 0 0;
      width: 100%;
      background-color: #fef4f4;
      height: 120px;
      position: relative;
      line-height: 120px;
      text-align: center;
      input {
        position: absolute;
        opacity: 0;
        width: 100%;
        height: 100%;
        display: block;
      }
      i {
        font-size: 40px;
        color: #f38b86;
      }
    }
    .control-btn {
      margin: 15px 0 0 0;
      display: flex;
      justify-content: flex-end;
      button {
        font-size: 13px;
        background-color: #f38b86;
        color: #fff;
        padding: 5px 15px;
        margin: 0 0 0 20px;
        border-radius: 4px;
        &:nth-child(2) {
          background-color: rgba(0, 0, 0, 0.08);
          color: #000;
        }
      }
    }
  }
`;
