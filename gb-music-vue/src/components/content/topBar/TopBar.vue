<template>
  <div class="top-bar">
    <div class="content">
      <div class="top-bar-left">
        <div class="logo" @click="logoClick">
          <img src="../../../assets/img/logo.png" alt="logo" />
        </div>
        <div class="is-fold" @click="changeFold">
          <i class="el-icon-s-unfold" v-show="isFold"></i>
          <i class="el-icon-s-fold" v-show="!isFold"></i>
        </div>
      </div>
      <div class="crumb-outer">
        <crumb/>
      </div>
      <div class="user-msg">
        <div class="avatar" @click.stop="changeShow">
          <img :src="this.$store.state.userMsg.avatarUrl" alt="头像" />
        </div>
        <div class="user-name" @click.stop="changeShow">
          {{ this.$store.state.userMsg.userName }}
        </div>
        <transition name="logout">
          <div class="logout" v-show="isShow" @click="logout">
            <span>退出</span>
          </div>
        </transition>
      </div>
    </div>
  </div>
</template>

<script>
import Crumb from "@/components/common/crumb/Crumb";
export default {
  name: 'TopBar',
  components: { Crumb },
  data() {
    return {
      isShow: false,
      isFold:false
    };
  },
  mounted() {
    document.addEventListener('click', this.changeShowFalse);
  },
  beforeDestroy() {
    document.addEventListener('click', this.changeShowFalse);
  },
  methods: {
    logoClick() {
      this.$router.push({
        path: '/Home'
      });
    },
    logout() {
      this.$router.push({
        path: '/Login'
      });
    },
    changeShow() {
      this.isShow = true;
    },
    changeShowFalse() {
      this.isShow = false;
    },
    changeFold(){
      this.isFold=!this.isFold;
      this.$emit('change-fold')
    }
  }
};
</script>

<style scoped lang="less">
.top-bar {
  box-sizing: border-box;
  height: 65px;
  background-color: #fff;
  border-bottom: 1px solid #e0e0e0;
  width: 100%;
  .content {
    display: flex;
    align-items: center;
    width: 100%;
    height: 100%;
    .top-bar-left{
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 100%;
      width: 11%;
      .is-fold{
        i{
          font-size: 28px;
          color: #656565;
          cursor: pointer;
          &:hover{
            color: #333;
          }
        }
      }

    }
    .crumb-outer{
      height: 100%;
      display: flex;
      align-items:flex-end;
      width: 80%;
      padding: 0 5px 2px 10px;
      overflow-x: scroll;
      margin: 0 20px;
      &::-webkit-scrollbar{
        width: 10px;
        height: 10px;
        background-color: rgba(140, 147, 157,.3);
        border-radius: 20%;
      }
    }
  }
  .logo {
    margin: 0 20px 0 0;
    img {
      width: 40px;
      border-radius: 5px;
    }
  }
  .search {
    display: flex;
    align-items: center;
    input {
      width: 200px;
      border: 1px solid #e13e3e;
      padding: 8px 20px;
    }
    button {
      width: 35px;
      height: 35px;
      background-color: #ec4141;
      color: #fff;
    }
  }
  .user-msg {
    display: flex;
    align-items: center;
    margin: 0 20px 0 0;
    position: relative;
    .avatar {
      width: 30px;
      height: 30px;
      overflow: hidden;
      border-radius: 50%;
      cursor: pointer;
      img {
        height: 100%;
      }
    }
    .user-name {
      font-size: 13px;
      cursor: pointer;
      margin: 0 0 0 10px;
    }
    .logout {
      position: absolute;
      left: 50%;
      top: 105%;
      transform: translate(-50%, 10%);
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
      background-color: #fff;
      border-radius: 8px;
      cursor: pointer;
      padding: 10px 0;
      z-index: 9999;
      &:hover {
        & > span {
          background-color: #f2f2f2;
        }
      }
      & > span {
        display: inline-block;
        padding: 15px 60px;
        white-space: nowrap;
        color: #262626;
      }
    }
    .logout-enter {
      opacity: 0;
    }
    .logout-enter-active {
      opacity: 0;
      transition: opacity 0.3s;
    }
    .logout-enter-to {
      opacity: 1;
    }
    .logout-leave {
      opacity: 1;
    }
    .logout-leave-active {
      opacity: 1;
      transition: opacity 0.3s;
    }
    .logout-leave-to {
      opacity: 0;
    }
  }
}
</style>
