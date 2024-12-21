import React, { memo, FC, ReactElement, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { getUserChannelPlaylist } from '../../../../../network/channel';
import { ChannelPlayWrapper } from './style';
import { IChannel } from '../../../../../constant/channel';
import { formatTime } from '../../../../../utils/format';
import { Empty ,Image,Table} from 'antd';
import moment from "moment"
interface IChannelPlaylist {
  id: string;
  name: string;
  playCount: string;
  createTime: string;
  dt: string;
  category: IChannel;
}
const ChannelPlay: FC = (props): ReactElement => {
  const navigate = useNavigate();
  const [channel, setChannel] = useState<IChannelPlaylist[]>([]);
  useEffect(() => {
    getUserChannelPlaylist<IChannelPlaylist[]>().then((data) => {
      setChannel(data);
    });
  }, []);
  const channelRouter = (item: IChannelPlaylist) => {
    navigate('/Home/channelDetail',{
      state: {
        id: item.category.id
      }
    });
  };
  const columns = [
    {
      title:"序号",
      dataIndex:"id",
      key:"id",
      width:60,
      render:(val:any,record:any,index:number)=>{
        console.log(index)
        return index+1;
      }
    },
    {
      title: '封面',
      dataIndex: 'category',
      key: 'name',
      width:100,
      render:(value:any,record:any,index:number)=>{
        return record.category ? <Image onClick={()=>channelRouter(record)} preview={false} src={record.category.coverUrl} width={80}/>:''
      }
    },
    {
      title: '声音名称',
      dataIndex: 'name',
      key: 'name',
      width:140,
      render:(val:any,record:any,index:number)=>{
        return <span className='mle name' onClick={()=>channelRouter(record)} style={{color:'#656565',cursor:'pointer'}}>{record.name}</span>
      }
    },
    {
      title: '频道名称',
      dataIndex: 'category',
      key: 'category',
      width:160,
      render:(value:any,record:any,index:number)=>{
        return record.category? record.category.name:"--"
      }
    },
    {
      title: '频道分类',
      dataIndex: 'category',
      key: 'category',
      width:150,
      render:(value:any,record:any,index:number)=>{
        return record.category? record.category.channel.name:"--"
      }
    },
    {
      title: '创建时间',
      dataIndex: 'createTime',
      key: 'createTime',
      width:150,
      render:(value:any,record:any,index:number)=>{
        return moment(record.createTime).format("yyyy-MM-DD HH:mm")
      }
    },
    {
      title: '播放量',
      dataIndex: 'playCount',
      key: 'playCount',
      width:140,
      render:(val:any,record:any,index:number)=>{
        return <div>
          <i className="iconfont icon-play2"> </i>
          <span>{record.playCount}</span>
        </div>
      }
    },
  ];
  return (
    <ChannelPlayWrapper>
      {channel &&
          channel.length !== 0 &&<Table pagination={false} dataSource={channel} columns={columns} />};
      {channel && channel.length < 1 && (
        <div className="empty">
          <Empty description={'暂无声音'} />
        </div>
      )}
    </ChannelPlayWrapper>
  );
};
export default memo(ChannelPlay);
