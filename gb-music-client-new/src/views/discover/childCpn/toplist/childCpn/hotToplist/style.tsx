import styled from 'styled-components';
export const HotToplistWrapper = styled.div`
  .title {
    font-size: 16px;
    font-weight: bolder;
    margin: 0 0 15px 0;
  }
  .hot-toplist {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    width: 100%;
    & > li {
      width: 50%;
      margin: 0 0 25px 0;
      display: flex;
      .img-container {
        width: 170px;
        height: 170px;
        overflow: hidden;
        img {
          width: 100%;
          border-radius: 5px;
        }
      }
      .toplist-song-list {
        margin: 0 0 0 20px;
        width: 60%;
        & > li {
          padding: 7px 10px;
          display: flex;
          align-items: center;
          justify-content: space-between;
          &:nth-child(odd) {
            background-color: #f9f9f9;
          }
          &:nth-child(-n + 3) {
            .song-name-container {
              .index {
                color: #ec4141;
              }
            }
          }
          .song-name-container {
            display: flex;
            align-items: center;
            .index {
              font-size: 12px;
              color: #9b9b9b;
              padding: 0 10px;
            }
            .song-name-vip {
              color: #363636;
              cursor: pointer;
              display: flex;
              align-items: center;
              .song-name {
                margin: 0 5px 0 0;
                font-size: 13px;
                max-width: 150px;
              }
            }
          }
          .up {
            display: flex;
            align-items: center;
            min-width: 50px;
            & > span {
              color: #9b9b9b;
              font-size: 12px;
            }
            i {
              color: #ec4141;
            }
          }

          .artist-name {
            font-size: 12px;
            color: #9b9b9b;
            &:hover {
              color: #636363;
              cursor: pointer;
            }
          }
        }
      }
    }
  }
`;
