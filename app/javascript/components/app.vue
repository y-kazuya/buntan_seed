<template>
  <div id="app">
    <header-vue></header-vue>
    <main-vue></main-vue>
  </div>
</template>

<script>
import HeaderVue from "./header_vue.vue";
import MainVue from "./main_vue.vue";

export default {
  data: function() {
    return {};
  },
  components: {
    HeaderVue,
    MainVue
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
