import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';

import less from 'less';
import { formatTime } from '@/utils/format';

import VueLazyload from "vue-lazyload";

Vue.use(less);

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import themeColor from "./assets/sass/main.scss"
Vue.config.productionTip = false;
import toast from './components/common/toast/index';
Vue.use(VueLazyload, {
  loading:require('./assets/img/holder/video-placeholder.png'),
  error:require('./assets/img/holder/video-placeholder.png'),
  preLoad:1.3
})
Vue.use(toast);
Vue.use(ElementUI);
Vue.directive("format",{
  inserted(el,bind){
    const {expression}=bind;
    let exp=expression.substring(1,expression.length-1);
    el.innerHTML=formatTime(el.innerText,exp);
  },
})
new Vue({
  router,
  store,
  themeColor,
  render: (h) => h(App)
}).$mount('#app');
