<template>
  <div class="login-outer">
    <div class="login">
      <LoginCpn @login="login" />
    </div>
    <lottie-player
      src="https://assets9.lottiefiles.com/packages/lf20_gi7jdlvx.json"
      background="transparent"
      speed="1"
      style="width: 70%; height: 100%"
      loop
      autoplay
    ></lottie-player>
  </div>
</template>

<script>
import LoginCpn from '../../components/common/login/Login';
export default {
  name: 'Login',
  components: {
    LoginCpn
  },
  mounted() {
    console.log(lottie - player);
  },
  methods: {
    login(userName, password) {
      let self = this;
      this.$store
        .dispatch({
          type: 'loginAction',
          userName,
          password,
          self
        })
        .then((data) => {
          if (data);
          {
            this.$router.push({
              path: '/Home'
            });
          }
        });
    }
  }
};
</script>

<style scoped lang="less">
.login-outer {
  position: relative;
  border-bottom: 1px solid pink;
  height: 720px;
  .login {
    box-shadow: 0 0 25px rgba(0, 0, 0, 0.15);
    background-color: #fff;
    position: absolute;
    padding: 30px;
    border-radius: 10px;
    left: 60%;
    top: 15%;
  }
}
</style>
