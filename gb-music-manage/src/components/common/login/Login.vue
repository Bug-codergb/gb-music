<template>
  <div class="login-cpn">
    <div class="title">ln-music</div>
    <div class="user-name">
      <span>用户名:</span>
      <label>
        <input
          type="text"
          placeholder="请输入用户名"
          @input="userNameInp"
          v-model="userName"
          @blur="userNameBlur"
        />
      </label>
      <p class="tip">
        <span v-show="isShowNameTip">用户名不能为空</span>
      </p>
    </div>
    <div class="password">
      <span>密码:</span>
      <label>
        <input
          placeholder="请输入密码"
          type="password"
          v-model="password"
          @input="passInp"
          @blur="passBlur"
        />
      </label>
      <p class="tip">
        <span v-show="isShowPassTip">密码不能为空</span>
      </p>
    </div>
    <div class="login-btn" @click="login">
      <slot name="btn">
        <button>登录</button>
      </slot>
    </div>
    <div class="register-tip" v-show="isShow">
      没有账号?<span @click="registerRouter">注册</span>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data() {
    return {
      userName: '',
      password: '',
      isShowNameTip: false,
      isShowPassTip: false
    };
  },
  props: {
    isShow: {
      type: Boolean,
      default: true
    }
  },
  methods: {
    login() {
      if (this.userName.trim().length === 0) {
        this.isShowNameTip = true;
      } else if (this.password.trim().length === 0) {
        this.isShowPassTip = true;
      } else {
        this.$emit('login', this.userName, this.password);
      }
    },
    userNameInp() {
      if (this.userName.trim().length !== 0) {
        this.isShowNameTip = false;
      }
      if (this.userName.trim().length === 0) {
        this.isShowNameTip = true;
      }
    },
    passInp() {
      if (this.password.trim().length !== 0) {
        this.isShowPassTip = false;
      }
      if (this.password.trim().length === 0) {
        this.isShowPassTip = true;
      }
    },
    userNameBlur() {
      if (this.userName.trim().length === 0) {
        this.isShowNameTip = true;
      }
    },
    passBlur() {
      if (this.password.trim().length === 0) {
        this.isShowPassTip = true;
      }
    },
    registerRouter() {
      this.$router.push({
        path: '/Register'
      });
    }
  }
};
</script>

<style scoped lang="less">
.login-cpn {
  background-color: #fff;
  .title {
    text-align: center;
    font-size: 26px;
    font-weight: bolder;
    margin: 0 0 40px 0;
  }
  .user-name,
  .password {
    margin: 20px 0;
    & > span {
      width: 50px;
      display: inline-block;
    }
    input {
      border: 1px solid #a0cfff;
      padding: 10px 15px;
      margin: 0 0 0 20px;
      width: 240px;
    }
  }
  .login-btn {
    text-align: center;
    margin: 40px 0 30px 0;
    button {
      background-color: #a0cfff;
      color: #fff;
      padding: 10px 160px;
      &:hover {
        background-color: #cc3232;
        cursor: pointer;
      }
    }
  }
  .register-tip {
    text-align: right;
    span {
      color: #a0cfff;
      margin: 0 0 0 5px;
      cursor: pointer;
      &:hover {
        color: #cc3232;
      }
    }
  }
  .tip {
    text-align: right;
    font-size: 13px;
    margin: 5px 0 0 0;
    color: #a0cfff;
    height: 13px;
  }
}
</style>
