import styled from 'styled-components';
export const HotArtistWrapper = styled.div`
  padding: 20px 0 0 0;
  h3 {
    font-weight: bolder;
    color: #000c17;
    margin: 0 0 0 20px;
  }
  .artist-list {
    & > li {
      display: flex;
      align-items: flex-start;
      &:nth-child(odd) {
        background-color: #f7f7f7;
      }
      padding: 10px 20px;
      .img-container {
        width: 60px;
        img {
          width: 100%;
          border-radius: 4px;
        }
      }
      .artist-name {
        margin: 0 0 0 10px;
        font-size: 14px;
        color: #656565;
      }
    }
  }
`;
