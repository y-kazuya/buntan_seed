<template>
  <b-navbar toggleable="md" type="dark" variant="info">
  <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
  <b-navbar-brand href="#">{{siteName}}</b-navbar-brand>
  <b-collapse is-nav id="nav_collapse">
    <b-navbar-nav>
      <b-nav-item href="#">資産一覧</b-nav-item>
      <b-nav-item href="#">全てのアイテム</b-nav-item>
    </b-navbar-nav>
    <!-- ここから右寄せ -->
    <b-navbar-nav class="ml-auto">
      <b-nav-form>
        <b-form-input size="sm" class="mr-sm-2" type="text" placeholder="キーワードを入力"/>
        <b-button size="sm" class="my-2 my-sm-0" type="submit">検索</b-button>
      </b-nav-form>
      <b-nav-item-dropdown right>
        <template slot="button-content">
          <em>カテゴリ</em>
        </template>
        <b-dropdown-item href="#">海沿い</b-dropdown-item>
        <b-dropdown-item href="#">山沿い</b-dropdown-item>
        <b-dropdown-item href="#">築10年以内</b-dropdown-item>
      </b-nav-item-dropdown>
      <b-nav-item-dropdown right>
        <template slot="button-content">
          <em>アカウント</em>
        </template>
        <b-dropdown-item href="#">新規登録</b-dropdown-item>
        <b-dropdown-item href="#">ログイン</b-dropdown-item>
        <b-dropdown-item href="#">マイプロフィール</b-dropdown-item>
      </b-nav-item-dropdown>
    </b-navbar-nav>
  </b-collapse>
</b-navbar>
  
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