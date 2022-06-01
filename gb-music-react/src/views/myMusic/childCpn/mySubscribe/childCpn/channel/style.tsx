import styled from 'styled-components';
export const ChannelWrapper = styled.div`
  .channel-list {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    & > li {
      width: 150px;
    }
  }
  .empty-tip {
    padding: 150px 0;
  }
`;
