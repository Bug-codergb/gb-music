import styled from 'styled-components';
export const PlaylistWrapper = styled.div`

@media screen and (max-width: 1410px){
    .sub-playlist{
      grid-template-columns: repeat(6,150px)!important;
    }
  }

  @media screen and (max-width: 1230px){
    .sub-playlist{
      grid-template-columns: repeat(5,150px)!important;
    }
  }
  @media screen and (max-width: 1050px){
    .sub-playlist{
      grid-template-columns: repeat(4,150px)!important;
    }
  }
  .sub-playlist {
    display: grid;
      justify-content: space-between;
      grid-template-columns: repeat(7,150px);
    & > li {
      width: 150px;
      margin: 0 0 20px 0;
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
`;
