<template>
  <div class="artist-list">
    <div class="cate-list-outer">
      <ul class="cate-list">
        <li>类别:</li>
        <li
          v-for="(item, index) in cateList"
          :key="item.id"
          :class="{ active: currentIndex === index }"
          @click="liCLick(item, index)"
        >
          {{ item.name }}
        </li>
      </ul>
      <div class="search-outer">
        <el-input
          placeholder="请输入歌手名称"
          suffix-icon="el-icon-search"
          style="width: 240px"
          @input="inpChange"
          v-model.trim="keyword"
        >
        </el-input>
      </div>
    </div>
    <ul class="artists">
      <li v-for="(item, index) in artists" :key="item.id">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="artist-img-container"
             v-lazy-container="{selector:'.artist-avatar',
                                error:require('../../../../assets/img/holder/music-placeholder.png'),
                                loading:require('../../../../assets/img/holder/music-placeholder.png')}">
          <img class="artist-avatar" :data-src="item.avatarUrl" alt="" />
        </div>
        <div class="artist-state">{{ item.name }}</div>

        <div class="type-cate">
          <!--cate-->
          <label>
            <select class="types" v-model="item.area" @change="cateChange($event, item, index)">
              <option v-for="(item, index) in cateList" :key="item.id" :value="item.id">
                {{ item.name }}
              </option>
            </select>
          </label>
          <!--type-->
          <label>
            <select class="types" @change="typeChange($event, item, index)" v-model="item.type">
              <option v-for="(item, index) in types" :key="item.id" :value="item.id">
                {{ item.name }}
              </option>
            </select>
          </label>
        </div>
        <div class="count-data">
          <div class="album-count"><span>专辑数 :</span>{{ item.album }}</div>
          <div class="song-count"><span>歌曲数 :</span>{{ item.song }}</div>
        </div>
        <button class="del-btn" @click="delArtist(item, index)">移除</button>
        <button class="checkout" @click="checkout(item, index)">查看</button>
        <button class="edit" @click="edit(item, index)">编辑</button>
      </li>
    </ul>
    <div v-if="artists.length === 0" class="empty">
      <el-empty description="暂无歌手"></el-empty>
    </div>
    <!--分页-->
    <div class="page" v-if="count > 8">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="count"
        :page-size="8"
        @current-change="pageChange"
      >
      </el-pagination>
    </div>
    <el-drawer
      title="编辑歌手信息"
      :visible.sync="drawer"
      :direction="direction"
      :destroy-on-close="true"
      :show-close="false"
    >
      <template v-slot:title>
        <div class="title-control">
          <div class="title">编辑歌手信息</div>
          <div class="define" @click="define">确定</div>
        </div>
      </template>
      <artist-edit :artist="artistItem" ref="artistEdit" />
    </el-drawer>
  </div>
</template>

<script>
import {
  delArtist,
  getAllArtist,
  getArtistCate,
  getArtistType,
  getCateArtistDetail,
  setArtistCate,
  setArtistType,
  updateArtist
} from '../../../../network/artist';
import MsgItem from '../../../../components/common/msgItem/MsgItem';
import { debounce } from '@/utils/debounce';
import ArtistEdit from '@/views/artist/childCpn/artistEdit/ArtistEdit';

