<template>
  <div class="video-detail">
    <div class="left-content">
      <div class="video-detail-container">
        <video-play :dt="detail.dt" :url="url"/>
        <video-msg :video-detail="detail"/>
      </div>
    </div>
    <div class="right-content">
      <Comment v-if="comments.length!==0" :comments="comments" :total="total"/>
    </div>
  </div>
</template>

<script>
import { getVideoDetail, getVideoURL } from "@/network/video";
import { verifyURL } from "@/utils/verify";
import VideoPlay from "@/components/common/videoPlay/VideoPlay";
import VideoMsg from "@/components/content/detail/videoDetail/childCpn/videoMsg/VideoMsg";
import { getAllComment } from "@/network/comment";
import Comment from "@/components/common/comment/Comment";

export default {
  name: "VideoDetail",
  components: { Comment, VideoMsg, VideoPlay },
  data(){
    return {
      id:"",
      detail:{},
      url:"",
      comments:[],
      total:0
    }
  },
  created() {
    this.id=this.$route.query.id;
    getVideoDetail(this.id).then(data=>{
      this.detail=data;
      getVideoURL(this.id).then(data=>{
        this.url=verifyURL(data.url);
      })
    })
    getAllComment(this.$route.query.id,'vId',0,30).then(data=>{
      this.comments=data.comments;
      this.total=data.count;
    })
  }
}
</script>

<style scoped lang="less">
  .video-detail{
    width: 100%;
    height: 81vh;
    overflow-y: scroll;
    background-color: #fff;
    padding: 20px;
    display: flex;
    align-items: flex-start;
    .left-content{
      width: 60%;
    }
    .right-content{
      width: 40%;
      height: 90vh;
      overflow-y: scroll;
    }
  }
</style>
