import styled from 'styled-components';
export const UserWrapper = styled.ul`
  & > li {
    padding: 10px 20px;
    display: flex;
    align-items: center;
    &:nth-child(odd) {
      background-color: #f9f9f9;
    }
    &:hover {
      background-color: #f0f1f2;
    }
    .index {
      padding: 0 20px 0 0;
      color: #d2c3d3;
      font-size: 13px;
    }
    .avatar {
      width: 60px;
      height: 60px;
      border-radius: 5px;
      overflow: hidden;
      img {
        width: 100%;
      }
      margin: 0 20px 0 0;
    }
    .user-name {
      color: #656565;
      font-size: 13px;
      width: 60%;
    }
  }
`;
