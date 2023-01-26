<template>
  <div class="toplist">
    <div class="left-content">
      <div class="add-toplist" v-if="isShow">
        <upload
          @select-file="selectFile"
          @define="define"
          @cancel="cancel"
          @titleInp="titleInp"
          @contentInp="contentInp"
        >
          <span slot="title">名称</span>
          <span slot="desc-name">简介</span>
        </upload>
      </div>
      <!--官方榜单-->
      <official />
      <!--热门榜单-->
      <hot-toplist />
    </div>
    <div class="right-content">
      <add-msg title="添加榜单" @add-content="addToplist">
        <i class="iconfont icon-music-albums icon" slot="icon"></i>
      </add-msg>
      <button class="refresh-btn" @click="refreshToplist">更新</button>
    </div>
  </div>
</template>

<script>
import AddMsg from '@/components/common/addMsg/AddMsg';
import Upload from '@/components/common/upload/Upload';
import { addToplist, refreshRank, uploadCover } from '@/network/toplist';
import Official from '@/views/toplist/childCpn/official/official';
import HotToplist from '@/views/toplist/childCpn/hotToplist/HotToplist';
export default {
  name: 'Toplist',
  components: {
    HotToplist,
    Official,
    AddMsg,
    Upload
  },
  data() {
    return {
      isShow: false,
      title: '',
      desc: '',
      file: null
    };
  },
  methods: {
    addToplist() {
      this.isShow = true;
    },
    selectFile(file) {
      this.file = file;
    },
    titleInp(title) {
      this.title = title;
    },
    contentInp(content) {
      this.desc = content;
    },
    define() {
      if (this.title && this.desc && this.file) {
        addToplist(this.title, this.desc).then((data) => {
          const { tId } = data;
          let formData = new FormData();
          formData.append('cover', this.file);
          uploadCover(formData, tId).then((data) => {
            this.isShow = false;
          });
        });
      }
    },
    cancel() {
      this.isShow = false;
    },
    refreshToplist() {
      refreshRank().then((data) => {
        if (Object.keys(data).length !== 0) {
          const { status } = data;
          if (status === 200) {
            this.$message({
              duration: '1500',
              message: '更新成功',
              type: 'success'
            });
          }
        }
      });
    }
  }
};
</script>

<style scoped lang="less">
.toplist {
  display: flex;
  background-color: #fff;
  height: 90vh;
}
.left-content {
  /*height: 645px;*/
  overflow-y: scroll;
  width: 80%;
  position: relative;
  border: 1px solid #e0e0e0;
  .add-toplist {
    position: absolute;
    left: 50%;
    transform: translate(-50%, 0);
  }
  &::-webkit-scrollbar {
    width: 2px;
  }
}
.right-content {
  height: 100%;
  width: 20%;
  text-align: center;
  padding: 0 10px;
  .icon {
    font-size: 30px;
  }
  .refresh-btn {
    margin: 30px 0 0 0;
    background-color: #f56c6c;
    color: #fff;
    padding: 8px 0;
    border-radius: 4px;
    cursor: pointer;
    white-space: nowrap;
    width:97% ;
  }
}
</style>
