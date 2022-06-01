import styled from 'styled-components';

export const CommentWrapper = styled.div`
  .comment-list {
    & > li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      border-bottom: 1px solid #f2f2f2;
      .comment-content {
        display: flex;
        align-items: flex-start;
      }
      .symbol {
        width: 5px;
        height: 5px;
        border-radius: 50%;
        background-color: #ec4141;
        margin: 0 10px 0 0;
      }
      .img-container {
        width: 30px;
        height: 30px;
        overflow: hidden;
        position: relative;
        border-radius: 50%;
        img {
          height: 100%;
          position: absolute;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
        }
      }
      .right-comment-content {
        width: 320px;
        margin: 0 0 0 10px;
        .user-name {
          font-size: 13px;
          color: #9f9f9f;
          span {
            color: #5d86b5;
            margin: 0 3px 0 0;
            font-size: 13px;
          }
        }
        .content {
          font-size: 13px;
        }
      }
    }
  }
  .empty {
    padding: 50px 0 0 0;
  }
`;
