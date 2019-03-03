
import Vue from "vue";
import BootstrapVue from "bootstrap-vue";
import Header from "../components/header_rails.vue";
import Footer from "../components/footer_rails.vue";
import Sidebar from "../components/sidebar_rails.vue";


import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import axios from "axios";

document.addEventListener("DOMContentLoaded", () => {


  const el = document.body.appendChild(document.createElement("hello"));
  new Vue({
    el: "#no-spa",
    components: {
      'navbar': Header,
      "foot": Footer,
      "side": Sidebar,
    },
    data: function() {
      return {
        current_user: "",
      };
    },
    methods: {
      getCurrentUser: function() {
        axios.get("/api/get_current_user").then(response => {
          this.current_user = response.data;
          console.log(this.current_user);
        });
      },
    },

    mounted: function() {
      this.getCurrentUser();
    },
  });
});

Vue.use(BootstrapVue);