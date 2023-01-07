import styled from 'styled-components';
export const RecommendWrapper = styled.div`
  .title-name {
    cursor: pointer;
    font-weight: 700;
    font-size: 16px;
  }
  .rec-content {
    width: 1220px;
    margin: 0 auto;
    padding: 0 0 20px 15px;
    background-color: #fff;

    display: flex;
    overflow: hidden;
  }
`;
export const LeftContent = styled.div`
  width: 78%;
  border-right: 1px solid #d3d3d3;
  padding: 20px 15px 0 0;
`;
export const RightContent = styled.div`
  flex: 23%;
  overflow: hidden;
`;
