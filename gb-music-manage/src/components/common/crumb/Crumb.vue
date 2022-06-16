<template>
  <div class="crumb">
    <ul class="nav-list">
      <li v-for="(item,index) in navList"
          :key="item.name"
          @click="navRouter(item)"
          :class="{active:isActive(item)}">
        <span>{{item.name}}</span>
        <i class="el-icon-close" @click.stop="cancel(item,index)"></i>
      </li>
    </ul>
    <el-dropdown @command="handleCommand" trigger="click">
      <span class="el-dropdown-link">
        <i class="el-icon-arrow-down el-icon--right"></i>
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item command="left">关闭左侧</el-dropdown-item>
        <el-dropdown-item command="right">关闭右侧</el-dropdown-item>
        <el-dropdown-item command="other">关闭其它</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
import {menu} from "@/constant/menu";

export default {
  name: "Crumb",
  data(){
    return {
      navList:[],
    }
  },
  watch:{
    '$route.path':{
      handler(newVal){
        const isExists=this.navList.findIndex((item)=>{
          return item.path===newVal
        })
        if(isExists===-1){
          this.navList.push({
            name:this.$route.meta.title,
            path:this.$route.path,
            query:this.$route.query
          })
        }
      }
    }
  },
  mounted() {
    this.navList.push({
      name:this.$route.meta.title,
      path:this.$route.path,
      query:this.$route.query
    })
  },
  methods:{
    isActive(item){
      return item.path===this.$route.path
    },
    navRouter(item){
      this.$router.push({
        path:item.path,
        query:item.query
      })

    },
    cancel(item,index){
      if(this.navList.length<2){
        return;
      }else{
        this.$delete(this.navList,index);
        if(item.path===this.$route.path){
          this.$router.push({
            path:this.navList[0].path
          })
        }
      }
    },
    handleCommand(e){
      const currentNav=this.navList.find((item)=>{
        return item.path===this.$route.path;
      })
      const index=this.navList.findIndex((item)=>{
        return item.path===this.$route.path;
      })
      if(e==='left'){
        for(let i=0;i<index;i++){
          this.navList.shift();
        }
      }else if(e==='right'){
        let len=this.navList.length;
        for(let i=index;i<len-1;i++){
          this.navList.pop();
        }
      }else if(e==='other'){
         this.navList=[currentNav]
      }
    }
  }
}
</script>

<style scoped lang="less">
  .crumb{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 5px 0 0;
    .nav-list{
      display: flex;
      flex-wrap: nowrap;
      padding: 0;
      margin: 0 5px 0 0;
      &>li{
        margin: 0 5px 5px 0;
        background-color: rgba(245, 108, 108,.15);
        color: #ec4141;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 3px;
        white-space: nowrap;
        &.active{
          background-color: rgba(245, 108, 108,.7);
          color: #fff;
        }
        &>span{
          font-size: 13px;
        }
        &>i{
          margin: 0 0 0 3px;
          cursor: pointer;
        }
      }
    }
    .el-icon-arrow-down{
      font-weight: bolder;
    }
  }
</style>
