<template>
  <div class="edit-user">
    <el-form :model="form" ref="form" :rules="rules" label-position="left" label-width="100px">
      <el-form-item label="用户名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入用户名称" />
      </el-form-item>
      <el-form-item label="会员信息" prop="vip">
        <el-select v-model="form.vip" style="width: 100%">
          <el-option :value="0" label="非会员"></el-option>
          <el-option :value="1" label="会员"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="套餐类型" prop="combo" v-if="form.vip === 1">
        <el-select v-model="form.combo" style="width: 100%">
          <el-option
            v-for="(item, index) in comboList"
            :key="item.id"
            :value="item.id"
            :label="`￥${item.price} / ${item.name}`"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="会员到期时间" prop="expireTime" v-if="form.vip === 1">
        <el-date-picker
          type="datetime"
          placeholder="选择会员到期时间"
          value-format="yyyy-MM-dd HH:mm:ss"
          v-model="form.expireTime"
          style="width: 100%"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="用户身份" prop="manage">
        <el-select v-model="form.manage" style="width: 100%">
          <el-option :value="1" label="管理员"></el-option>
          <el-option :value="0" label="普通用户"></el-option>
        </el-select>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getAllCombo } from '@/network/user';
import { formatTime } from '@/utils/format';
export default {
  name: 'EditUser',
  data() {
    return {
      form: {
        name: '',
        expireTime: '',
        vip: 0,
        manage: 0,
        combo: ''
      },
      rules: {
        name: [{ required: true, message: '请输用户名称', trigger: 'blur' }],
        vip: [{ required: true, message: '请选择VIP类型', trigger: 'change' }],
        expireTime: [{ required: true, message: '请选择过期时间', trigger: 'change' }],
        manage: [{ required: true, message: '请选择用户身份', trigger: 'change' }],
        combo: [{ required: true, message: '请选择套餐', trigger: 'change' }]
      },
      comboList: []
    };
  },
  props: {
    user: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  created() {
    getAllCombo().then((data) => {
      this.comboList = data;
    });
    this.form.name = this.user.userName;
    this.form.vip = this.user.auth;
    this.form.combo = this.user.cId;
    this.form.manage = this.user.manage;
    this.form.expireTime = formatTime(this.user.expireTime, 'yyyy-MM-dd hh:mm:ss');
  },
  methods: {}
};
</script>

<style scoped lang="less">
.edit-user {
  padding: 0 20px;
}
</style>
