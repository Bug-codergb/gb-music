<template>
  <div class="system">
    <ul class="data-list">
      <li>
        <div class="key">歌曲总数</div>
        <div class="line"></div>
        <div class="value">{{ song }}</div>
      </li>
      <li>
        <div class="key">MV总数</div>
        <div class="line"></div>
        <div class="value">{{ mv }}</div>
      </li>
      <li>
        <div class="key">动态</div>
        <div class="line"></div>
        <div class="value">{{ moment }}</div>
      </li>
      <li>
        <div class="key">声音</div>
        <div class="line"></div>
        <div class="value">{{ program }}</div>
      </li>
      <li>
        <div class="key">订单(已完成)</div>
        <div class="line"></div>
        <div class="value">{{ order }}</div>
      </li>
      <li>
        <div class="key">用户</div>
        <div class="line"></div>
        <div class="value">{{ user }}</div>
      </li>
    </ul>
  </div>
</template>

<script>
import { getSystemData } from '@/network/user';

export default {
  name: 'System',
  data() {
    return {
      moment: 0,
      song: 0,
      mv: 0,
      program: 0,
      order: 0,
      user: 0
    };
  },
  created() {
    getSystemData().then((data) => {
      const { moment, song, mv, program, order, user } = data;
      this.moment = moment;
      this.song = song;
      this.mv = mv;
      this.program = program;
      this.order = order;
      this.user = user;
    });
  }
};
</script>

<style scoped lang="less">
.system {
  .data-list {
    display: flex;
    flex-wrap: wrap;
    & > li {
      width: 33.3%;
      display: flex;
      flex-direction: column-reverse;
      align-items: center;
      padding: 20px 0;
      .key {
        font-weight: bolder;
        color: #5470c6;
      }
      .value {
        font-weight: bolder;
        font-size: 28px;
        color: #5470c6;
      }
      .line {
        width: 90%;
        height: 2px;
        background: linear-gradient(to right, #ee6666, #73c0de);
        margin: 5px 0;
        border-radius: 50%;
      }
    }
  }
}
</style>
