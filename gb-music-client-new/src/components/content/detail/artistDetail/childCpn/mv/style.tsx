import styled from 'styled-components';
export const MVWrapper = styled.div`
@media screen and (max-width:1380px ){
    .artist-mv-list{
      grid-template-columns: repeat(3,190px)!important;
    }
  }
    @media screen and (max-width:1110px ){
    .artist-mv-list{
      grid-template-columns: repeat(2,190px)!important;
    }
  }
  .artist-mv-list {
    display: grid;
      grid-template-columns: repeat(4,190px);
      justify-content: space-between;
  }
  .empty {
    padding: 50px 0;
  }
`;