export default {
  name: 'ArtistList',
  components: { ArtistEdit, MsgItem },
  data() {
    return {
      artists: [],
      cateList: [],
      cateArtist: [],
      currentIndex: 0,
      types: [],
      count: 0,
      cateId: '',
      keyword: '',
      drawer: false,
      direction: 'rtl',
      artistItem: {},
      arId: ''
    };
  },
  created() {
    this.init();
  },
  methods: {
    init(){
      getArtistCate().then((data) => {
        this.cateList = data;
        this.liCLick(data[0], 0);
        getCateArtistDetail(data[0].id, '全部', '', 0, 8).then((data) => {
          //console.log(data);
        });
      });
      getArtistType().then((data) => {
        this.types = data;
      });
    },
    liCLick(item, index) {
      this.currentIndex = index;
      this.cateId = item.id;
      getCateArtistDetail(item.id, '全部', this.keyword).then((data) => {
        this.artists = data.artists;
        this.count = data.count;
      });
    },
    inpChange: debounce(
      function () {
        getCateArtistDetail(this.cateId, '全部', this.keyword, 0, 8).then((data) => {
          this.artists = data.artists;
          this.count = data.count;
        });
      },
      1000,
      false
    ),
    delArtist(item, index) {
      this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        delArtist(item.id).then((data) => {
          this.$toast.show('删除成功');
          this.$delete(this.artists, index);
        });
      }).catch(() => {

      });
    },
    checkout(item, index) {
      this.$router.push({
        path: '/Home/artistDetail',
        query: {
          id: item.id
        }
      });
    },
    cateChange(e, item, index) {
      setArtistCate(item.id, e.currentTarget.value).then((data) => {
        getCateArtistDetail(this.cateId, '全部', this.keyword).then((data) => {
          this.artists = data.artists;
          this.count = data.count;
        });
      });
    },
    typeChange(e, item, index) {
      setArtistType(item.id, e.currentTarget.value).then((data) => {});
    },
    pageChange(e) {
      getCateArtistDetail(this.cateId, '全部', this.keyword, (e - 1) * 8, 8).then((data) => {
        this.artists = data.artists;
        this.count = data.count;
      });
    },
    edit(item) {
      this.artistItem = item;
      this.drawer = true;
      this.arId = item.id;
    },
    define() {
      const name = this.$refs.artistEdit.name;
      const desc = this.$refs.artistEdit.desc;
      updateArtist(this.arId, name, desc).then((data) => {
        this.drawer = false;
        getCateArtistDetail(this.cateId, '全部', this.keyword, 0, 8).then((data) => {
          this.artists = data.artists;
          this.count = data.count;
        });
        this.$message({
          message: '修改成功',
          type: 'success'
        });
      });
    }
  }
};
</script>

<style scoped lang="less">
.artist-list {
  padding: 0 0 10px 0;
  .page {
    width: 45%;
    margin: 0 auto;
  }
}
.cate-list-outer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
/*分类信息*/
.cate-list {
  margin: 20px 0 15px 0;
  display: flex;
  flex-wrap: wrap;
  li {
    margin: 0 20px 5px 0;
    font-size: 13px;
    padding: 3px 10px;
    cursor: pointer;
    border-radius: 10px;
    &.active {
      background-color: #fdf5f5;
      color: #ec4141;
    }
  }
}
.search-outer {
  display: flex;
  justify-content: flex-end;
  padding: 0 10px 0 0;
  align-items: center;
}
.artists {
  li {
    display: flex;
    flex-wrap: wrap;
    padding: 10px 0 10px 5px;
    align-items: center;
    .index {
      padding: 0 10px;
      color: #cacaca;
    }
    &:nth-child(odd) {
      background-color: #f9f9f9;
    }
  }
  .artist-img-container {
    height: 45px;
    width: 45px;
    img {
      width: 45px;
      border-radius: 3px;
    }
  }
  .artist-state {
    font-size: 13px;
    margin: 0 0 0 20px;
    color: #656565;
    width: 15%;
  }
  .type-cate {
    width: 28%;
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
  }
  .types {
    border: 1px solid #f27a7a;
    outline: none;
    font-size: 12px;
    padding: 4px 0;
    margin: 0 20px 0 0;
    border-radius: 3px;
    option {
      font-size: 12px;
    }
  }
  .count-data {
    display: flex;
    align-items: center;
    width: 20%;
    .album-count,
    .song-count {
      color: #656565;
      margin: 0 20px 0 0;
      & > span {
        color: #9b9b9b;
        font-size: 13px;
      }
    }
  }
  .del-btn,
  .checkout,
  .edit {
    padding: 4px 18px;
    background-color: #f27a7a;
    color: #fff;
    font-size: 12px;
    margin: 0 10px 0 0;
    cursor: pointer;
    border-radius: 3px;
  }
}
.empty {
  padding: 150px 0 0 0;
}
.title-control {
  display: flex;
  justify-content: space-between;
  .define {
    background-color: #f56c6c;
    color: #fff;
    border-radius: 4px;
    padding: 5px 15px;
    cursor: pointer;
  }
}
</style>
