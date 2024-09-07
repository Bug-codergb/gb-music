import styled from 'styled-components';
import coverall from '../../../../../../assets/img/coverall.png';
export const RecPlaylistWrapper = styled.div`
  margin: 10px 0 0 0;
  @media screen and (max-width:1260px){
    .rec-play-list{
      grid-template-columns: repeat(4, 145px)!important;
    }
  }
  .rec-play-list {
    display: grid;
    grid-template-columns: repeat(5, 145px);
    justify-content: space-between;
    li {
      margin: 0 0 20px 0;
      .mask {
        width: 100%;
        height: 100%;
        position: absolute;
        background-image: url(${coverall});
        cursor: pointer;
        background-size: 392px;
        z-index: 9999;
      }
    }
  }
`;
