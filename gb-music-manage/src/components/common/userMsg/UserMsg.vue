<template>
  <div class="user-msg">
    <div class="avatar" :style="{ width: itemWidth, height: itemWidth }">
      <img :src="avatarUrl" alt="" />
    </div>
    <div class="user-name">{{ userName }}</div>
  </div>
</template>

<script>
export default {
  name: 'UserMsg',
  props: {
    avatarUrl: {
      type: String,
      default: ''
    },
    userName: {
      type: String,
      default: ''
    },
    itemWidth: {
      type: String,
      default: '25px'
    }
  }
};
</script>

<style scoped lang="less">
.user-msg {
  display: flex;
  align-items: center;
  .avatar {
    overflow: hidden;
    border-radius: 50%;
    img {
      height: 100%;
    }
  }
  .user-name {
    font-size: 13px;
    margin: 0 0 0 5px;
  }
}
</style>
