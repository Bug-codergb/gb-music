<template>
  <div class="user">
    <UserHeader />
    <div class="header-controller">
      <el-input v-model="keyword" placeholder="请输入用户名称" clearable @input="inpSearch" />
      <el-select v-model="isVip" @change="vipChange">
        <el-option label="全部" :value="-1"></el-option>
        <el-option label="vip用户" :value="1"></el-option>
        <el-option label="非vip用户" :value="0"></el-option>
      </el-select>
      <el-select v-model="isManage" @change="manageChange">
        <el-option label="全部" :value="-1"></el-option>
        <el-option label="管理员" :value="1"></el-option>
        <el-option label="普通用户" :value="0"></el-option>
      </el-select>
    </div>
    <ul class="user-list">
      <li v-for="(item, index) in userList" :key="item.id">
        <div class="index">{{ (index + 1).toString().padStart(2, '0') }}</div>
        <div class="user-name">{{ item.userName }}</div>
        <div class="create-time" v-format="'yyyy-MM-dd hh:mm'">{{ item.createTime }}</div>
        <div class="auth" :class="{ active: item.auth === 1 }">
          {{ item.auth === 1 ? '会员' : '非会员' }}
        </div>
        <div class="expire-time" v-format="'yyyy-MM-dd'" :class="{ active: item.auth === 1 }">
          {{ item.auth === 1 ? item.expireTime : '0000000' }}
        </div>
        <div class="manage">
          {{ item.manage === 1 ? '管理员' : '普通用户' }}
        </div>
        <div class="playlist">
          <span>歌单数：</span>
          <span>{{ item.playlist }}</span>
        </div>
        <div class="channel">
          <span>声音作品：</span>
          <span>{{ item.channel }}</span>
        </div>
        <div class="moment">
          <span>动态：</span>
          <span>{{ item.moment }}</span>
        </div>
        <div class="control-btn">
          <button @click="editUser(item, index)">编辑</button>
          <button @click="deleteUser(item, index)">删除</button>
        </div>
      </li>
    </ul>
    <div class="page" v-if="total > 10">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="total"
        :page-size="10"
        @current-change="pageChange"
      >
      </el-pagination>
    </div>
    <el-drawer title="专辑信息" :visible.sync="drawer" :destroy-on-close="true" :show-close="false">
      <template v-slot:title>
        <div class="title-control">
          <div class="title">编辑用户信息</div>
          <div class="define" @click="define">确定</div>
        </div>
      </template>
      <edit-user v-if="drawer" :user="user" ref="editUser" />
    </el-drawer>
  </div>
</template>

<script>
import UserHeader from '@/views/user/childCpn/UserHeader';
import { deleteUser, deleteUserRequest, getUserList, updateUserMsg } from '@/network/user';
import { debounce } from '@/utils/debounce';
import EditUser from '@/views/user/childCpn/EditUser';
export default {
  name: 'User',
  components: { EditUser, UserHeader },
  data() {
    return {
      keyword: '',
      isVip: -1,
      isManage: -1,
      total: 0,
      userList: [],
      drawer: false,
      user: {}
    };
  },
  created() {
    getUserList(this.isVip, this.isManage, this.keyword, '0', '10').then((data) => {
      this.total = data.count;
      this.userList = data.user;
    });
  },
  methods: {
    pageChange(e) {
      getUserList(this.isVip, this.isManage, this.keyword, `${(e - 1) * 10}`, '10').then((data) => {
        this.total = data.count;
        this.userList = data.user;
      });
    },
    inpSearch: debounce(
      function () {
        getUserList(this.isVip, this.isManage, this.keyword, '0', '10').then((data) => {
          this.total = data.count;
          this.userList = data.user;
        });
      },
      1000,
      false
    ),
    vipChange() {
      getUserList(this.isVip, this.isManage, this.keyword, '0', '10').then((data) => {
        this.total = data.count;
        this.userList = data.user;
      });
    },
    manageChange() {
      getUserList(this.isVip, this.isManage, this.keyword, '0', '10').then((data) => {
        this.total = data.count;
        this.userList = data.user;
      });
    },
    editUser(item, index) {
      this.user = item;
      this.drawer = true;
    },
    deleteUser(item, index) {
      this.$confirm('确认删除该用户?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          deleteUserRequest(item.userId).then((data) => {
            getUserList(this.isVip, this.isManage, this.keyword, '0', '10').then((data) => {
              this.total = data.count;
              this.userList = data.user;
            });
            this.$message({
              message: '删除成功',
              type: 'success'
            });
          });
        })
        .catch((err) => {});
    },
    define() {
      if (this.$refs.editUser.$refs.form) {
        this.$refs.editUser.$refs.form.validate((e) => {
          if (e) {
            const { vip, name, manage, expireTime, combo } = this.$refs.editUser.form;
            updateUserMsg(this.user.userId, vip, name, manage, expireTime, combo).then((data) => {
              this.$message({
                message: '更新成功',
                duration: 1500,
                type: 'success'
              });
              this.drawer = false;
              getUserList(this.isVip, this.isManage, this.keyword, '0', '10').then((data) => {
                this.total = data.count;
                this.userList = data.user;
              });
            });
          }
        });
      }
    }
  }
};
</script>
<style lang="less">
.user {
  .header-controller {
    .el-input {
      width: 20%;
    }
    .el-select {
      width: 20%;
      margin: 0 0 0 20px;
      .el-input {
        width: 100%;
      }
    }
  }
}
</style>
<style scoped lang="less">
.user {
  padding: 20px;
  background-color: #fff;
  .header-controller {
    display: flex;
    align-items: center;
    margin: 15px 0;
  }
  .user-list {
    & > li {
      padding: 10px 0;
      display: flex;
      align-items: center;
      &:nth-child(odd) {
        background-color: #f9f9f9;
      }
      &:hover {
        background-color: #f0f1f2;
      }
      .index {
        padding: 0 15px;
        color: #9b9b9b;
        font-size: 13px;
      }
      .user-name {
        font-size: 14px;
        width: 13%;
        color: #0077aa;
      }
      .create-time {
        width: 15%;
        color: #9b9b9b;
      }
      .auth {
        width: 10%;
      }
      .expire-time {
        width: 10%;
      }
      .active {
        color: #f56c6c;
      }
      .manage {
        width: 10%;
        color: #656565;
      }
      .playlist {
        width: 10%;
        color: #656565;
      }
      .channel {
        color: #656565;
        width: 10%;
      }
      .moment {
        color: #656565;
        width: 5%;
      }
      .control-btn {
        button {
          margin: 0 0 0 15px;
          background: #f56c6c;
          color: #fff;
          border-radius: 4px;
          cursor: pointer;
          font-size: 13px;
          padding: 3px 15px;
          line-height: 16px;
        }
      }
    }
  }
  .page {
    padding: 20px 0 10px 0;
    display: flex;
    justify-content: center;
  }
}
</style>
