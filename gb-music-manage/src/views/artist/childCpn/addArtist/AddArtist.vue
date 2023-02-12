<template>
  <el-dialog
    title="添加歌手信息"
    top="5vh"
    :show-close="false"
    :close-on-click-modal="false"
    :visible.sync="isShow"
    :destroy-on-close="true"
    width="38%">
    <div class="upload-artist">
      <div class="name">
        <span>姓名</span>
        <textarea cols="50" rows="2" v-model="name"></textarea>
      </div>
      <div class="desc">
        <span>简介</span>
        <textarea cols="50" rows="7" v-model="desc"></textarea>
      </div>
      <div class="avatar">
        <p>上传头像</p>
        <div class="icon">
          <input type="file" @change="change" v-show="preview" />
          <i class="iconfont icon-tupian" v-show="preview"></i>
          <img :src="avatarUrl" v-show="!preview" />
        </div>
      </div>
      <p class="cate-tip">分类</p>
      <ul class="cate">
        <li
          v-for="(item, index) in cateList"
          :key="item.id"
          :class="{ active: currentIndex === index }"
          @click="liClick(item, index)"
        >
          {{ item.name }}
        </li>
      </ul>
    </div>
    <span slot="footer" class="dialog-footer">
    <el-button size="small" @click="cancel">取 消</el-button>
    <el-button size="small" type="primary" @click="upload">确 定</el-button>
  </span>
  </el-dialog>
</template>

<script>
import { addArtist, getArtistCate, uploadArtistAvatar } from '../../../../network/artist';

export default {
  name: 'AddArtist',
  props:{
    isShow:{
      type:Boolean,
      default:false
    }
  },
  data() {
    return {
      currentIndex: 0,
      cateList: [],
      cateId: '',
      name: '',
      desc: '',
      avatar: null,
      preview: true,
      avatarUrl: ''
    };
  },
  created() {
    getArtistCate().then((data) => {
      this.cateList = data;
      if (data) {
        this.cateId = data[0].id;
      }
    });
  },
  methods: {
    resetData(){
      this.currentIndex= 0;
        this.cateId= '';
        this.name='';
        this.desc= '';
        this.avatar= null;
        this.preview= true;
        this.avatarUrl= '';
    },
    liClick(item, index) {
      this.currentIndex = index;
      this.cateId = item.id;
    },
    change(e) {
      if(e.target.files[0]){
        const {type} = e.target.files[0];
        if(!type.includes('image')){
          this.$message({
            message:"请选择图片文件",
            type:"warning"
          })
        }else{
          this.avatarUrl = URL.createObjectURL(e.target.files[0]);
          this.preview = !this.preview;
          this.avatar = e.target.files[0];
        }
      }
    },
    //确认上传
    upload() {
      if (this.name.trim().length === 0) {
        this.$toast.show('歌手姓名不能为空', 1500);
      } else if (this.desc.trim().length === 0) {
        this.$toast.show('歌手简介不能为空', 1500);
      } else if (!this.avatar) {
        this.$toast.show('您还未选择头像', 1500);
      } else {
        let formData = new FormData();
        formData.append('artist_avatar', this.avatar);
        addArtist(this.name, this.desc, this.cateId).then((data) => {
          const { id } = data;
          uploadArtistAvatar(id, formData).then((data) => {
            if (data) {
              this.resetData();
              this.$emit('cancel');
              this.$emit("success");
              this.$toast.show('添加成功', 1500);
            }
          });
        });
      }
    },
    cancel() {
      this.resetData();
      this.$emit('cancel');
    }
  }
};
</script>

<style scoped lang="less">
.upload-artist {
  background-color: #fff;
  display: flex;
  flex-direction: column;
  padding: 0 10px;
  align-items: center;
  .name {
    display: flex;
    align-items: center;
    margin: 0 0 20px 0;
    width: 100%;
    span {
      margin: 0 10px 0 0;
    }
    textarea{
      flex: 1;
    }
  }
  .desc {
    width: 100%;
    display: flex;
    align-items: flex-start;
    span {
      margin: 0 10px 0 0;
    }
    textarea{
      flex: 1;
    }
  }
  .avatar {
    width: 100%;
    margin: 20px 0 0 0;
    p {
      font-size: 14px;
      margin: 5px 0;
    }
    .icon {
      border: 2px dotted #cecece;
      background-color: rgba(0, 0, 0, 0.05);
      text-align: center;
      height: 100px;
      width: 100%;
      overflow: hidden;
      line-height: 100px;
      i {
        font-size: 35px;
        color: #ea646f;
      }
      input {
        position: absolute;
        opacity: 0;
        height: 100px;
        width: 400px;
        display: block;
      }
      img {
        height: 100%;
      }
    }
  }
  .cate-tip {
    margin: 5px 0;
    width: 100%;
  }
  .cate {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    li {
      cursor: pointer;
      margin: 0 15px 10px 0;
      background-color: rgba(236, 65, 65, 0.4);
      color: #fff;
      font-size: 13px;
      padding: 5px 15px;
      border-radius: 3px;
      &.active {
        background-color: rgba(236, 65, 65, 0.7);
      }
    }
  }
  .control-btn {
    margin: 20px 0 0 0;
    display: flex;
    justify-content: flex-end;
    button {
      cursor: pointer;
      font-size: 13px;
      padding: 5px 10px;
      margin: 0 0 0 15px;
      &:nth-child(1) {
        background-color: rgba(236, 65, 65, 0.7);
        color: #fff;
      }
      &:nth-child(2) {
        color: #ee7676;
      }
    }
  }
}
</style>
