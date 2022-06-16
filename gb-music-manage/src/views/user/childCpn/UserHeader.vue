<template>
  <div class="user-header">
    <ul>
      <li>
        <div class="key">系统用户 :</div>
        <div class="value">{{ userCount.total }}</div>
      </li>
      <li>
        <div class="key">vip用户 :</div>
        <div class="value">{{ userCount.vip }}</div>
      </li>
      <li>
        <div class="key">非vip用户 :</div>
        <div class="value">{{ userCount.noVip }}</div>
      </li>
      <li>
        <div class="key">管理员 :</div>
        <div class="value">{{ userCount.manage }}</div>
      </li>
    </ul>
  </div>
</template>

<script>
import { getUserCount } from '@/network/user';

export default {
  name: 'UserHeader',
  data() {
    return {
      userCount: {}
    };
  },
  created() {
    getUserCount().then((data) => {
      this.userCount = data;
    });
  }
};
</script>

<style scoped lang="less">
.user-header {
  border-bottom: 1px solid #dcdfe6;
  padding: 0 0 20px 0;
  & > ul {
    display: flex;
    align-items: center;
    & > li {
      margin: 0 20px 0 0;
      padding: 25px 35px;
      display: flex;
      align-items: center;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
      border-radius: 10px;
      .key,
      .value {
        font-weight: bolder;
        font-size: 18px;
        color: #656565;
        font-family: 'Arial,Helvetica,sans-serif' !important;
      }
      .key {
        margin: 0 10px 0 0;
      }
    }
  }
}
</style>
