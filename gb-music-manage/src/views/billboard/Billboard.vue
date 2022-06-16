<template>
  <div class="billboard">
    <div class="left">
      <div class="top">
        <Order />
      </div>
      <div class="center">
        <channel />
      </div>
      <div class="bottom">
        <album />
      </div>
    </div>
    <div class="center">
      <div class="top">
        <MV />
      </div>
      <div class="center">
        <line-user />
      </div>
      <div class="bottom">
        <System />
      </div>
    </div>
    <div class="right">
      <div class="top">
        <PlayList />
      </div>
      <div class="center">
        <Video />
      </div>
      <div class="bottom">
        <Artist />
      </div>
    </div>
  </div>
</template>

<script>
import Album from '@/views/billboard/childCpn/album/Album';
import Artist from '@/views/billboard/childCpn/artist/Artist';
import Channel from '@/views/billboard/childCpn/channel/Channel';
import Video from '@/views/billboard/childCpn/video/Video';
import PlayList from '@/views/billboard/childCpn/playlist/Playlist';
import Order from '@/views/billboard/childCpn/order/Order';
import System from '@/views/billboard/childCpn/system/System';
import MV from '@/views/billboard/childCpn/mv/MV';
import LineUser from '@/views/billboard/childCpn/lineUser/LineUser';
export default {
  name: 'Billboard',
  components: {
    LineUser,
    System,
    Order,
    Channel,
    Artist,
    Album,
    Video,
    PlayList,
    MV
  }
};
</script>

<style scoped lang="less">
.billboard {
  width: 100%;
  background-color:#e9eef3;
  display: flex;
  overflow: scroll;
  .left {
    width: 33%;
    height: 100%;
  }
  & > .center {
    width: 33%;
    height: 645px;
    margin: 0 10px;
  }
  .right {
    width: 33%;
    height: 645px;
  }
  & > .left,
  & > .center,
  & > .right {
    display: flex;
    flex-direction: column-reverse;
    .top,
    .center,
    .bottom {
      flex: 1;
      background-color: rgba(0, 134, 179, 0.2);
      border-radius: 4px;
    }
    .center {
      margin: 10px 0;
    }
  }
}
</style>
