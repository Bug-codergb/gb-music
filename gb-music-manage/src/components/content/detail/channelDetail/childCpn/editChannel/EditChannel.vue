<template>
  <div class="edit-channel">
    <el-form :model="form" ref="form" :rules="rules" label-position="left" label-width="100px">
      <el-form-item label="电台名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入电台名称" />
      </el-form-item>
      <el-form-item label="电台分类" prop="cate">
        <el-select v-model="form.cate" placeholder="请选择电台分类">
          <el-option v-for="item in cateList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="电台简介" prop="desc">
        <el-input type="textarea" v-model="form.desc" :autosize="{ minRows: 10, maxRows: 30 }" />
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getVideoCate } from '@/network/video';
import { getAllChannel } from '@/network/channel';

export default {
  name: 'EditChannel',
  data() {
    return {
      form: {
        name: '',
        cate: '',
        desc: ''
      },
      rules: {
        name: [{ required: true, message: '请输电台名称', trigger: 'blur' }],
        cate: [{ required: true, message: '请选择电台分类', trigger: 'change' }],
        desc: [{ required: true, message: '请输入电台简介', trigger: 'blur' }]
      },
      cateList: []
    };
  },
  props: {
    cate: {
      type: Object,
      default() {
        return {};
      }
    },
    channel: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  created() {
    this.form.name = this.channel.name;
    this.form.desc = this.channel.description;
    this.form.cate = this.cate.id;
    getAllChannel().then((data) => {
      this.cateList = data;
    });
  }
};
</script>

<style scoped lang="less">
.edit-channel {
  padding: 0 30px;
}
</style>
