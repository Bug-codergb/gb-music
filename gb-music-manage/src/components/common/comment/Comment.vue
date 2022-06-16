<template>
  <div class="comment">
    <ul class="comment-list">
      <li v-for="item in comments">
        <div class="img-container" v-lazy-container="{selector:'img',error:require('../../../assets/img/holder/user-placehoder.png')}">
          <img :data-src="item.user.avatarUrl"/>
        </div>
        <div class="right-msg">
          <div class="user-name">{{item.user.userName}}</div>
          <div class="content">{{item.content}}</div>
          <div class="create-time">
            {{formatDate(item.createTime,"yyyy-MM-dd hh:mm")}}
          </div>
          <ul class="reply-list">
            <li v-for="it in item.reply">
              <div class="img-container">
                <img :src="it.user.avatarUrl"/>
              </div>
              <div class="right-msg">
                <div class="user-name">{{it.user.userName}}</div>
                <div class="content">{{it.content}}</div>
                <div class="create-time">
                  {{formatDate(it.createTime,"yyyy-MM-dd hh:mm")}}
                </div>
              </div>
            </li>
          </ul>
        </div>

      </li>
    </ul>
  </div>
</template>

<script>
import {formatTime} from "@/utils/format"
export default {
  name: "Comment",
  props:{
    comments:{
      type:Array,
      default(){
        return []
      }
    },
    total:{
      type:Number,
      default:0
    }
  },
  methods:{
    formatDate(time,fm){
      return formatTime(time,fm)
    }
  }
}
</script>

<style scoped lang="less">
  .comment{
    background-color: #f8f8f8;
    .comment-list{
      &>li{
        display: flex;
        align-items: flex-start;
        padding: 10px 0;
        border-bottom: 1px solid #e8e8e9;
        .img-container{
          width: 40px;
          height: 40px;
          border-radius: 50%;
          position: relative;
          overflow: hidden;
          margin-right: 10px;
          img{
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            height: 100%;
          }
        }
        .right-msg{
          width: 90%;
          .user-name{
            font-size: 13px;
            color: #0077aa;
          }
          .content{
            width: 100%;
            font-size: 13px;
            color:#656565;
            margin: 5px 0 4px 0;
          }
          .create-time{
            color: #656565;
          }
        }
        .reply-list{
          width: 90%;
          &>li{
            display: flex;
            align-items: flex-start;
            padding: 10px 0;
            border-bottom: 1px solid #e8e8e9;
            .img-container{
              width: 40px;
              height: 40px;
              border-radius: 50%;
              position: relative;
              overflow: hidden;
              margin-right: 10px;
              img{
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%);
                height: 100%;
              }
            }
            .right-msg{
              width: 90%;
              .user-name{
                font-size: 13px;
                color: #0077aa;
              }
              .content{
                width: 100%;
                font-size: 13px;
                color:#656565;
                margin: 5px 0 4px 0;
              }
              .create-time{
                color: #656565;
              }
            }
          }
        }
      }
    }
  }
</style>
