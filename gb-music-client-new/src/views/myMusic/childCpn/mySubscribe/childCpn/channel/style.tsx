import styled from 'styled-components';
export const ChannelWrapper = styled.div`
@media screen and (max-width: 1410px){
    .channel-list {
      grid-template-columns: repeat(6,150px)!important;
    }
  }

  @media screen and (max-width: 1230px){
    .channel-list {
      grid-template-columns: repeat(5,150px)!important;
    }
  }
  @media screen and (max-width: 1050px){
    .channel-list {
      grid-template-columns: repeat(4,150px)!important;
    }
  }
  .channel-list {
    display: grid;
      justify-content: space-between;
      grid-template-columns: repeat(7,150px);
    & > li {
      width: 150px;
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
`;
