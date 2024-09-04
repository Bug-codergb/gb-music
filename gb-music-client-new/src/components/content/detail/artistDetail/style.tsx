import styled from 'styled-components';
export const ArtistDetailWrapper = styled.div`
  background-color: #fff;
`;
export const CenterContent = styled.div`
  width: 1220px;
  margin: 0 auto;
  background-color: #fff;
  display: flex;
  flex-wrap: nowrap;
`;
export const LeftContent = styled.div`
  border-right: 1px solid #e0e0e0;
  width: 70%;
`;
export const RightContent = styled.div`
  width: 29%;
`;
export const ArtistHeader = styled.div`
  display: flex;
  padding: 30px 0 20px 30px;
  .img-container {
    width: 170px;
    height: 170px;
    overflow: hidden;
    img {
      width: 170px;
    }
  }
  .msg {
    margin: 0 0 0 20px;
    .artist-name {
      font-size: 24px;
      font-weight: bold;
    }
    .sub {
      .already {
        margin: 0 5px 0 0;
        padding: 6px 0;
        svg {
          font-size: 16px;
        }
      }
      &.active {
        i,
        span {
          color: #ec4141;
        }
      }
    }
    .count {
      margin: 10px 0 0 0;
      div {
        font-size: 13px;
        span {
          font-size: 13px;
        }
      }
    }
  }
`;
export const AlbumDetailContent = styled.div`
  padding: 10px 20px 0 30px;
`;
