<template>
  <div class="toplist-outer">
    <div class="head">
      <div class="img-container">
        <img :src="toplist.coverUrl" :alt="toplist.name" />
      </div>
      <div class="msg">
        <div class="title">{{ toplist.name }}</div>
        <div class="user">
          <UserMsg
            item-width="20px"
            :user-name="toplist.user.userName"
            :avatar-url="toplist.user.avatarUrl"
          />
          <div class="create-time" v-if="toplist.createTime">
            {{ (toplist.createTime, 'yyyy-MM-dd' | timeFormat) }}
          </div>
        </div>
        <div class="play-count">播放量: {{ toplist.playCount }}</div>
        <div class="count">歌曲数:{{ toplist.songs.length }}</div>
      </div>
    </div>
    <div class="content-body">
      <TabControl :list="['歌曲']">
        <template v-slot:0>
          <SongList :songs="toplist.songs" :tId="toplist.id" v-if="toplist.songs.length" />
        </template>
      </TabControl>
    </div>
  </div>
</template>

<script>
import { getToplistDetail } from '@/network/toplist';
import UserMsg from '@/components/common/userMsg/UserMsg';
import format from '@/utils/filter';
import TabControl from '@/components/common/tabControl/TabControl';
import SongList from './childCpn/songList/SongList';
export default {
  name: 'ToplistDetail',
  components: { SongList, TabControl, UserMsg },
  data() {
    return {
      id: '',
      toplist: {
        user: {},
        songs: []
      }
    };
  },
  filters: format,
  created() {
    this.id = this.$route.query.id;
    getToplistDetail(this.id).then((data) => {
      this.toplist = data;
    });
  }
};
</script>

<style scoped lang="less">
.toplist-outer {
  background-color: #fff;
  padding: 20px;
}
.head {
  display: flex;
  .img-container {
    width: 150px;
    overflow: hidden;
    img {
      border-radius: 5px;
      width: 100%;
    }
  }
  .msg {
    margin: 0 0 0 20px;
    .title {
      font-size: 20px;
      font-weight: bold;
    }
    .user {
      display: flex;
      align-items: center;
      margin: 10px 0 0 0;
      .create-time {
        margin: 0 0 0 10px;
      }
    }
    .play-count {
      margin: 15px 0;
    }
  }
}
</style>
