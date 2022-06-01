<template>
  <div class="home">
    <top-bar @change-fold="changeFold"/>
    <div class="content">
      <nav-list :is-fold="isFold"/>
      <div class="router-view">
        <div class="crumb-outer">
          <crumb/>
        </div>
        <router-view class="home-router"/>
      </div>
    </div>
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
  .content {
    background-color: #f5f5f5;
    border: 1px solid #e0e0e0;
    width: 100%;
    height:91vh;
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
      flex: 1;
      width: 1044px;
      height: 91vh;
      overflow-y:hidden ;
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
