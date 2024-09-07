import styled from 'styled-components';
import coverall from '../../../../../../assets/img/coverall.png';
export const RecArtistWrapper = styled.div`
  position: relative;
  margin: 15px 0;
  height: 194px;
  .left-arrow,
  .right-arrow {
    position: absolute;
    background-color: transparent;
    left: 0;
    top: 40%;
    transform: translate(0, -50%);
    z-index: 990000;
    cursor: pointer;
    i {
      color: #898989;
      font-size: 25px;
      font-weight: bolder;
    }
  }
  .left-arrow {
    transform: translate(0, -50%) rotateZ(180deg);
  }
  .right-arrow {
    left: 100%;
    transform: translate(-100%, -50%);
  }
  @media screen and (max-width:1260px){
    .artist-list{
      grid-template-columns: repeat(5,120px)!important;
    }
}
  @media screen and (max-width:1125px){
    .artist-list{
      grid-template-columns: repeat(4,120px)!important;
    }
  }
  .artist-list {
    display: grid !important;
    overflow: hidden;
    grid-template-columns: repeat(6,120px);
    background-color: #f5f5f5;
    justify-content: space-evenly;
    padding: 20px 0 15px 0;
    border: 1px solid #d3d3d3;
    height: 194px;
    &>li{
      margin: 0 0 20px 0;
    }
    .mask {
      position: absolute;
      width: 100%;
      height: 100%;
      background-image: url(${coverall});
      background-position: 0 -690px;
      cursor: pointer;
      z-index: 999;
    }
  }
`;
