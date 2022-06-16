import styled from 'styled-components';
export const CommentWrapper = styled.div`
  padding: 0 0 15px 0;
  .title {
    font-size: 16px;
    font-weight: 600;
    margin: 15px 0;
  }
  .comment-list {
    & > li {
      display: flex;
      align-items: flex-start;
      border-bottom: 1px solid #e8e8e9;
      padding: 10px;
      background-color: #f8f8f8;
      .img-container,
      .avatar {
        width: 35px;
        height: 35px;
        overflow: hidden;
        border-radius: 50%;
        margin: 0 20px 0 0;
        img {
          height: 100%;
        }
      }
      .msg {
        width: 90%;
      }
      .user-name,
      .reply-user-name {
        color: #507daf;
        font-size: 13px;
        white-space: nowrap;
      }
      .content,
      .reply-content {
        font-size: 13px;
        color: #333;
      }
      .create-time,
      .reply-time {
        color: #656565;
        font-size: 12px;
      }
      .reply-comment-btn {
        width: 100%;
        display: flex;
        justify-content: flex-end;
      }
      .reply {
        & > li {
          padding: 10px 0;
          display: flex;
          border-bottom: 1px solid #e8e8e9;
          .reply-msg {
            margin: 0 20px 0 0;
            .re-avatar {
              width: 30px !important;
              height: 30px;
              border-radius: 50%;
              overflow: hidden;
              img {
                height: 30px;
              }
            }
          }
          .reply-user-name {
            margin: 0 5px 0 0;
          }
        }
      }
    }
  }
  .page {
    margin: 15px 0 0 0;
    display: flex;
    justify-content: center;
  }
`;
