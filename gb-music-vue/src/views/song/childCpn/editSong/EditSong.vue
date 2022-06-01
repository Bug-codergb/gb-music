<template>
  <div class="edit-song">
    <el-form :model="form" ref="form" :rules="rules" label-position="left" label-width="100px">
      <el-form-item label="歌曲名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入歌曲名称" />
      </el-form-item>
      <el-form-item label="歌曲别名" prop="alia">
        <el-input v-model="form.alia" placeholder="情输入歌曲别名" />
      </el-form-item>
      <el-form-item label="发布时间" prop="publishTime">
        <el-date-picker
          type="date"
          placeholder="选择歌曲发布时间"
          value-format="timestamp"
          v-model="form.publishTime"
          style="width: 100%"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="VIP" prop="vip">
        <el-radio-group v-model="form.vip" style="width: 70%">
          <el-radio :label="1">VIP歌曲</el-radio>
          <el-radio :label="0">非VIP歌曲</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="歌词" prop="lyric">
        <el-input type="textarea" v-model="form.lyric" :autosize="{ minRows: 10, maxRows: 50 }" />
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getLyric } from '@/network/song';

export default {
  name: 'EditSong',
  data() {
    return {
      form: {
        name: '',
        alia: '',
        publishTime: '',
        vip: false,
        lyric: ''
      },
      rules: {
        name: [{ required: true, message: '请输歌曲名称', trigger: 'blur' }],
        alia: [{ required: true, message: '请输别名', trigger: 'blur' }],
        publishTime: [{ required: true, message: '请选择发布时间', trigger: 'change' }]
      }
    };
  },
  props: {
    song: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  created() {
    this.form.name = this.song.name;
    this.form.alia = this.song.alia;
    this.form.publishTime = this.song.publishTime;
    this.form.vip = this.song.vip;
    getLyric(this.song.id).then((data) => {
      this.form.lyric = data.lyric;
    });
  }
};
</script>

<style scoped lang="less">
.edit-song {
  padding: 0 30px;
}
</style>
