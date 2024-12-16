<template>
  <div class="line-count">
    <div class="count">
      <div class="key">官方榜单:</div>
      <div class="value">{{ count }}</div>
    </div>
    <div class="count">
      <div class="key">热门榜单:</div>
      <div class="value">{{ count }}</div>
    </div>
  </div>
</template>

<script>
//import { WS_HOST_NAME } from '@/constant/host';
//import { getLineCount } from '@/network/user';

export default {
  name: 'LineUser',
  data() {
    return {
      count: 0
    };
  },
  mounted() {

  }
};
</script>

<style scoped lang="scss">
.line-count {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  flex-direction: column;
  .count {
    display: flex;
    align-items: center;
    .key {
      font-size: 20px;
      font-weight: bolder;
    }
    .value {
      font-size: 36px;
      font-weight: bolder;
      color: #5470c6;
      margin: 0 0 0 20px;
    }
  }
}
</style>
