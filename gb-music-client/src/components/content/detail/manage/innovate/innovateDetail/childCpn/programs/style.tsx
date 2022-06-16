import styled from 'styled-components';
export const ProgramWrapper = styled.div`
  .program-list {
    & > li {
      display: flex;
      padding: 8px 0;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:hover {
        background-color: #f0f1f2;
      }
      .index {
        font-size: 14px;
        color: #cfcfcf;
        padding: 0 15px;
      }
      .program-name {
        font-size: 13px;
        color: #0086b3;
        width: 40%;
        cursor: pointer;
      }
      .play-count {
        width: 15%;
        font-size: 13px;
        color: #656565;
      }
      .create-time {
        font-size: 13px;
        color: #656565;
        width: 20%;
      }
      .dt {
        font-size: 13px;
        color: #9b9b9b;
        width: 10%;
      }
      .del {
        background-color: #ec4141;
        color: #fff;
        font-size: 13px;
        padding: 3px 15px;
        border-radius: 4px;
        cursor: pointer;
      }
    }
  }
  .page {
    padding: 100px 0;
  }
`;
