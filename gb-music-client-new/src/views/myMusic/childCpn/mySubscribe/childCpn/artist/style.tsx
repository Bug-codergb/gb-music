import styled from 'styled-components';
export const ArtistWrapper = styled.div`
@media screen and (max-width: 1410px){
    .sub-artist{
      grid-template-columns: repeat(6,150px)!important;
    }
  }

  @media screen and (max-width: 1230px){
    .sub-artist{
      grid-template-columns: repeat(5,150px)!important;
    }
  }
  @media screen and (max-width: 1050px){
    .sub-artist{
      grid-template-columns: repeat(4,150px)!important;
    }
  }
  .sub-artist {
    display: grid;
      justify-content: space-between;
      grid-template-columns: repeat(7,150px);
    & > li {
      padding: 10px 0;
      width: 150px;
      .artist-name {
        font-size: 14px;
      }
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
`;
