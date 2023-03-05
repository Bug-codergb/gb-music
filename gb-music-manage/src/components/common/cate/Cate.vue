<template>
  <div class="cate">
    <div class="title">{{ title }} :</div>
    <ul class="cate-list">
      <li
        v-for="(item, index) in list"
        :key="item.id"
        :class="{ active: currentIndex === index }"
        @click="liClick(item, index)"
      >
        {{ item.name }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Cate',
  props: {
    list: {
      type: Array,
      default: []
    },
    title: {
      type: String,
      default: '分类'
    }
  },
  data() {
    return {
      currentIndex: 0
    };
  },
  methods: {
    liClick(item, index) {
      this.currentIndex = index;
      this.$emit('cate-click', item);
    }
  }
};
</script>

<style scoped lang="less">
.cate {
  display: flex;
  align-items: center;
  .title {
    font-size: 13px;
    margin: 0 5px 0 0;
  }
}
.cate-list {
  display: flex;
  align-items: center;
  li {
    padding: 3px 15px;
    font-size: 13px;
    margin: 0 10px;
    cursor: pointer;
    border-radius: 10px;
    &.active {
      background-color: #fdf5f5;
      color: #a0cfff;
    }
  }
}
</style>
