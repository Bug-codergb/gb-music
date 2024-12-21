import styled from 'styled-components';
export const SubWrapper = styled.div`
  padding: 0 20px;
  .user-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    & > li {
      display: flex;
      align-items: center;
      width: 50%;
      margin: 0 0 20px 0;
      .img-container {
        width: 80px;
        height: 80px;
        overflow: hidden;
        border-radius: 50%;
        position: relative;
        img {
          position: absolute;
          transform: translate(-50%, -50%);
          top: 50%;
          left: 50%;
          height: 100%;
        }
        svg{
          font-size: 28px;
        }
      }
      p {
        text-align: center;
        margin: 0 0 0 5px;
      }
    }
  }
  .page {
    padding: 20px 0;
    display: flex;
    justify-content: center;
  }
`;
