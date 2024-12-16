<script setup lang="jsx">
import { ref,reactive } from "vue";
import moment from "moment";
import { getOrderListApi } from "@/api/modules/order"
import ProTable from "@/components/ProTable/index.vue";
const columns = reactive([
  {
    prop:"id",
    label:"订单ID",
    isShow:true,
    width:350,
  },
  {
    prop:"user",
    label:"用户名",
    isShow: true,
    render:(scope)=>{
      return <el-space size="large">
        {
          scope.row.user && <el-avatar src={scope.row.user.avatarUrl}/>
        }
        {
          scope.row.user && <span>{scope.row.user.userName}</span>
        }
      </el-space>
    }
  },
  {
    label:"套餐类型",
    prop:"combo",
    isShow: true,
    render:(scope)=>{
      return <el-space>
        <span>¥{scope.row.combo.price}</span>/<span>{scope.row.combo.name}</span>
      </el-space>
    }
  },
  {
    label:"状态",
    prop:"status",
    isShow:true,
    render:(scope)=>{
      const isPaid = `${scope.row.status}` === "1";
      return <el-tag type={isPaid?"success":"danger"}>
        {isPaid?'已支付':'未支付'}
      </el-tag>
    }
  },
  {
    label:"创建时间",
    prop:"createTime",
    isShow: true,
    render:(scope)=>{
      return moment(scope.row.createTime).format("YYYY-MM-DD HH:mm");
    }
  }
])
const searchParams = reactive({
  offset:0,
  limit:10,
  order:-1,
  status:-1
})
</script>

<template>
  <div class="table-box card">
    <ProTable :columns="columns"
              :init-param="searchParams"
              data-alias="order"
              :request-api="getOrderListApi"
              :pagination="true"/>
  </div>
</template>

<style scoped lang="scss">

</style>
