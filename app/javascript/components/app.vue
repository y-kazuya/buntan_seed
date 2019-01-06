<template>
  <div id="navbar">
    <div class="siteName">{{ siteName }}</div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      siteName: "K space"
    };
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
