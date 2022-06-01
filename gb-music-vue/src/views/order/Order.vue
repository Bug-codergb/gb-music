<template>
  <div class="order-list-outer">
    <div class="header-controller">
      <el-select v-model="order" @change="orderChange" placeholder="请选择套餐类型">
        <el-option label="全部" :value="-1"></el-option>
        <el-option v-for="(item,index) in orderType" :key="item.id"
                   :label="item.name"
                   :value="item.id"></el-option>
      </el-select>
      <el-select v-model="status" @change="statusChange" placeholder="请选择订单状态">
        <el-option label="全部" :value="-1"></el-option>
        <el-option v-for="(item,index) in statusList" :key="item.id"
                   :label="item.name"
                   :value="item.id"></el-option>
      </el-select>
    </div>
    <ul class="order-list">
      <li v-for="(item,index) in orderList" :key="item.id">
        <div class="index">{{(index+1).toString().padStart(2,"0")}}</div>
        <div class="name">{{item.combo.name}}</div>
        <div class="price">￥{{item.combo.price}}</div>
        <div class="creator">{{item.user.userName}}</div>
        <div class="create-time" v-format="'yyyy-MM-dd hh:mm'">{{item.createTime}}</div>
        <div class="order-status">
          <div class="circle" :class="{active:item.status===0}"></div>
          <div class="status">
            {{item.status===1?'已完成':'未完成'}}
          </div>
        </div>
        <div class="control-btn">
          <button class="del">删除</button>
        </div>
      </li>
      <li class="empty" v-if="count<1">
        <el-empty description="暂无订单"/>
      </li>
    </ul>
    <div class="page" v-if="count>10">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="count"
        :page-size="10"
        @current-change="pageChange"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { getAllCombo, getAllOrder } from "@/network/order";

export default {
  name: "Order",
  data(){
    return {
      orderList:[],
      count:0,
      orderType:[],
      statusList:[
        {id:'0',name:"未完成"},
        {id:'1',name:"已完成"}
      ],
      status:-1,
      order:-1
    }
  },
  created() {
    getAllOrder(this.order,this.status,0,10).then(data=>{
      this.orderList=data.order;
      this.count=data.count;
    })
    getAllCombo().then(data=>{
      this.orderType=data;
    })
  },
  methods:{
    orderChange(){
      getAllOrder(this.order,this.status,0,10).then(data=>{
        this.orderList=data.order;
        this.count=data.count;
      })
    },
    statusChange(){
      getAllOrder(this.order,this.status,0,10).then(data=>{
        this.orderList=data.order;
        this.count=data.count;
      })
    },
    pageChange(e){
      getAllOrder(this.order,this.status,(e-1)*10,10).then(data=>{
        this.orderList=data.order;
        this.count=data.count;
      })
    }
  }
}
</script>
<style lang="less">
  .order-list-outer{
    .el-select{
      margin: 0 15px 0 0;
    }
  }
</style>
<style scoped lang="less">
  .order-list-outer{
    background-color: #fff;
    padding: 20px;
    .header-controller{
      border-bottom: 1px solid #dcdfe6;
      padding: 0 0 15px 0;
    }
    .order-list{
      margin: 10px 0 0 0;
      &>li{
        display: flex;
        align-items: center;
        padding: 10px;
        &:nth-child(odd){
          background-color: #f9f9f9;
        }
        .index{
          font-size: 13px;
          color: #9b9b9b;
          width: 5%;
        }
        .name{
          font-size: 14px;
          color: #0077aa;
          width: 15%;
        }
        .price{
          color: #f56c6c;
          font-size: 14px;
          width: 15%;
        }
        .creator{
          font-size: 14px;
          color: #0077aa;
          width: 10%;
        }
        .create-time{
          font-size: 14px;
          color: #ccc;
          width: 15%;
        }
        .order-status{
          display: flex;
          width: 15%;
          align-items: center;
          .circle{
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: #5daf34;
          }
          .active{
            background-color: #ec4141!important;
          }
          .status{
            margin: 0 0 0 5px;
            color: #656565;
          }
        }
        .control-btn{
          .del{
            cursor: pointer;
            background-color: #f56c6c;
            color: #fff;
            padding: 5px 15px;
            border-radius: 4px;
            font-size: 13px;
          }
        }
        &.empty{
          background-color: #fff;
          display: flex;
          align-content: center;
          justify-content: center;
          padding: 100px 0 0 0;
        }
      }
    }
    .page{
      display: flex;
      justify-content: center;
      padding: 10px 0;
    }
  }
</style>
