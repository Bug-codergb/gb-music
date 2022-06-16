<template>
  <div class="add-msg">
    <div class="avatar">
      <slot name="icon"></slot>
    </div>
    <div class="add-btn" @click="addClick" :style="{ backgroundColor: bgc }">
      {{ title }}
    </div>
  </div>
</template>

<script>
export default {
  name: 'AddMsg',
  props: {
    title: {
      type: String,
      default: ''
    },
    bgc: {
      type: String,
      default: '#f27a7a'
    }
  },
  methods: {
    addClick() {
      this.$emit('add-content');
    }
  }
};
</script>

<style scoped lang="less">
.add-msg {
  .avatar {
    margin: 0 auto;
    width: 80px;
    height: 80px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f7b3b3;
    i {
      color: #fff;
    }
  }
}
.add-btn {
  color: #fff;
  cursor: pointer;
  padding: 8px 20px;
  background-color: #f27a7a;
  font-size: 14px;
  border-radius: 3px;
  margin: 20px 0 0 0;
}
</style>
