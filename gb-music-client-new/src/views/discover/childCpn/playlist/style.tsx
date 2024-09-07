import styled from 'styled-components';
export const PlaylistWrapper = styled.div`
  padding: 20px;
  width: 100%;
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    .current-cate {
      border: 1px solid #d8d8d8;
      font-size: 13px;
      padding: 3px 20px;
      border-radius: 15px;
    }
  }
  @media screen and (max-width: 1415px){
    .cate-play-list{
      &>ul{
        grid-template-columns: repeat(6,150px)!important;
      }
    }
  }
  @media screen and (max-width: 1215px){
    .cate-play-list{
      &>ul{
        grid-template-columns: repeat(5,150px)!important;
      }
    }
  }
  @media screen and (max-width: 1060px){
    .cate-play-list{
      &>ul{
        grid-template-columns: repeat(4,150px)!important;
      }
    }
  }
  .cate-play-list {
    margin: 20px 0 0 0;
    & > ul {
      display: grid;
      justify-content: space-between;
      grid-template-columns: repeat(7,150px);
      & > li {
        width: 100%;
        position: relative;
        margin: 0 0 20px 0;
        .user-msg {
          position: absolute;
          left: 0;
          top: 100%;
          transform: translate(0,-239%);
          width: 100%;
          display: flex;
          align-items: center;
          color: #ffffff;
          padding: 0 10px 5px 10px;
          box-sizing: border-box;
          background: linear-gradient(transparent, 50%, rgba(0, 0, 0, 0.6));
          span {
            font-size: 13px;
            margin: 0 0 0 5px;
            cursor: pointer;
          }
        }
        .cover-img {
          transform: scale(1) translate(-50%, -50%);
          transition: transform 0.3s;
          &:hover {
            transform: scale(1.2) translate(-50%, -50%);
          }
        }
      }
    }
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 10px 0;
  }
`;
