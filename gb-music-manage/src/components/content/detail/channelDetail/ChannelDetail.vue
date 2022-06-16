<template>
  <div class="channel-detail">
    <div class="left">
      <div class="add-btn">
        <button @click="addBtn">
          <i class="iconfont icon-jiahao"></i>
          添加内容
        </button>
      </div>

      <div class="upload-content" v-if="isShow">
        <UploadContent @define="define" @cancel="cancel" />
      </div>

      <ul class="channel-list">
        <li v-for="(item, index) in channel" :key="item.id">
          <div class="index">
            {{ (index + 1).toString().padStart(2, '0') }}
          </div>
          <div class="img-container">
            <img :src="item.coverUrl" :alt="item.name" />
          </div>
          <div class="state">
            {{ item.name }}
          </div>
          <div class="time">
            {{ (item.createTime, 'yyyy-MM-dd' | timeFormat) }}
          </div>
          <div class="play-count">
            <i class="el-icon-video-play"></i>
            <span>{{ item.playCount }}</span>
          </div>
          <div class="count">
            {{ item.count }}
            个声音
          </div>
          <div class="btn">
            <button @click="delChannel(item)">删除</button>
            <button @click="editChannel(item, index)">编辑</button>
          </div>
        </li>
      </ul>
      <div class="empty" v-if="channel.length === 0">
        <el-empty description="暂无电台"></el-empty>
      </div>
      <div class="page" v-if="count > 7">
        <el-pagination
          background
          layout="prev, pager, next"
          :total="count"
          :page-size="7"
          @current-change="pageChange"
        >
        </el-pagination>
      </div>
    </div>
    <div class="right">
      <el-drawer
        :direction="direction"
        :visible.sync="drawer"
        :destroy-on-close="true"
        :show-close="false"
      >
        <template v-slot:title>
          <div class="title-control">
            <div class="title">编辑电台信息</div>
            <div class="define" @click="defineEdit">确定</div>
          </div>
        </template>
        <edit-channel v-if="drawer" :channel="channelItem" :cate="cate" ref="channelEdit" />
      </el-drawer>
    </div>
  </div>
</template>

<script>
import {
  addContent,
  deleteChannel,
  getChannelContent,
  updateChannel,
  uploadContentCover
} from '@/network/channel';
import timeFormat from '@/utils/filter';
import UploadContent from '@/components/content/detail/channelDetail/childCpn/uploadContent/UploadContent';
import EditChannel from '@/components/content/detail/channelDetail/childCpn/editChannel/EditChannel';
export default {
  name: 'ChannelDetail',
  components: { EditChannel, UploadContent },
  data() {
    return {
      count: 0,
      channel: [],
      isShow: false,
      id: '',
      drawer: false,
      direction: 'rtl',
      channelItem: {},
      cate: {}
    };
  },
  filters: timeFormat,
  created() {
    this.id = this.$route.query.id;
    getChannelContent(this.$route.query.id, 0, 7).then((data) => {
      this.count = data.count;
      this.cate = data.category;
      this.channel = data.channel;
    });
  },
  methods: {
    addBtn() {
      this.isShow = true;
    },
    pageChange(e) {
      getChannelContent(this.id, (e - 1) * 7, 7).then((data) => {
        this.count = data.count;
        this.channel = data.channel;
      });
    },
    define(content, desc, file) {
      console.log(content, desc, file);
      if (!content || content.trim().length === 0) {
        this.$toast.show('名称不能为空', 1500);
      } else if (!desc || desc.trim().length === 0) {
        this.$toast.show('简介不能为空', 1500);
      } else if (!file) {
        this.$toast.show('文件不能为空', 1500);
      } else {
        addContent(this.id, content, desc).then((data) => {
          if (data) {
            const { id } = data;
            let formData = new FormData();
            formData.append('cover', file);
            formData.append('id', id);
            uploadContentCover(formData).then((data) => {
              this.isShow = false;
              getChannelContent(this.id, 0, 7).then((data) => {
                this.count = data.count;
                this.channel = data.channel;
              });
            });
          }
        });
      }
    },
    cancel() {
      this.isShow = false;
    },
    defineEdit() {
      if (this.$refs.channelEdit) {
        this.$refs.channelEdit.$refs.form.validate((e) => {
          if (e) {
            const { name, desc, cate } = this.$refs.channelEdit.form;
            updateChannel(this.channelItem.id, name, desc, cate).then((data) => {
              getChannelContent(this.id, 0, 7).then((data) => {
                this.count = data.count;
                this.channel = data.channel;
              });
              this.drawer = false;
              this.$message({
                message: '更新成功',
                type: 'success'
              });
            });
          }
        });
      }
    },
    editChannel(item) {
      this.drawer = true;
      this.channelItem = item;
    },
    delChannel(item) {
      this.$confirm('确认删除该电台?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          deleteChannel(item.id).then((data) => {
            getChannelContent(this.id, 0, 7).then((data) => {
              this.count = data.count;
              this.channel = data.channel;
            });
            this.$message({
              message: '删除成功',
              type: 'success'
            });
          });
        })
        .catch((err) => {
          console.log(err);
        });
    }
  }
};
</script>

<style scoped lang="less">
.channel-detail {
  width: 100%;
  background-color: #fff;
  padding: 0 0 30px 0;
}
.left {
  width: 90%;
  border: 1px solid #e0e0e0;
  position: relative;
  .upload-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
  }
  .add-btn {
    display: flex;
    justify-content: flex-end;
    margin: 15px 20px 15px 0;
    button {
      font-size: 13px;
      color: #fff;
      background-color: #ec4141;
      padding: 8px 15px;
      border-radius: 15px;
      cursor: pointer;
    }
  }
  .channel-list {
    li {
      display: flex;
      align-items: center;
      padding: 10px 0;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:hover {
        background-color: #f0f1f2;
      }
      .index {
        padding: 0 15px;
        color: #ccc;
      }
      .img-container {
        width: 60px;
        height: 60px;
        margin: 0 30px 0 0;
        img {
          width: 100%;
          border-radius: 5px;
        }
      }
      .state {
        width: 30%;
      }
      .time {
        color: #959595;
        font-size: 13px;
        width: 20%;
      }
      .play-count {
        width: 15%;
        color: #9b9b9b;
        i {
          margin: 0 5px 0 0;
        }
      }
      .count {
        width: 10%;
        color: #9b9b9b;
      }
      .btn {
        button {
          background-color: #f56c6c;
          color: #fff;
          font-size: 13px;
          padding: 5px 15px;
          cursor: pointer;
          border-radius: 4px;
          margin: 0 20px 0 0;
        }
      }
    }
  }
  .empty {
    padding: 80px 0 180px 0;
  }
  .page {
    display: flex;
    justify-content: center;
    padding: 20px 0;
  }
}
.right {
  width: 20%;
}
</style>
