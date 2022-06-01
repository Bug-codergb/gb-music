<template>
  <div class="list-info">
    <div class="index">
      <slot name="index"></slot>
    </div>
    <div class="love">
      <i class="iconfont icon-love"></i>
    </div>
    <div class="download">
      <i class="iconfont icon-download"></i>
    </div>
    <div class="song-name">
      <slot name="state"></slot>
    </div>
    <div class="artist">
      <slot name="creator"></slot>
    </div>
    <div class="album">
      <slot name="time"></slot>
    </div>
    <div class="dt">
      <slot name="duration"></slot>
    </div>
    <div class="operate">
      <slot name="operate"></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ListInfo'
};
</script>

<style scoped lang="less">
.list-info {
  display: flex;
  align-items: center;
  width: 100%;
  color: #656565;
  .index {
    padding: 0 10px;
  }
  .love {
    padding: 0 10px;
  }
  .download {
    padding: 0 10px;
  }
  .song-name {
    width: 25%;
    margin: 0 5px 0 0;
  }
  .artist {
    width: 20%;
  }
  .album {
    width: 20%;
  }
  .dt {
    width: 10%;
  }
}
</style>
