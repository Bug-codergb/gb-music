<template>
  <div class="header">
    <p>{{ title }}</p>
  </div>
</template>

<script>
export default {
  name: 'Header',
  props: {
    title: {
      type: String,
      default: '专辑'
    }
  }
};
</script>

<style scoped lang="scss">
.header {
  padding: 5px 0 5px 3px;
  border-bottom: 1px solid rgba(0, 119, 170, 0.6);
  p{
    padding:0;
    margin:0;
    font-size: 14px;
  }
}
</style>
