<template>
  <div class="msg-item">
    <div
      class="img-container"
      :style="{ width: itemWidth, height: parseInt(itemWidth) * scale + 'px' }"
    >
      <slot name="img-container"></slot>
      <div class="playCount" v-show="isShowPC">
        {{ playCount }}
      </div>
      <div class="duration" v-show="isShowDT">
        {{ formatTime(dt, 'mm:ss') }}
      </div>
    </div>
    <div class="state">
      <slot name="state"></slot>
    </div>
    <div class="user-msg" v-if="user">
      <div class="avatar">
        <img :src="user.avatarUrl" />
      </div>
      <div class="user-name">
        {{ user.userName }}
      </div>
    </div>
  </div>
</template>

<script>
import { formatTime } from '@/utils/format';

export default {
  name: 'MsgItem',
  props: {
    itemWidth: {
      type: String,
      default: '130px'
    },
    user: {
      userName: {
        type: String,
        default: ''
      },
      avatarUrl: {
        type: String,
        default: ''
      }
    },
    playCount: {
      type: Number,
      default: 78
    },
    dt: {
      type: Number,
      default: 0
    },
    isShowDT: {
      type: Boolean,
      default: false
    },
    isShowPC: {
      type: Boolean,
      default: false
    },
    scale: {
      type: Number,
      default: 0.6
    }
  },
  methods: {
    formatTime(time, ft) {
      return formatTime(time, ft);
    }
  }
};
</script>

<style scoped lang="less">
.center() {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.img-container {
  position: relative;
  background-color: #373737;
  overflow: hidden;
  img {
    width: 100%;
  }
  .playCount {
    position: absolute;
    color: #fff;
    left: 100%;
    top: 0;
    transform: translate(-110%, 0);
  }
  .duration {
    position: absolute;
    left: 95%;
    top: 90%;
    transform: translate(-110%, -110%);
    color: #fff;
  }
}
.state {
  margin: 10px 0;
}
.user-msg {
  display: flex;
  align-items: center;
  .avatar {
    width: 20px;
    height: 20px;
    overflow: hidden;
    border-radius: 50%;
    position: relative;
    img {
      height: 100%;
      .center();
    }
  }
  .user-name {
    font-size: 13px;
    margin: 0 0 0 5px;
  }
}
</style>
