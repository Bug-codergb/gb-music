<template>
  <div class="hot-toplist">
    <p class="title">热门榜单</p>
    <ul>
      <li v-for="(item, index) in hotToplist" :key="item.id">
        <div class="img-container" @click="detailRouter(item)"
             v-lazy-container="{selector:'img',
                                loading:require('../../../../assets/img/holder/music-placeholder.png'),
                                error:require('../../../../assets/img/holder/music-placeholder.png')
                                }">
          <img :data-src="item.coverUrl" alt="" />
        </div>
        <div class="msg">
          <div class="title">{{ item.name }}</div>
          <user-msg :avatar-url="item.user.avatarUrl" :user-name="item.user.userName" />
          <div class="time">
            <span>创建于:</span>
            <span>{{ formatTime(item.createTime, 'yyyy-MM-dd') }}</span>
          </div>
          <button class="control-btn" @click="deleteTop(item, index)">删除</button>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import { deleteToplist, getHotToplist } from '@/network/toplist';
import UserMsg from '@/components/common/userMsg/UserMsg';
import { formatTime } from '@/utils/format';

export default {
  name: 'HotToplist',
  components: { UserMsg },
  data() {
    return {
      hotToplist: []
    };
  },
  created() {
    getHotToplist().then((data) => {
      this.hotToplist = data;
    });
  },
  methods: {
    formatTime(time, ft) {
      return formatTime(time, ft);
    },
    detailRouter(item) {
      this.$router.push({
        path: '/Home/toplistDetail',
        query: {
          id: item.id
        }
      });
    },
    deleteTop(item, index) {
      this.$confirm('确认删除该排行榜?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          deleteToplist(item.id).then((data) => {
            console.log(data);
            this.$delete(this.hotToplist, index);
          });
        })
        .catch(() => {});
    }
  }
};
</script>

<style scoped lang="less">
.hot-toplist {
  padding: 0 0 0 15px;
  .title {
    font-weight: bolder;
    margin: 20px 0;
  }
  & > ul {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    & > li {
      display: flex;
      margin: 0 0 24px 0;
      width: 50%;
      .img-container {
        width: 130px;
        height: 130px;
        overflow: hidden;
        border-radius: 5px;
        img {
          width: 100%;
        }
      }
      .msg {
        margin: 0 0 0 20px;
        .title {
          font-size: 16px;
          font-weight: bold;
          margin: 0 0 10px 0;
        }
        .time {
          margin: 10px 0;
          span {
            font-size: 13px;
          }
        }
        .control-btn {
          background-color: #a0cfff;
          color: #fff;
          font-size: 13px;
          padding: 3px 15px;
          border-radius: 3px;
        }
      }
    }
  }
}
</style>
