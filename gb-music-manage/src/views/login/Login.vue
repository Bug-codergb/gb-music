<template>
  <div class="login-outer">
    <div class="page">
      <div class="cta-container-images">
        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-1">
            <div class="cta-even-image image-1"></div>
            <div class="cta-odd-image image-2"></div>
          </div>
        </div>
        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-1">
            <div class="cta-even-image image-3"></div>
            <div class="cta-odd-image image-4"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-2">
            <div class="cta-even-image image-5"></div>
            <div class="cta-odd-image image-6"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-6">
            <div class="cta-even-image image-7"></div>
            <div class="cta-odd-image image-8"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-3">
            <div class="cta-even-image image-9"></div>
            <div class="cta-odd-image image-10"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-1">
            <div class="cta-even-image image-11"></div>
            <div class="cta-odd-image image-12"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-4">
            <div class="cta-even-image image-13"></div>
            <div class="cta-odd-image image-14"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-6">
            <div class="cta-even-image image-15"></div>
            <div class="cta-odd-image image-16"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-5">
            <div class="cta-even-image image-17"></div>
            <div class="cta-odd-image image-18"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-1">
            <div class="cta-even-image image-9"></div>
            <div class="cta-odd-image image-8"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-3">
            <div class="cta-even-image image-4"></div>
            <div class="cta-odd-image image-5"></div>
          </div>
        </div>

        <div class="cta-singular-cell">
          <div class="cta-internal-image-cont flip-6">
            <div class="cta-even-image image-1"></div>
            <div class="cta-odd-image image-2"></div>
          </div>
        </div>

      </div>
    </div>
    <div class="login">
      <LoginCpn @login="login" />
    </div>
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
  .page {
      height: 98vh;
      display: flex;
      max-width: 1900px;
      background-color: #fff;
    }
    // Start here
    .cta-container-images {
      width: 100%;
      height: 100vh;
      background: #f3f4f5;
      padding-top: 40px;
      overflow: hidden;
      .cta-singular-cell {
        position: relative;
        float: left;
        /*height: $ctaHeight;*/
        @media (max-width: 1920px) {
          height: 200px;
        }
        .cta-even-image,
        .cta-odd-image {
          width: 100%;
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
         /* height: $ctaHeight;*/
          position: absolute;
          top: 0;
          left: 0;
          -webkit-filter: grayscale(1%);
          filter: grayscale(1%);
          @media (max-width: 576px) {
            height: 200px;
          }
        }
        .cta-even-image {
          z-index: 10;
        }
        .cta-odd-image {
          z-index: 11;
        }
        &:nth-child(10) {
          width: 15%;
        }
        &:nth-child(1),
        &:nth-child(2),
        &:nth-child(5),
        &:nth-child(9) {
          width: 20%;
        }
        &:nth-child(6),
        &:nth-child(7),
        &:nth-child(11) {
          width: 25%;
        }
        &:nth-child(3),
        &:nth-child(4),
        &:nth-child(8) {
          width: 30%;
        }
        &:nth-child(12) {
          width: 40%;
        }
      }
    }

    // Images
    .image-1 {
      background-image: url(../../assets/img/bgc/album/T015R640x360M101003hez2l3CGi65.webp);
    }
    .image-2 {
      background-image: url(../../assets/img/bgc/album/T015R640x360M101001a4bxJ2QfCn1.webp);
    }
    .image-3 {
      background-image: url(../../assets/img/bgc/album/T015R640x360M101003vF9ul4FBlH2.webp);
    }
    .image-4 {
      background-image: url(../../assets/img/bgc/album/T015R640x360M101004O1XDf30gA5A.webp);
    }
    .image-5 {
      background-image: url(../../assets/img/bgc/album/T015R640x360M1010002wThg1CtjIz.webp);
    }
    .image-6 {
      background-image: url(../../assets/img/bgc/album/T015R640x360M1010003x77W1X0FA3.webp);
    }
    .image-7 {
      background-image: url(../../assets/img/bgc/artist/1117895448.jpg);
    }
    .image-8 {
      background-image: url(../../assets/img/bgc/artist/2553063246.jpg);
    }
    .image-9 {
      background-image: url(../../assets/img/bgc/artist/3135346545.jpg);
    }
    .image-10 {
      background-image: url(../../assets/img/bgc/mv/T015R640x360M1010015edSB4J4F1q.webp);
    }
    .image-11 {
      background-image: url(../../assets/img/bgc/artist/1261280598.jpg);
    }
    .image-12 {
      background-image: url(../../assets/img/bgc/mv/T015R640x360M101004aB2b71rFi5O.webp);
    }
    .image-13 {
      background-image: url(../../assets/img/bgc/mv/T015R640x360M101004NPl3C47r7qH.webp);
    }
    .image-14 {
      background-image: url(../../assets/img/bgc/mv/T015R640x360M102004XFRCc0c9dH0.webp);
    }
    .image-15 {
      background-image: url(../../assets/img/bgc/artist/1261280598.jpg);
    }
    .image-16 {
      background-image: url(../../assets/img/bgc/artist/3302945515.jpg);
    }
    .image-17 {
      background-image: url(../../assets/img/bgc/artist/1117895448.jpg);
    }
    .image-18 {
      background-image: url(../../assets/img/bgc/mv/T015R640x360M1010015edSB4J4F1q.webp);
    }

    // Animation images
    .cta-singular-cell {
      perspective: 1000px;
      padding-bottom: 8px;
      padding-right: 5px;
      .cta-internal-image-cont {
        height: 100%;
        transition: all 3s linear;
        transform-style: preserve-3d;

        // Animation
        animation-name: photoFlip;
        animation-fill-mode: both;
        animation-iteration-count: infinite;
        animation-duration: 10s;
        &.flip-1 {
          animation-delay: 1s;
        }
        &.flip-2 {
          animation-delay: 2s;
        }
        &.flip-3 {
          animation-delay: 4s;
        }
        &.flip-4 {
          animation-delay: 6s;
        }
        &.flip-5 {
          animation-delay: 8s;
        }
        &.flip-6 {
          animation-delay: 5s;
        }
        .cta-even-image,
        .cta-odd-image {
          position: absolute;
          top: 0;
          left: 0;
          height: 100%;
        }
        .cta-even-image {
          z-index: 2;
          transform: rotateY(0deg);
        }
        .cta-odd-image {
          z-index: 1;
          transform: rotateY(180deg);
        }
      }
    }

    @keyframes photoFlip {
      0% {
        transform: rotateY(0deg);
      }
      20% {
        transform: rotateY(180deg);
      }
      80% {
        transform: rotateY(180deg);
      }
      100% {
        transform: rotateY(0deg);
      }
    }
}
</style>
