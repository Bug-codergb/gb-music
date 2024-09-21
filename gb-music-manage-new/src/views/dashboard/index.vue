<script setup>
import Album from './components/album/Album';
import Artist from './components/artist/Artist';
import Channel from './components/channel/Channel';
import Video from './components/video/Video';
import PlayList from './components/playlist/Playlist';
import Order from './components/order/Order';
import System from './components/system/System';
import MV from './components/mv/MV';
import LineUser from './components/lineUser/LineUser';
</script>

<template>
  <div class="table-box chart-container">
    <div class="row">
      <div class="col">
        <div class="card">
          <Album/>
        </div>
      </div>
      <div class="col center">
        <div class="card">
<!--          <System/>-->
        </div>
      </div>
      <div class="col">
        <div class="card">
          <Artist/>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div class="card">
          <Channel/>
        </div>
      </div>
      <div class="col center">
        <div class="card"></div>
      </div>
      <div class="col">
        <div class="card">
          <Video/>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div class="card">
          <Order/>
        </div>
      </div>
      <div class="col center">
        <div class="card">
          <MV/>
        </div>
      </div>
      <div class="col">
        <div class="card">
          <PlayList/>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
  .chart-container{
    display: flex;
    flex-direction: column;
    width:100%;
    height: 100%;
    .card{
      padding:8px;
    }
    .row{
      flex:1;
      display: flex;
      height: 33.3%;
      .center{
        margin:0 12px
      }
      .col{
        height: 100%;
        flex:1;
        width:33.3%
      }
      .card{
        width: 100%;
        height: 100%;
      }
      &:nth-child(2){
        margin:12px 0;
      }
    }
  }
</style>
