<template>
  <div>
    <ul slot="0" v-if="albumDetail.songs" class="song-list">
      <li v-for="(item, index) in albumDetail.songs" :key="item.id">
        <ListInfo>
          <span slot="index">{{ (index + 1).toString().padStart(2, '0') }}</span>
          <div slot="state" class="text-nowrap">{{ item.name }}</div>
          <span slot="creator">{{ albumDetail.artist.name }}</span>
          <div slot="time" class="text-nowrap">{{ albumDetail.name }}</div>
          <span slot="duration">{{ formatTime(item.dt, 'mm:ss') }}</span>
          <span slot="operate" class="song-list-operate" @click="delSong(item, index)">
            <button>删除</button>
          </span>
        </ListInfo>
      </li>
    </ul>
  </div>
</template>

<script>
import ListInfo from '../../../../../common/listInfo/ListInfo';
import { formatTime } from '../../../../../../utils/format';
import { delAlbumSong } from '@/network/album';
export default {
  name: 'SongList',
  components: {
    ListInfo
  },
  props: {
    albumDetail: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  methods: {
    formatTime(time, ft) {
      return formatTime(time, ft);
    },
    delSong(item, index) {
      const flag = confirm('确认永久删除?');
      if (flag) {
        delAlbumSong(item.id, this.albumDetail.id).then((data) => {
          if (data) {
            this.$delete(this.albumDetail.songs, index);
            this.$toast.show('删除成功', 1200);
          }
        });
      }
    }
  }
};
</script>

<style scoped lang="less">
.song-list {
  li {
    padding: 10px 0;
    &:nth-child(odd) {
      background-color: #f9f9f9;
    }
    .song-list-operate {
      button {
        font-size: 13px;
        padding: 3px 15px;
        cursor: pointer;
      }
    }
  }
}
</style>
