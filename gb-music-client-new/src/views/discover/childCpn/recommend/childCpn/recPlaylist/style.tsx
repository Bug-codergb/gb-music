import styled from 'styled-components';
import coverall from '../../../../../../assets/img/coverall.png';
export const RecPlaylistWrapper = styled.div`
  margin: 10px 0 0 0;
  .rec-play-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    li {
      margin: 0 15px 20px 0;
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
