import React, { memo, FC, ReactElement } from 'react';
import { IProgram } from '../../../../../../constant/program';
import { ProgramWrapper } from './style';
import { formatTime } from '../../../../../../utils/format';
import { addProgramPlayCount } from '../../../../../../network/channel';

import { changeProgramDetailAction } from './store/asyncThunk';

import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks.ts"

interface IProps {
  programs: IProgram[] | undefined;
}
const Programs: FC<IProps> = (props): ReactElement => {
  const { programs } = props;
  const dispatch = useAppDispatch();
  //添加播放量
  const addPlayCount = (item: IProgram) => {
    addProgramPlayCount(item.id).then((data: any) => {});
    dispatch(changeProgramDetailAction({id:item.id}));
  };
  return (
    <ProgramWrapper>
      <ul className="program-list">
        {programs &&
          programs.length !== 0 &&
          programs.map((item, index) => {
            return (
              <li key={item.id}>
                <div className="index">{(index + 1).toString().padStart(2, '0')}</div>
                <div className="program-name mle" onClick={(e) => addPlayCount(item)}>
                  {item.name}
                </div>
                <div className="play-count">播放: {item.playCount}</div>
                <div className="create-time">{formatTime(item.createTime, 'yyyy-MM-dd')}</div>
                <div className="dt">{formatTime(parseInt(item.dt), 'mm:ss')}</div>
              </li>
            );
          })}
      </ul>
    </ProgramWrapper>
  );
};
export default memo(Programs);
