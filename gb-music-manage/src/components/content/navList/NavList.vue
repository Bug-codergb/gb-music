<template>
  <div class="nav-list">
        <el-menu
          :default-active="currentNav"
          class="el-menu-vertical-demo"
          background-color="#0c2135"
          text-color="#b7bdc3"
          active-text-color="#0a60bd"
          :unique-opened="true"
          :collapse="isFold"
        >
          <el-submenu
            v-for="(item, index) in menu"
            :key="item.path"
            :index="item.index"
            active-text-color="#EC4141">
            <template slot="title">
              <i :class="item.icon" class="gb-music-icon"></i>
              <span slot="title">{{ item.name }}</span>
            </template>
            <el-menu-item
              v-for="(it, i) in item.children"
              :key="it.path"
              @click="routeClick(it)"
              :index="it.index"
            >
              <span slot="title">{{ it.name }}</span>
            </el-menu-item>
          </el-submenu>
        </el-menu>
  </div>
</template>

<script>
import { menu } from '@/constant/menu';
export default {
  name: 'NavList',
  data() {
    return {
      currentIndex: 0,
      menu: menu,
      navIndex:"11"
    };
  },
  props:{
    isFold:{
      type:Boolean,
      default:false
    }
  },
  computed:{
    currentNav(){
      for(let item of menu){
        for(let sub of item.children){
          if(sub.path===this.$route.path){
            this.navIndex=sub.index;
            return sub.index;
          }
        }
      }
      return this.navIndex
    }
  },
  methods: {
    routeClick(item) {
      this.$router.push({
        path: item.path
      });
    }
  }
};
</script>

<style scoped lang="less">
.nav-list {
  .gb-music-icon {
    font-size: 22px;
    margin: 0 10px 0 0;
    color:#b7bdc3;
  }
  .icon-shujukanban {
    font-size: 21px;
  }
  .icon-shuffling-banner {
    font-size: 28px;
  }
  .el-menu-item.is-active {
    color: #fff !important;
    background-color: #a0cfff !important;
    width: 100% !important;
  }
  .el-menu{
    border-right: none;
  }
}
</style>
<style>
.el-menu-item {
  padding-left: 50px !important;
}
/*.el-submenu__title {
  display: flex;
  align-items: center;
  padding: 18px 0 18px 20px !important;
}

.el-submenu .el-menu-item {
  height: 50px;
  line-height: 50px;
  padding: 0 75px;
  min-width: 180px !important;
}
.el-col-400 {
  min-width: 180px !important;
}
.el-menu{
  border-right: solid 1px #fff!important;
}*/
</style>
