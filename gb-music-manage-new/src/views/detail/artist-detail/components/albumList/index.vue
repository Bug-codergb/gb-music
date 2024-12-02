<script setup lang="jsx">
import { ref,reactive } from "vue"
import {useRoute,useRouter} from "vue-router"
import moment from "moment"
import { getArtistAlbumApi } from "@/api/modules/album"
import ProTable from "@/components/ProTable/index.vue"
const route = useRoute();
const searchParams = reactive({
  arId:route.params.id
})
const columns = reactive([
  {
    label:"封面",
    prop:"coverUrl",
    isShow:true,
    render:(scope)=>{
      return <el-image src={scope.row.coverUrl}
                       preview-teleported={true}
                       preview-src-list={[scope.row.coverUrl]} style={{width:"90px"}}/>
    }
  },
  {
    label:"名称",
    prop:"name",
    isShow:true
  },
  {
    label:"发布时间",
    prop:"publishTime",
    isShow:true,
    render:(scope)=>{
      return moment(scope.row.publishTime).format("yyyy-MM-DD")
    }
  },
  {
    label:"分类",
    prop:"name",
    isShow:true
  },
  {
    label:"简介",
    prop:"description",
    isShow:true,
    render:(scope)=>{
      return <el-tooltip content={scope.row.description} placement="top" show-after={500}>
        <span class="mle">{scope.row.description}</span>
      </el-tooltip>
    }
  },
  {
    label:"操作",
    prop:"action",
    isShow:true,
    render:(scope)=>{
      return <el-link  type="primary" onClick={()=>handleCheck(scope.row)}>查看</el-link>
    }
  }
])
const router = useRouter();
const handleCheck=(item)=>{
  router.push({
    path:`/album/${item.id}`
  })
}
</script>

<template>
  <div class="table-box">
    <ProTable data-alias="albums" :columns="columns" :request-api="getArtistAlbumApi" :pagination="true" :init-param="searchParams"/>
  </div>
</template>

<style scoped lang="scss">

</style>
