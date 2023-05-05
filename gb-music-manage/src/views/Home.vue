<template>
  <div class="home">
    <el-container>
      <el-header>
        <top-bar @change-fold="changeFold"/>
      </el-header>
      <el-container>
        <el-aside :width="isFold?'60px':'180px'" class="ln-music">
          <nav-list :is-fold="isFold"/>
        </el-aside>
        <el-main>
          <router-view/>
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
.ln-music{
  background-color: #0c2135;
}
.home {
  .el-header, .el-footer {
    background-color: #fff;
    color: #333;
  }
  .el-aside {
    color: #333;
    transition: width 0.3s;
  }
  .el-main {
    background-color: #E9EEF3;
    color: #333;
    height: 91vh;
    padding: 15px;
  }
  .content {
    background-color: #f5f5f5;
    border: 1px solid #e0e0e0;
    width: 100%;
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
  }
}
</style>
