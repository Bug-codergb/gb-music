import styled from 'styled-components';
export const SimiItemWrapper: any = styled.div`
  display: flex;
  width: 100%;
  .img-container {
    position: relative;
    width: ${(props) => (props as any).itemWidth};
    height: ${(props) => parseInt((props as any).itemWidth) * 0.6 + 'px'};
    overflow: hidden;
    border-radius: 5px;
    img {
      width: 100%;
    }
    .play-count {
      color: #fff;
      white-space: nowrap;
      position: absolute;
      top: 0;
      left: 100%;
      transform: translate(-110%, 0);
      font-size: 13px;
    }
    .dt {
      position: absolute;
      left: 100%;
      top: 100%;
      transform: translate(-110%, -100%);
      color: #fff;
      font-size: 13px;
    }
  }
  .msg {
    margin: 0 0 0 10px;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    width: 55%;
    .simi-state {
      width: 100%;
    }
    .user-name {
      font-size: 12px;
      color: #9f9f9f;
      cursor: pointer;
      &:hover {
        color: #656565;
      }
    }
  }
`;
