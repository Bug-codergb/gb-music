import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
import actions from './actions';
import mutations from './mutations';
export default new Vuex.Store({
  state: {
    userMsg: JSON.parse(window.sessionStorage.getItem('userMsg')),
    loginType: JSON.parse(window.sessionStorage.getItem('loginType')) || 0
  },
  mutations,
  actions,
  modules: {}
});
