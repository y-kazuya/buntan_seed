<template>

  <b-navbar toggleable="md" type="dark" variant="info">
  <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
  <b-navbar-brand class="top_logo">
    <router-link to="/"><img src="../../assets/images/top-logo.png"> </router-link>
  </b-navbar-brand>
  <b-collapse is-nav id="nav_collapse">
    <b-navbar-nav>
      <b-nav-item >資産一覧</b-nav-item>
      <b-nav-item href="#">全てのアイテム</b-nav-item>
      <!-- <b-nav-item href="#">全てのアイテム</b-nav-item> -->
      <b-nav-item>
        <router-link to="/about">
          Vacantとは？
        </router-link>
      </b-nav-item>
    </b-navbar-nav>
    <!-- ここから右寄せ -->
    <b-navbar-nav class="ml-auto">

      <b-nav-form>
        <b-form-input size="sm" class="mr-sm-2" type="text" placeholder="キーワードを入力"/>
        <b-button size="sm" class="my-2 my-sm-0" type="submit">検索</b-button>
      </b-nav-form>
      <b-nav-item-dropdown right>
        <template slot="button-content">
          <em>エリア</em>
        </template>
        <b-dropdown-item href="#" v-for="(area, key, index) in areas" :key="index">{{ area }}</b-dropdown-item>
      </b-nav-item-dropdown>

    <b-nav-item v-if="current_user && current_user.owner" href="#">物件管理</b-nav-item>

      <b-nav-item v-else><router-link to="/item/new" class="n-link">物件を登録する</router-link></b-nav-item>

    <template v-if="current_user">
      <b-nav-item-dropdown right>
        <template slot="button-content">
          <img class="avatar" v-bind:src="this.current_user.avatar" alt="">
          <em v-once>
            {{this.current_user.name}}さん
          </em>
        </template>
        <b-dropdown-item>
          <router-link to="/user/basic" class="d-link">マイプロフィールa</router-link>
        </b-dropdown-item>
        <b-dropdown-item href="/users/sign_out" class="d-link" data-method="delete">ログアウト</b-dropdown-item>
      </b-nav-item-dropdown>

    </template>
    <template v-else>
      <span>
        <b-nav-item v-b-modal.modal-center style="float: left;">ログイン</b-nav-item>

          <b-nav-item style="float: right;" ><router-link to="/user/new" class="n-link">新規登録</router-link></b-nav-item>

      </span>
    </template>



    </b-navbar-nav>
  </b-collapse>

        <!-- Modal Component -->

  <b-modal id="modal-center" centered title="ログイン">
    <div class="validate-field">
      <p class="validate-message">
        {{message}}
      </p>
    </div>
    <form class="new_user" id="new_user" action="/users/sign_in" accept-charset="UTF-8" method="post">
    <input name="utf8" type="hidden" value="✓">
    <input type="hidden" name="authenticity_token" value="<users_sign_in_post_action_token>">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text" id="basic-addon1">メールアドレス</span>
        </div>
        <input class="form-control" placeholder="Vacant@mail.com" autofocus="autofocus" autocomplete="email" type="email" value="" name="user[email]">
      </div>

      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text" id="basic-addon1">パスワード&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        </div>
        <input class="form-control" autocomplete="current-password" type="password" name="user[password]" >
      </div>
      <input name="user[now_path]" type="hidden" :value="$route.path">

      <div class="form-check">
        <input name="user[remember_me]" type="hidden" value="0">
        <input type="checkbox" class="form-check-input" value="1" name="user[remember_me]" id="user_remember_me">
        <label class="form-check-label" for="user_remember_me">Remember me</label>
      </div>

      <div class="actions">
        <input class="btn btn-outline-info login_btn" type="submit" name="commit" value="Log in" data-disable-with="Log in" v-on:click="button_disable()" :disabled="isTestDisabled">
      </div>


    </form>
    <div slot="modal-footer" class="w-100">

       <span class="other">
        または

      </span>
      <div class="other-login__link">
        <a href="/users/auth/facebook">
          <img class="other-login__link-img" src="/assets/facebook_link.png" alt="Facebook link">
        </a>
      </div>

    </div>

  </b-modal>


</b-navbar>

</template>

<script>
export default {
  props: ["current_user"],
  data: function() {
    return {
      areas: [
        "高知市",
        "仁淀川",
        "嶺北",
        "物部川",
        "安芸・室戸",
        "奥四万十",
        "四万十・足摺",
        "高知県外"
      ],
      isTestDisabled: false,
      message: ""
    };
  },
  methods: {
    button_disable: function() {
      this.isTestDisabled = true;

      setTimeout(this.enable, 3000);
    },
    enable: function() {
      this.isTestDisabled = false;
      this.message = "メールアドレスまたはパスワードが間違っています。";
    },
  },
};
</script>
<style scoped lang="scss">
@import "app/assets/stylesheets/header.scss";
</style>