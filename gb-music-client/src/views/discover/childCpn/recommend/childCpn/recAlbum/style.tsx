import styled from 'styled-components';
import coverall from '../../../../../../assets/img/coverall.png';
export const RecAlbumWrapper = styled.div`
  margin: 10px 0 0 0;
  .rec-album {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    li {
      margin: 0 14px 15px 0;
      img {
        width: 130px;
        left: 0;
        top: 0;
        transform: translate(0, 0);
      }
      .mask {
        position: absolute;
        width: 100%;
        height: 100%;
        background-image: url(${coverall});
        background-position: 0 -845px;
        cursor: pointer;
        z-index: 999;
      }
    }
  }
`;
