<template>
  <div class="edit-album">
    <div class="artist-header">
      <div class="img-container">
        <img :src="album.coverUrl" :alt="album.name" />
      </div>
      <div class="right-content">
        <div class="artist-name">
          <div class="name">{{ name }}</div>
          <p class="edit" @click="editName">编辑名称</p>
        </div>
      </div>
    </div>
    <div class="artist-body">
      <div class="desc">
        <span>简介:</span><span class="edit" @click="editDesc">编辑</span>
        <p>{{ desc }}</p>
      </div>
      <div class="publish-time">
        <p>发布时间:</p>
        <el-date-picker
          v-model="timestamp"
          type="date"
          placeholder="选择日期时间"
          value-format="timestamp"
          @change="timeChange"
        >
        </el-date-picker>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'EditAlbum',
  data() {
    return {
      name: '',
      desc: '',
      timestamp: ''
    };
  },
  props: {
    album: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  created() {
    this.name = this.album.name;
    this.desc = this.album.description;
    this.timestamp = this.album.publishTime;
  },
  methods: {
    editName() {
      this.$prompt('请输入名称', '', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputValue: this.name
      })
        .then((data) => {
          const { value } = data;
          this.name = value;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    editDesc() {
      this.$confirm('请输入简介', '', {
        showInput: true,
        inputType: 'textarea',
        inputValue: this.desc
      })
        .then((data) => {
          const { value } = data;
          this.desc = value;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    timeChange(e) {
      this.timestamp = e;
    }
  }
};
</script>

<style scoped lang="less">
.edit-album {
  padding: 0 15px;
  .img-container {
    width: 140px;
    img {
      width: 100%;
    }
  }
  .artist-header {
    display: flex;
    align-items: flex-start;
    .img-container {
      margin: 0 20px 0 0;
      img {
        border-radius: 4px;
      }
    }
    .right-content {
      .edit {
        color: #a0cfff;
        cursor: pointer;
      }
      .artist-name {
        display: flex;
        align-items: flex-end;
        .name {
          font-size: 16px;
          margin: 15px 15px 0 0;
        }
      }
    }
  }
  .artist-body {
    margin: 20px 0 0 0;
    .desc {
      span {
        color: #9b9b9b;
      }
      p {
        line-height: 24px;
        color: #656565;
        margin: 15px 0 0 0;
      }
      .edit {
        color: #a0cfff;
        cursor: pointer;
        margin: 0 0 0 30px;
      }
    }
    .publish-time {
      margin: 20px 0 0 0;
      & > p {
        margin: 0 0 10px 0;
      }
    }
  }
}
</style>
