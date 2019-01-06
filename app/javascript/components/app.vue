<template>
  <div id="app">
    <header-vue></header-vue>
  </div>
</template>

<script>
import HeaderVue from "./header_vue.vue";

export default {
  data: function() {
    return {};
  },
  components: {
    HeaderVue
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
