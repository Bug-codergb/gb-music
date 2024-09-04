import styled from 'styled-components';
export const AlbumWrapper = styled.div`
  .albums {
    & > li {
      display: flex;
      flex-wrap: nowrap;
      align-items: flex-start;
      padding: 10px 0;
      border-bottom: 1px solid #f2f2f2;
      .symbol {
        width: 5px;
        height: 5px;
        background-color: #ec4141;
        border-radius: 50%;
        margin: 12px 10px 0 0;
      }
      .album-right-content {
        display: flex;
        align-items: flex-start;
        .img-container {
          width: 30px;
          height: 30px;
          position: relative;
          overflow: hidden;
          border-radius: 50%;
          img {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            height: 100%;
          }
        }
        .right-msg {
          margin: 0 0 0 10px;
          font-size: 13px;
          & > span {
            font-size: 13px;
            color: #5d86b5;
            margin: 0 5px 0 0;
          }
          .cover {
            width: 310px;
            overflow: hidden;
            margin: 10px 0 0 10px;
            display: flex;
            align-items: flex-start;
            img {
              width: 80px;
              border-radius: 5px;
            }
            span {
              color: #373737;
              margin: 0 0 0 10px;
              font-size: 13px;
              display: inline-block;
              height: 66px;
              overflow: hidden;
              text-align: justify;
            }
          }
        }
      }
    }
  }
  .empty {
    padding: 50px 0 0 0;
  }
`;
