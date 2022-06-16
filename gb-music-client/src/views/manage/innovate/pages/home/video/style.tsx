import styled from 'styled-components';
export const VideoDataWrapper = styled.div`
  .data-list {
    display: flex;
    & > li {
      padding: 5px 30px;
      .name {
        font-size: 13px;
        color: #999999;
      }
      .value {
        font-size: 22px;
        margin-top: 5px;
        font-weight: bold;
      }
    }
  }
`;
