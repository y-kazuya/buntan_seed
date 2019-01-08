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
.siteName {
  font-size: 2em;
  text-align: center;
  color: gray;
}
</style>
