<template>
  <div class="channel">
    <div class="left-channel">
      <div class="add-btn">
        <div class="btn" @click="btnClick">
          <i class="iconfont icon-jiahao"></i>
          添加频道
        </div>
      </div>

      <div class="channel-content" v-if="isShow">
        <div class="content">
          <span class="name">名称:</span>
          <label>
            <input type="text" class="inp" v-model="content" />
          </label>
        </div>
        <div class="img-container">
          <input type="file" @change="fileChange" v-if="!isShowPrev" />
          <i class="iconfont icon-tupian" v-if="!isShowPrev"></i>
          <img :src="url" v-if="isShowPrev" />
        </div>
        <div class="control-btn">
          <button class="define" @click="define">确定</button>
          <button class="cancel" @click="cancel">取消</button>
        </div>
      </div>

      <ul class="channel-list">
        <li
          v-for="(item, index) in channels"
          :key="item.id"
          @click="liClick(item, index)"
          :class="{ active: currentIndex === index }"
        >
          <div class="name">
            <i class="iconfont icon-youjiantou" :class="{ active: currentIndex === index }"></i>
            {{ item.name }}
          </div>
          <div class="create-time">创建时间:{{ formatDate(item.createTime, 'yyyy-MM-dd') }}</div>
          <div class="count">电台数:{{ item.count }}</div>
          <div class="control-btn">
            <div class="del" @click.stop="delChannel(item, index)">删除</div>
            <div class="del">查看</div>
          </div>
        </li>
      </ul>
    </div>
    <div class="right"></div>
  </div>
</template>

<script>
import { addChannel, delChannel, getAllChannel } from '@/network/channel';
import { formatTime } from '@/utils/format';

export default {
  name: 'Channel',
  data() {
    return {
      channels: [],
      currentIndex: 0,
      isShow: false,
      content: '',
      isShowPrev: false,
      url: '',
      formData: null
    };
  },
  created() {
    getAllChannel().then((data) => {
      this.channels = data;
    });
  },
  methods: {
    formatDate(time, fm) {
      return formatTime(time, fm);
    },
    btnClick() {
      this.isShow = !this.isShow;
    },
    fileChange(e) {
      let file = URL.createObjectURL(e.currentTarget.files[0]);
      this.url = file;
      this.isShowPrev = true;
      this.formData = new FormData();
      this.formData.append('channel', e.currentTarget.files[0]);
    },
    liClick(item, index) {
      this.currentIndex = index;
      this.$router.push({
        path: '/Home/channelDetail',
        query: {
          id: item.id
        }
      });
    },
    define() {
      if (!this.content && this.content.trim().length === 0) {
        this.$toast.show('名称不能为空', 1500);
      } else {
        this.formData.append('content', this.content);
        addChannel(this.formData).then((data) => {
          this.isShow = false;
          this.content = '';
          this.isShowPrev = false;
          this.formData = null;
          getAllChannel().then((data) => {
            this.channels = data;
          });
        });
      }
    },
    cancel() {
      this.isShow = false;
      this.content = '';
    },
    delChannel(item, index) {
      this.$confirm('确定要删除吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then((data) => {
        delChannel(item.id).then((data) => {
          this.$message({
            message: '删除成功',
            type: 'success'
          });
          this.$delete(this.channels, index);
        });
      });
    }
  }
};
</script>

<style scoped lang="less">
.channel {
  width: 100%;
  display: flex;
  flex-wrap: nowrap;
  background-color: #fff;
  overflow-y: scroll;
  height: 81vh;
  .left-channel {
    width: 100%;
    padding: 20px 20px 20px 0;
    position: relative;
    border: 1px solid #e6e6e6;
    height: 100%;
    overflow-y: scroll;
    .add-btn {
      display: flex;
      justify-content: flex-end;
      margin: 0 0 15px 0;
      .btn {
        background-color: #f56c6c;
        color: #ffffff;
        padding: 7px 20px;
        border-radius: 15px;
        display: flex;
        align-items: center;
        cursor: pointer;
        font-size: 13px;
        &:hover {
          background-color: #ec4141;
        }
      }
    }
    .channel-content {
      position: absolute;
      left: 50%;
      top: 30%;
      transform: translate(-50%, -50%);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      padding: 40px 25px;
      background-color: #fff;
      border-radius: 5px;
      .content {
        margin: 0 0 50px 0;
        .inp {
          border: 1px solid #ec4141;
          padding: 8px 15px;
          margin: 0 0 0 15px;
          border-radius: 3px;
        }
      }
      .img-container {
        margin: 0 0 20px 0;
        height: 100px;
        background-color: rgba(245, 108, 108, 0.08);
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        input {
          height: 100%;
          width: 100%;
          opacity: 0;
        }
        i.icon-tupian {
          position: absolute;
          left: 50%;
          top: 50%;
          transform: translate(-50%, -50%);
          color: #ec4141;
          font-size: 22px;
        }
        img {
          height: 100%;
        }
      }
      .control-btn {
        display: flex;
        justify-content: center;
        button {
          font-size: 13px;
          padding: 7px 38px;
          margin: 0 15px;
          cursor: pointer;
          border-radius: 4px;
          &:nth-child(1) {
            background-color: #f56c6c;
            color: #fff;
          }
        }
      }
    }
    .channel-list {
      & > li {
        padding: 10px 0 10px 20px;
        display: flex;
        align-items: center;
        .name {
          width: 30%;
          color: #0086b3;
        }
        .create-time {
          width: 20%;
          color: #656565;
          font-size: 13px;
        }
        .count {
          color: #656565;
          font-size: 13px;
          width: 15%;
        }
        &:nth-child(odd) {
          background-color: #f9f9f9;
        }
        &.active {
          color: #ec4141 !important;
          i {
            color: #ec4141;
          }
          .name {
            color: #ec4141;
          }
          .create-time,
          .count {
            color: #ec4141;
          }
        }
        &:hover {
          background-color: #f0f1f2;
          cursor: pointer;
        }
        i {
          opacity: 0;
          margin: 0 15px 0 0;
        }
        i.active {
          opacity: 1;
        }
        .control-btn {
          display: flex;
          .del {
            background-color: #f56c6c;
            color: #fff;
            font-size: 13px;
            padding: 5px 15px;
            margin: 0 15px 0 0;
            border-radius: 4px;
          }
        }
      }
    }
  }
  .right {
    width: 20%;
  }
}
</style>
