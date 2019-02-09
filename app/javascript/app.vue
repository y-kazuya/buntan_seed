<template>
  <div id="app">
    <header-vue v-bind:current_user="current_user"></header-vue>
    <router-view/>
    <footer-vue></footer-vue>
  </div>
</template>

<script>
import HeaderVue from "./components/header_vue.vue";
import MainVue from "./components/main_vue.vue";
import FooterVue from "./components/footer_vue.vue";
import ItemDetail from "./components/item_detail.vue";

import axios from 'axios';

export default {
  data: function() {
    return {
      current_user: ""
    };
  },
  mounted: function () {
    this.getCurrentUser();
  },

  methods: {
    getCurrentUser:function() {
      axios.get('/api/get_current_user').then((response) => {
        this.current_user = response.data
      })
    }
  },
  components: {
    HeaderVue,
    MainVue,
    FooterVue,
    ItemDetail
  }
};
</script>

<style scoped>
#app {
  font-family: Quicksand, 游ゴシック体, "Yu Gothic", YuGothic,
    "ヒラギノ角ゴシック Pro", "Hiragino Kaku Gothic Pro", メイリオ, Meiryo,
    Osaka, "ＭＳ Ｐゴシック", "MS PGothic", sans-serif;
}
</style>
