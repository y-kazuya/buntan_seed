<template>
  <div class="navbar">
    <span class="top_logo">{{siteName}}</span>
    <div class="links">
      <a href="#">トップページへ</a>
      <a href="#">新規登録</a>
      <a href="#">ログイン</a>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      siteName: "K Space"
    };
  }
};
</script>
<style scoped>
.navbar {
  color: gray;
  background-color: lightblue;
  padding: 10px;
  text-align: center;
}
.top_logo {
  font-size: 30px;
  font-weight: bold;
}
.links {
  float: right;
}
</style>