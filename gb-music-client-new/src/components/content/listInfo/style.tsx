import styled from 'styled-components';
export const ListInfoWrapper: any = styled.div`
  padding: 15px 0 15px 15px;
  display: flex;
  .img-container {
    img {
      width: ${(props) => (props as any).imgWidth};
    }
  }
  .msg {
    margin: 0 0 0 20px;
    .creator {
      font-size: 12px;
      color: #9f9f9f;
      margin: 5px 0 0 0;
      &:hover {
        color: #5f5f5f;
        cursor: pointer;
      }
    }
  }
`;
