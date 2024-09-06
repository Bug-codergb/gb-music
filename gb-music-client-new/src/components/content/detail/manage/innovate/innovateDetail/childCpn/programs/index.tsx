import React, { memo, FC, ReactElement } from 'react';

import { ProgramWrapper } from './style';

import { IProgram } from '@/constant/program';
import { formatTime } from '@/utils/format';
import { Empty } from 'antd';
interface IProps {
  programs: IProgram[] | undefined;
}
const Programs: FC<IProps> = (props): ReactElement => {
  const { programs } = props;
  console.log(programs);
  return (
    <ProgramWrapper>
      <ul className="program-list">
        {programs &&
          programs.length !== 0 &&
          programs[0].id &&
          programs.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                <div className="program-name">{item.name}</div>
                <div className="play-count">播放: {item.playCount}</div>
                <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd')}</div>
                <div className="dt">{formatTime(parseInt(item.dt), 'mm:ss')}</div>
                <div className="del">删除</div>
              </li>
            );
          })}
      </ul>
      {programs && (programs.length === 0 || programs[0].id === null) && (
        <div className="page">
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description={'空空如也'} />
        </div>
      )}
    </ProgramWrapper>
  );
};
export default memo(Programs);
