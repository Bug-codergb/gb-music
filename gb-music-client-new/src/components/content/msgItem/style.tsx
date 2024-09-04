import styled from 'styled-components';
/*interface IProps{
    widthProps:string
}*/
export const MsgItemWrapper: any = styled.div`
  position: relative;
  width: ${(props) => (props as any).widthProps};
  .img-container {
    width: ${(props) => (props as any).widthProps};
    height: ${(props) => parseInt((props as any).widthProps) * (props as any).scale + 'px'};
    overflow: hidden;
    border-radius: 3px;
    background-color: #fff;
    position: relative;
    img {
      width: 100%;
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
    }
  }
  .play-count {
    position: absolute;
    left: 100%;
    top: 0;
    color: #fff;
    transform: translate(-110%, 10%);
    white-space: nowrap;
  }
  .dt {
    position: absolute;
    top: 100%;
    left: 100%;
    color: #fff;
    transform: translate(-110%, -110%);
  }
  .state {
    margin: 10px 0 5px 0;
    color: #373737;
  }
  .user-name {
    color: #507daf;
    font-size: 12px;
    cursor: pointer;
  }
`;
