import Vue from "vue";
import BootstrapVue from "bootstrap-vue";
import Header from '../components/header_vue.vue'
var app = new Vue({
  router: Router,
  el: '#app2',
  components: {
    'navbar': Header,
  }
});