<template>
  <div class="video-msg">
    <div class="profile">
      <div class="img-container" @click="userRouter">
        <img :src="videoDetail.user.avatarUrl" alt=""/>
      </div>
      <div class="user-name" @click="userRouter">{{videoDetail.user.userName?videoDetail.user.userName:videoDetail.user.name}}</div>
    </div>
    <!--视频标题-->
    <h2 class="video-name">{{videoDetail.name}}</h2>
    <div class="vio-msg">
      <span v-format="'yyyy-MM-dd hh:mm'">发布于: {{formatDate(videoDetail.createTime,"yyyy-MM-dd hh:mm")}}</span>
      <span>播放: {{videoDetail.playCount}}次</span>
    </div>
  </div>
</template>

<script>
import {formatTime} from "@/utils/format"
export default {
  name: "VideoMsg",
  props:{
    videoDetail:{
      type:Object,
      default()
      {
        return {}
      }
    }
  },
  methods:{
    userRouter(){
      this.$router.push({
        path:"userDetail",
        query:{
          id:this.videoDetail.user.userId
        }
      })
    },
    formatDate(time,fm){
      return formatTime(time,fm)
    }
  }
}
</script>

<style scoped lang="less">
.video-msg{
  .profile{
    margin: 20px 0 ;
    display: flex;
    align-items: center;
    .img-container{
      width:50px;
      height:50px;
      margin: 0 15px 0 0;
      border-radius: 50%;
      background-color: rgba(209, 225, 243);
      overflow: hidden;
      img{
        width: 100%;
      }
    }
    .user-name{
      font-size: 14px;
    }
  }
  .video-name{
    font-size: 23px;
  }
  .vio-msg{
    margin: 10px 0 0 0;
    font-size: 12px;
    color: #cfcfcf;
    span{
      margin: 0 20px 0 0;
    }
  }
}
</style>
