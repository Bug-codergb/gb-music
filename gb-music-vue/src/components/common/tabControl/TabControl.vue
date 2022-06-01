<template>
  <div class="tab-control">
    <ul class="list">
      <li
        v-for="(item, index) in list"
        :key="item"
        :class="{ active: currentIndex === index }"
        @click="liClick(item, index)"
      >
        <span>{{ item }}</span>
      </li>
    </ul>
    <ul>
      <li v-for="(item, index) in list" :key="item" v-if="currentIndex === index">
        <div>
          <slot :name="index"></slot>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'TabControl',
  props: {
    list: {
      type: Array,
      default() {
        return [];
      }
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
    }
  }
};
</script>

<style scoped lang="less">
.list {
  margin: 0 0 20px 0;
  display: flex;
  li {
    margin: 0 20px 0 0;
    cursor: pointer;
    &.active {
      span {
        border-bottom: 3px solid #ec4141;
        font-weight: bold;
        padding: 0 0 2px 0;
      }
    }
  }
}
</style>
