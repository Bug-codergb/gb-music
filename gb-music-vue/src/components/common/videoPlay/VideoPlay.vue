<template>
  <div class="videoPlay">
    <div class="vio-container">
      <video :src="url"
             ref="vio"
             @timeupdate="getCurrentTime"
             @ended="endHandle"
             autoplay
             preload="metadata"
             @canplay="canPlay">
      </video>
      <div class="control">
        <!--视频进度条-->
        <div class="wrapper" @mousedown="silderDown">
          <el-slider v-model="progress" @change="changeEnd" @input="change" :show-tooltip="false"></el-slider>
        </div>
        <div class="control-btn">
          <div class="play" @click="play">
            <div class="play-or-pause">
              <i class="iconfont icon-playcircle" v-show="!isPlay"></i>
              <i class="iconfont icon-pause1" v-show="isPlay"></i>
            </div>
            <div class="dt">
              {{format(currentTime,"mm:ss")}}/{{format(dt,"mm:ss")}}
            </div>
          </div>
          <div class="volume">
            <i class="iconfont icon-yangshengqi"></i>
            <div id="volume-progress">
              <el-slider v-model="volume" @change="volumeChange" @input="volumeEnd"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {formatTime} from "@/utils/format";

export default {
  name: "VideoPlay",
  props:{
    url:{
      type:String,
      default:""
    },
    dt:{
      type:Number,
      default:0
    }
  },
  data(){
    return {
      updateTime:'',
      playCount:0,
      //是否播放
      isPlay:false,
      currentTime:0,
      keyId:1,
      vid:'',
      progress:0,
      isDrag:false,
      isMove: false,
      volume:10,
    }
  },
  mounted() {
    this.$nextTick(()=>{
      this.$refs.vio.volume=0.1;
    })
  },
  methods: {
    format(time,ft)
    {
      return formatTime(time,ft);
    },
    reply()
    {
      this.keyId+=1;
    },
    play()
    {
      /*addVideoPlayCouont(this.videoDetail.vid).then(data => {
      })*/
      this.isPlay=!this.isPlay;
      if(this.isPlay){
        if(this.$refs.vio.play()){
          this.$refs.vio.play().catch(e=>{

          })
        }
      } else{
        this.$refs.vio.pause();
      }
    },
    playVideo(vid)
    {

    },
    silderDown()
    {
      this.isMove=true
    },
    getCurrentTime(e)
    {
      if(!this.isDrag)
      {
        this.currentTime=e.target.currentTime*1000;
        this.progress=(this.currentTime/this.dt)*100;
      }
    },
    canPlay()
    {
      this.isPlay=true;
    },
    change(val)
    {
      if(this.isMove) {
        this.isDrag = true;
        this.currentTime = this.dt * (val / 100);
      }
    },
    changeEnd(val)
    {
      this.isDrag=false;
      this.progress=val;
      this.isMove=false;

      this.$refs.vio.currentTime=this.currentTime/1000;
      if(this.$refs.vio.play()!==undefined)
      {
        this.$refs.vio.play().then(data=>{
        }).catch(e=>{

        })
      }
    },
    endHandle()
    {
      this.isMove=false;
      this.isPlay=false;
    },
    //音量
    volumeChange(val)
    {
      this.$refs.vio.volume=val/100;
    },
    volumeEnd(val)
    {
      this.$refs.vio.volume=val/100;
    }
  }
}
</script>

<style scoped lang="less">
.videoPlay{
  .vio-container{
    width: 750px;
    height:420px;
    text-align: center;
    background-color:#111111;
    border-radius: 5px;
    video{
      height:85%;
      outline: none;
    }
    .el-slider{
      height: 3px!important;
    }
    //控制信息
    .control{
      width: 100%;
      .wrapper{
        padding: 0 10px;
      }
      .control-btn{
        margin: 10px 0 0 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
        color: #c1c1c1;
        .play{
          display: flex;
          align-items: center;
          .play-or-pause{
            cursor: pointer;
            margin: 0 10px 0 10px;
            i{
              font-size: 22px;
            }
          }
        }
        .volume{
          display: flex;
          align-items: center;
          width: 100px;
          i{
            font-size: 20px;
          }
          #volume-progress{
            flex: 1;
            margin: 0 10px 0 5px;
          }
        }
      }
    }
  }
}
</style>
