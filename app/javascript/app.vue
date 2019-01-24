<template>
  <div id="app">
    <header-vue></header-vue>
    <main-vue></main-vue>
    <item-detail></item-detail>
    <footer-vue></footer-vue>
  </div>
</template>

<script>
import HeaderVue from "./components/header_vue.vue";
import MainVue from "./components/main_vue.vue";
import FooterVue from "./components/footer_vue.vue";
import ItemDetail from "./components/item_detail.vue";

export default {
  data: function() {
    return {};
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
