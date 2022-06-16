<template>
  <div class="lyric">
    <textarea rows="10" cols="50" v-model="lyric" />
    <div class="control-btn">
      <button @click="define">确定</button>
      <button @click="cancel">取消</button>
    </div>
  </div>
</template>

<script>
import { uploadLyric } from '@/network/song';

export default {
  name: 'Lyric',
  data() {
    return {
      lyric: ''
    };
  },
  props: {
    songId: {
      type: String,
      default: ''
    }
  },
  methods: {
    define() {
      uploadLyric(this.songId, this.lyric).then((data) => {
        this.$emit('define');
      });
    },
    cancel() {
      this.$emit('cancel');
    }
  }
};
</script>

<style scoped lang="less">
.lyric {
  position: absolute;
  left: 50%;
  top: 40%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  padding: 30px;
  border-radius: 5px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  .control-btn {
    display: flex;
    justify-content: flex-end;
    margin: 20px 0 0 0;
    button {
      background-color: #f56c6c;
      color: #fff;
      font-size: 13px;
      padding: 5px 15px;
      border-radius: 4px;
      margin: 0 0 0 20px;
      cursor: pointer;
    }
  }
}
</style>
