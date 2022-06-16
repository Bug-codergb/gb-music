<template>
  <transition name="toast">
    <div class="toast" v-show="isShow">
      {{ message }}
    </div>
  </transition>
</template>

<script>
export default {
  name: 'Toast',
  data() {
    return {
      message: '',
      isShow: false
    };
  },
  methods: {
    show(msg = '暂无文字', duration = 2000) {
      this.message = msg;
      this.isShow = true;
      setTimeout(() => {
        this.isShow = false;
      }, duration);
    }
  }
};
</script>

<style scoped lang="less">
.toast {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #f27a7a;
  color: #fff;
  padding: 10px 20px;
  border-radius: 10px;
  z-index: 99999999999;
}
.toast-enter-from {
  opacity: 0;
}
.toast-enter-active {
  opacity: 0;
  transition: opacity 0.3s;
}
.toast-enter-to {
  opacity: 1;
}
.toast-leave-from {
  opacity: 1;
}
.toast-leave-active {
  opacity: 1;
  transition: opacity 0.3s;
}
.toast-leave-to {
  opacity: 0;
}
</style>
