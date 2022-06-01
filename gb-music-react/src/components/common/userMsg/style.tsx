import styled from 'styled-components';
export const UserMsgWrapper: any = styled.div`
  display: flex;
  align-items: center;
  .avatar {
    width: ${(props) => (props as any).imgWidth};
    height: ${(props) => (props as any).imgWidth};
    overflow: hidden;
    border-radius: 50%;
    background-color: #373737;
    img {
      height: 100%;
    }
  }
  .user-name {
    font-size: 13px;
    color: #0086b3;
    margin: 0 0 0 5px;
    cursor: pointer;
  }
`;
