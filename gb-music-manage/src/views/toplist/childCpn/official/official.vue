<template>
  <div class="official">
    <p class="title">官方榜</p>
    <ul class="official-list">
      <li v-for="(item, index) in official" :key="item.id">
        <div class="img-container" @click="detailRouter(item)"
             v-lazy-container="{selector:'img',
                                loading:require('../../../../assets/img/holder/music-placeholder.png'),
                                error:require('../../../../assets/img/holder/music-placeholder.png')
                              }">
          <img :data-src="item.coverUrl" :alt="item.name" />
        </div>
        <div class="name" @click="detailRouter(item)">{{ item.name }}</div>
        <user-msg :avatar-url="item.user.avatarUrl" :user-name="item.user.userName" />
        <div class="time">
          <span>创建于:</span>
          <span>{{ formatTime(item.createTime, 'yyyy-MM-dd') }}</span>
        </div>
        <div class="control-btn">
          <button @click="deleteTop">删除</button>
          <button @click="detailRouter(item)">查看</button>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import { deleteToplist, getOfficialTop } from "@/network/toplist";
import MsgItem from '@/components/common/msgItem/MsgItem';
import UserMsg from '@/components/common/userMsg/UserMsg';
import { formatTime } from '@/utils/format';

export default {
  name: 'official',
  components: { UserMsg, MsgItem },
  data() {
    return {
      official: []
    };
  },
  created() {
    getOfficialTop().then((data) => {
      this.official = data;
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
.official {
  .title {
    padding: 15px 0 0 15px;
    font-weight: bolder;
  }
  .official-list {
    margin: 20px 0;
    li {
      display: flex;
      align-items: center;
      padding: 10px 0 10px 15px;
      .img-container {
        width: 70px;
        margin: 0 15px 0 0;
        img {
          border-radius: 5px;
          width: 100%;
        }
      }
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      .name {
        font-size: 15px;
        padding: 0 30px 0 0;
        color: #656565;
      }
      .time {
        margin: 0 0 0 10px;
        width: 15%;
        span {
          font-size: 12px;
        }
      }

      .control-btn {
        margin: 0 0 0 50px;
        button {
          margin: 0 15px 0 0;
          cursor: pointer;
          background-color: #a0cfff;
          color: #fff;
          font-size: 13px;
          padding: 5px 15px;
          border-radius: 4px;
        }
      }
    }
  }
}
</style>
