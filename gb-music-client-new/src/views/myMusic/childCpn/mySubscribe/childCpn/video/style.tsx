import styled from 'styled-components';
export const VideoWrapper = styled.div`
  & > ul {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    & > li {
      margin: 0 0 15px 0;
      width: 210px;
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
`;
