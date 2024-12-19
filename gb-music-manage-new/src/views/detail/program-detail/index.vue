<script setup>
import { ref,reactive } from "vue"
import { useRouter,useRoute } from "vue-router"
import moment from "moment";
import {getChannelDetailApi} from "@/api/modules/channel";
import Program from "./components/Program.vue"
const route = useRoute();
const detail = ref({})
const search=async ()=>{
  const res = await getChannelDetailApi({
    id:route.params.id,
    offset:0,
    limit:30
  })
  detail.value = res;
}
search();
const activeName = ref("first")
</script>

<template>
  <div class="table-box">
    <div class="card" style="margin: 0 0 12px 0">
      <el-row :gutter="24">
        <el-col :span="4">
          <el-image :src="detail.coverUrl" style="width:140px"/>
        </el-col>
        <el-col :span="20">
          <el-form>
            <el-row>
              <el-col :span="24">
                <el-form-item label="名称：">{{detail.name}}</el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                <el-form-item label="创建时间：">{{moment(detail.createTime).format("yyyy-MM-DD HH:mm")}}</el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="创建人：">{{detail?.user?.userName}}</el-form-item>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="24">
                <el-form-item label="简介：">{{detail.description}}</el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-col>
      </el-row>
    </div>
    <div class="card table-box">
      <el-tabs v-model="activeName">
        <el-tab-pane label="声音列表" name="first">
          <Program v-if="detail && detail.programs" :program="detail.programs" @success="search"/>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<style scoped lang="scss">

</style>
