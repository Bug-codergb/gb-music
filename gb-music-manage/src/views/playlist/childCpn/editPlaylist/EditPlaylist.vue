<template>
  <div class="edit-playlist">
    <el-form :model="form" ref="form" :rules="rules" label-position="left" label-width="100px">
      <el-form-item label="歌单名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入歌单名称" />
      </el-form-item>
      <el-form-item label="歌单分类" prop="cate">
        <el-select
          v-model="form.cate"
          placeholder="请选择歌单分类"
          multiple
          clearable
          :multiple-limit="3"
          style="width: 100%"
        >
          <el-option v-for="item in cateList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="歌单简介" prop="desc">
        <el-input type="textarea" v-model="form.desc" :autosize="{ minRows: 10, maxRows: 30 }" />
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getPlaylistCate } from '@/network/playlist';

export default {
  name: 'EditPlaylist',
  data() {
    return {
      form: {
        name: '',
        cate: [],
        desc: ''
      },
      rules: {
        name: [{ required: true, message: '请输歌单名称', trigger: 'blur' }],
        cate: [{ required: true, message: '请选择歌单分类', trigger: 'change' }],
        desc: [{ required: true, message: '请输入歌单简介', trigger: 'blur' }]
      },
      cateList: []
    };
  },
  props: {
    playlist: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  created() {
    this.form.name = this.playlist.name;
    this.form.desc = this.playlist.desc;
    if(this.playlist.category){
      this.form.cate = this.playlist.category.map((item, index) => {
        return item.id;
      });
    }
    this.form.desc = this.playlist.description;
    getPlaylistCate(0, 30).then((data) => {
      this.cateList = data;
    });
  }
};
</script>

<style scoped lang="less">
.edit-playlist {
  padding: 0 30px;
}
</style>
