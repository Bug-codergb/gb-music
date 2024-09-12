import styled from 'styled-components';
import '../../assets/css/cropper.css';
export const CustomizeUploadWrapper: any = styled.div`
  display: flex;
  align-items: center;
  height: ${400 / 40}rem;
  overflow: hidden;
  .container {
    height: 100%;
    flex: 1;
    background-color: #f5f5f5;
    overflow: hidden;
    img {
      width: 100%;
    }
  }
  .preview {
    flex: 1;
    background-color: #f5f5f5;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    .small {
      width: ${(props) => (props as any).imgWidth + 'rem'};
      height: ${(props) => (props as any).imgWidth * (props as any).scale + 'rem'};
      background-color: #f5f5f5;
      overflow: hidden;
      border-radius: ${(props) => ((props as any).isCircle ? '50%' : 0)};
      img {
        height: 100%;
      }
    }
  }
`;
