<template>
  <div id="app">
    <header-vue v-if="showHeader" v-bind:current_user="current_user"  @setFlash="setFlash"></header-vue>
    <flash v-bind:flashs="flashs"></flash>
    <router-view
      v-bind:current_user="current_user"
      @reloadAll="reloadAll"
      @getCurrentUser="getCurrentUser"
      @setFlash="setFlash"
    />
    <footer-vue></footer-vue>
  </div>
</template>

<script>
import HeaderVue from "./components/header_vue.vue";
import MainVue from "./components/main_vue.vue";
import FooterVue from "./components/footer_vue.vue";
import ItemDetail from "./components/item_detail.vue";
import flash from "./components/flash.vue"
import AboutVue from "./components/about_vue.vue";
import PrivacyPoricy from "./components/privacy_policy.vue";

import axios from "axios";

export default {
  data: function() {
    return {
      current_user: "",
      showHeader: true,
      flashs: {
        main : {
          success: "",
          warning: "",
          info: "",
          danger: ""
        },
        visible: true
      }

    };
  },
  created: function() {
    this.getCurrentUser();
  },

  methods: {

    resetFlash: function(){
      for (let ob in this.flashs.main) {
        this.flashs.main[ob] = ""
      }
      this.flashs.visible = true
    },
    setFlash: function(style, mes){
      this.resetFlash()
      this.flashs.main[style] = mes
      setTimeout(this.deleteFlash, 8000);
    },
    deleteFlash: function(){
      this.flashs.visible = false
    },

    getCurrentUser: function() {
      axios.get("/api/get_current_user").then(response => {
        this.current_user = response.data;
      });
    },
    reloadAll: function() {
      this.$parent.$forceUpdate();
    },

    reloadAll() {
      this.showHeader = false;

      this.$nextTick(() => {
        // Add the component back in
        this.showHeader = true;
      });
    }
  },
  watch: {
    '$route': function (to, from) { //ページ遷移の際にフラッシュをリセット
      if (to.path !== from.path) {
        this.resetFlash()
      }
    }
  },
  components: {
    HeaderVue,
    MainVue,
    FooterVue,
    ItemDetail,
    AboutVue,
    PrivacyPoricy,
    flash,
  }
};
</script>

<style scoped lang="scss">
#app {
  font-family: Quicksand, 游ゴシック体, "Yu Gothic", YuGothic,
    "ヒラギノ角ゴシック Pro", "Hiragino Kaku Gothic Pro", メイリオ, Meiryo,
    Osaka, "ＭＳ Ｐゴシック", "MS PGothic", sans-serif;

  a {
    text-decoration: none;
  }
}
</style>
