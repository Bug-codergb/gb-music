import React,{memo, useEffect,useState} from "react";
import { Empty } from "antd";
import { useNavigate } from "react-router-dom"
import {
  MyRadioWrapper
} from "./style"
import {
  useAppDispatch,
  useAppSelector
} from "@/store/hooks"
import { getUserChannelDetail } from "@/network/channel/index"
const MyRadio=()=>{
  const navigate = useNavigate();
  const {userDetail} = useAppSelector(state=>{
    return state['loginReducer']
  })
  const [userChannel,setUserChannel] = useState<any[]>([]);
  const search=async ()=>{
    const res:any = await getUserChannelDetail(userDetail.userId);
    if(res && res.channel){
      setUserChannel(res.channel)
    }
  }
  useEffect(()=>{
    search();
  },[userDetail])

  const handleRouterToDetail=(item:any)=>{
    navigate("/Home/channelDetail",{
      state:{
        id:item.id
      }
    })
  }
  return <MyRadioWrapper>
    {
      userChannel&& userChannel.length!==0 && <ul className="channel-list">
        {
          userChannel.map((item)=>{
            return  <li onClick={()=>handleRouterToDetail(item)}>
            <img src={item.coverUrl}/>
            <div className="channel-name">{item.name}</div>
          </li>
            
          })
        }
      </ul>
    }
     {
          (!userChannel || userChannel.length===0)&&<div className="empty-div-container">
            <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="您还没有发布声音" />
          </div>
     }
  </MyRadioWrapper>
}
export default memo(MyRadio)
