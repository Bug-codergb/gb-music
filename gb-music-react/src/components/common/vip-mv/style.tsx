import styled from 'styled-components';
export const VipMvWrapper = styled.div`
  .vip-mv {
    display: flex;
    align-items: center;
    .vip,
    .mv {
      font-size: 12px;
      padding: 0 4px 1px 4px;
      border-radius: 4px;
      line-height: 13px;
      margin: 0 2px 0 0;
      transform: scale(0.85);
    }
    .vip {
      border: 2px solid #fa8153;
      color: #fa8153;
      font-weight: 600;
    }
    .mv {
      border: 2px solid #ec4747;
      color: #ec4747;
      font-weight: bold;
      cursor: pointer;
    }
  }
`;
