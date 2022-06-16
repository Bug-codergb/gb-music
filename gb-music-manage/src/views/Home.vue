<template>
  <div class="home">
    <el-container>
      <el-header>
        <top-bar @change-fold="changeFold"/>
      </el-header>
      <el-container>
        <el-aside :width="isFold?'60px':'180px'">
          <nav-list :is-fold="isFold"/>
        </el-aside>
        <el-main>
          <div class="router-view">
            <router-view class="home-router"/>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import TopBar from '../components/content/topBar/TopBar';
import NavList from '../components/content/navList/NavList';
import Crumb from "@/components/common/crumb/Crumb";
export default {
  name: 'Home',
  components: {
    NavList,
    TopBar,
    Crumb
  },
  data(){
    return {
      isFold:false
    }
  },
  methods:{
    changeFold(){
      this.isFold=!this.isFold;
    }
  }
};
</script>
<style scoped lang="less">
.home {
  .el-header, .el-footer {
    background-color: #fff;
    color: #333;
  }
  .el-aside {
    background-color: #FFF;
    color: #333;
    transition: width 0.3s;
  }
  .el-main {
    background-color: #E9EEF3;
    color: #333;
    height: 91vh;

  }
  .content {
    background-color: #f5f5f5;
    border: 1px solid #e0e0e0;
    width: 100%;
   /* height:91vh;*/
    margin: 0 auto;
    display: flex;
    box-sizing: border-box;
    padding: 5px 0;
    overflow: hidden;
    .crumb-outer{
      width: 100%;
      background-color: #fff;
      margin: 0 0 4px 0;
      padding: 4px 0 0 4px;
      border-bottom: 1px solid #e0e0e0;
      border-left: 1px solid #e0e0e0;
    }
    .router-view {
      box-sizing: border-box;
      padding: 0 0 20px 20px;
      width: 80%;
      /*height: 91vh;*/
      overflow-x: hidden;
      overflow-y:hidden ;
      background-color: #5daf34;
      .home-router{
        height: 84vh;
        overflow: hidden;
        overflow-y: scroll;
        scroller-width: thin;
        &::-webkit-scrollbar {
          width: 1px;
        }
      }
    }
  }
}
</style>
