<template>
  <div class="register">
    <div class="reg-outer">
      <Login :is-show="false" @login="register">
        <button slot="btn">注册</button>
      </Login>
    </div>
  </div>
</template>

<script>
import Login from '../../components/common/login/Login';
import { register } from '../../network/login';

export default {
  name: 'Register',
  components: {
    Login
  },
  methods: {
    register(userName, password) {
      console.log(userName, password);
      register(userName, password).then((data) => {
        if (data) {
          this.$router.push({
            path: '/Login'
          });
        }
      });
    }
  }
};
</script>

<style scoped lang="less">
.register {
  position: relative;
  height: 700px;
  .reg-outer {
    box-shadow: 0 0 25px rgba(0, 0, 0, 0.15);
    background-color: #fff;
    position: absolute;
    left: 50%;
    top: 10%;
    padding: 30px;
    border-radius: 10px;
    transform: translate(-50%, 0);
  }
}
</style>
