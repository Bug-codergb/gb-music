<template>
  <div class="edit-mv">
    <el-form :model="form" ref="form" :rules="rules" label-position="left" label-width="100px">
      <el-form-item label="视频名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入视频名称" />
      </el-form-item>
      <el-form-item label="视频分类" prop="cate">
        <el-select v-model="form.cate" placeholder="请选择视频分类">
          <el-option v-for="item in cateList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="视频简介" prop="desc">
        <el-input type="textarea" v-model="form.desc" :autosize="{ minRows: 10, maxRows: 30 }" />
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getVideoCate } from '@/network/video';

export default {
  name: 'EditMV',
  data() {
    return {
      form: {
        name: '',
        cate: '',
        desc: ''
      },
      rules: {
        name: [{ required: true, message: '请输MV名称', trigger: 'blur' }],
        cate: [{ required: true, message: '请选择MV分类', trigger: 'change' }],
        desc: [{ required: true, message: '请输入MV简介', trigger: 'blur' }]
      },
      cateList: []
    };
  },
  props: {
    mv: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  created() {
    console.log(this.mv);
    this.form.name = this.mv.name;
    this.form.desc = this.mv.description;
    this.form.cate = this.mv.category.id;
    getVideoCate(1).then((data) => {
      this.cateList = data;
    });
  }
};
</script>

<style scoped lang="less">
.edit-mv {
  padding: 0 30px;
}
</style>
