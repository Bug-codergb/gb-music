<template>
  <div class="list-outer">
    <div class="list">
      <el-autocomplete
        class="inline-input"
        v-model="id"
        :fetch-suggestions="querySearch"
        placeholder="请输入相关内容"
        :trigger-on-focus="false"
        @select="handleSelect"
      ></el-autocomplete>
      <div class="control-btn">
        <button @click="defineList">确定</button>
        <button @click="defineList">取消</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'List',
  data() {
    return {
      id: '',
      formatList: []
    };
  },
  props: {
    list: {
      type: Array,
      default() {
        return [];
      }
    }
  },
  created() {
    this.formatList = this.list.map((item, index) => {
      return {
        id: item.id,
        name: item.name,
        value: item.name
      };
    });
  },
  methods: {
    querySearch(queryString, cb) {
      const res = this.formatList;
      const results = queryString ? res.filter(this.createFilter(queryString)) : res;
      // 调用 callback 返回建议列表的数据
      cb(results);
    },
    createFilter(queryString) {
      return (res) => {
        return res.value.toLowerCase().includes(queryString.toLowerCase());
      };
    },
    defineList() {
      this.$emit('defineArtist');
    },
    handleSelect(item) {
      this.$emit('select-artist', item);
    }
  }
};
</script>

<style scoped lang="less">
.list-outer {
  .list {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    color: #a0cfff;
    padding: 40px 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    .control-btn {
      display: flex;
      justify-content: flex-end;
      margin: 40px 0 0 0;
      button {
        font-size: 13px;
        padding: 5px 15px;
        margin: 0 0 0 15px;
        border-radius: 4px;
        &:nth-child(1) {
          background-color: #a0cfff;
          color: #fff;
        }
      }
    }
  }
}
</style>
