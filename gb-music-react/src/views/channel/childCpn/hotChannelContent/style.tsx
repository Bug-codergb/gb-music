import styled from 'styled-components';
export const HotChannelContentWrapper = styled.div`
  .channels {
    padding: 0 30px;
    & > li {
      margin: 0 0 30px 0;
      .title {
        border-bottom: 2px solid #c20c0c;
        font-size: 24px;
        color: #333333;
      }
      .channel-content-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        .channel-content {
          display: flex;
          width: 48%;
          border-bottom: 1px solid #e7e7e7;
          padding: 20px 0;
          .img-container {
            width: 130px;
            cursor: pointer;
            img {
              width: 100%;
              border: 1px solid rgba(0, 0, 0, 0.1);
            }
          }
          .right-msg {
            margin: 0 0 0 20px;
            width: 60%;
            .name {
              font-size: 20px;
              font-weight: bolder;
              color: #333333;
              margin: 0 0 15px 0;
              cursor: pointer;
            }
            .desc {
              width: 100%;
              font-size: 12px;
              color: #999999;
            }
          }
        }
      }
    }
  }
`;
