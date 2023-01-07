import styled from 'styled-components';
export const ToplistWrapper = styled.div`
  margin: 0px auto;
  padding: 20px 15px;
  .toplist {
    display: flex;
    width: 100%;
    flex-wrap: wrap;
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
          .song-name-vip-mv {
            cursor: pointer;
            display: flex;
            align-items: center;
            .song-name {
              margin: 0 5px 0 0;
              max-width: 130px;
              font-size: 13px;
              color: #363636;
              &.top {
                max-width: 100px;
              }
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
    .empty-toplist-outer {
      width: 100%;
      .empty-toplist {
        padding: 120px 0;
        width: 100%;
        box-sizing: border-box;
        display: flex;
        justify-content: center;
      }
    }
  }
`;
