import styled from 'styled-components';
export const VideoWrapper = styled.div`
  position: relative;
  textarea {
    resize: none;
  }
  .upload-outer {
    width: 500px;
    height: 300px;
    border: 1px dotted #cccccc;
    margin: 30px auto;
    border-radius: 8px;
    text-align: center;
    padding-top: 20px;
    i.iconfont {
      font-size: 50px;
      color: #ff3a3a;
    }
    .upload-btn {
      border-bottom: 1px solid #ff3a3a;
      display: inline-block;
      margin: 30px 0 0 0;
      color: #5091cb;
      cursor: pointer;
      position: relative;
      overflow: hidden;
    }
  }
  .upload {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    padding: 30px 50px;
    border-radius: 8px;
    .name,
    .desc {
      margin: 0 0 20px 0;
      display: flex;
      span {
        margin: 0 5px 0 0;
      }
    }
    textarea {
      border: 1px solid #cbc9c0;
    }
    .preview {
      display: flex;
      height: 100px;
      .img-preview,
      .video-preview {
        flex: 1;
        background-color: #f2f2f2;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        overflow: hidden;
        i.iconfont {
          font-size: 32px;
          color: #ff3a3a;
        }
        input {
          position: absolute;
          height: 100%;
          opacity: 0;
          cursor: pointer;
        }
        img {
          height: 100%;
        }
      }
      .img-preview {
        border-right: 1px dotted #cbc9c0;
      }
    }
    .cate-list {
      display: flex;
      width: 400px;
      flex-wrap: wrap;
      margin: 10px 0 0 0;
      & > li {
        background-color: #f7b3b3;
        color: #fff;
        margin: 0 15px 15px 0;
        font-size: 13px;
        padding: 4px 10px;
        border-radius: 4px;
        cursor: pointer;
        &:hover {
          background-color: #f27a7a;
        }
        &.active {
          background-color: #f27a7a;
        }
      }
    }
    .control-btn {
      display: flex;
      justify-content: flex-end;
      button {
        font-size: 13px;
        padding: 4px 15px;
        margin: 0 0 0 25px;
        cursor: pointer;
        &:nth-child(1) {
          background-color: #f27a7a;
          color: #fff;
        }
        &:nth-child(2) {
          background-color: #efefef;
          color: #656565;
        }
      }
    }
  }
`;
