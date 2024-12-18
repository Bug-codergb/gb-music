<template>
  <div class="line-count">
    <div class="count">
      <div class="key">官方榜单:</div>
      <div class="value">{{ official }}</div>
    </div>
    <div class="count">
      <div class="key">热门榜单:</div>
      <div class="value">{{ hot }}</div>
    </div>
  </div>
</template>

<script>
//import { WS_HOST_NAME } from '@/constant/host';
//import { getLineCount } from '@/network/user';
import {getToplistTypeCount} from "@/api/modules/toplist"
export default {
  name: 'LineUser',
  data() {
    return {
      official: 0,
      hot:0
    };
  },
  mounted() {
    getToplistTypeCount().then((res)=>{
      if(res){
        for(let item of res){
          if(`${item.type}` === '1'){
            this.official = item.count;
          }
          if(`${item.type}` === '0'){
            this.hot = item.count;
          }
        }
      }
    })
  }
};
</script>

<style scoped lang="scss">
.line-count {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  flex-direction: column;
  .count {
    display: flex;
    align-items: center;
    .key {
      font-size: 20px;
      font-weight: bolder;
    }
    .value {
      font-size: 36px;
      font-weight: bolder;
      color: #5470c6;
      margin: 0 0 0 20px;
    }
  }
}
</style>
