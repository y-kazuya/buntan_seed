<template>
<div class="warpper">

  <div class="warp-left">
    <img class="pc-img" src="/assets/ie-448a2182460fd132ceae6b3aaac88854235517019558201e67a272a6102739a8.jpg" alt="Ie">
  </div>

  <div class="warp-right">
    <!-- <div class="logo-title">
    <a href="/">VACANT</a>
    </div> -->
    <div class="form-title">
      新規登録
    </div>

    <div class="user-form">
      <form class="new_user" id="" enctype="multipart/form-data" action="/users" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="MlWlhSjSm31Auhk9p5CMSQRLcwBJnbxaiX9/jqBrK3WlJrLDrYagnr5JUYDYIxTywW0WUXwA4cxwKJyXugRt4w==">
        <div class="content-box">
          <div class="form-group right-content">
            <label class="need-item" for="user_name">名前</label>
            <input class="form-control" placeholder="土佐 太郎" required="required" type="text" name="user[name]" id="user_name">
          </div>

          <div class="form_item picture_field form-group left-content">
            <p>プロフィール画像</p>
            <label for="user_avatar">
              <img class="avatar_preview" src="/assets/hito-f386204efbe5a1895129239362ab0d5dc306159d195d467343a97f9ef5f4adab.jpg" alt="Hito">
            </label>
            <input class="display_none file" type="file" name="user[avatar]" id="user_avatar">
          </div>
        </div>

        <div class="form-group">
          <label class="need-item" for="user_email">メールアドレス</label>
          <input placeholder="vacant@vacant.com" class="form-control" type="email" value="" name="user[email]" id="user_email">
        </div>

        <div class="form-group form_item dash-content-item">
          <label for="user_state" class="need-item" >都道府県</label>
          <select class="select_state form-control" name="user[state]" @change="changeState($event)">
            <template v-for="pref in prefs">
              <option v-if="pref.name ==`高知県`" v-bind:value="pref.name" v-bind:key="pref.id" :data-id="pref.id" selected>
                {{pref.name}}
              </option>
              <option v-else v-bind:value="pref.name" v-bind:key="pref.id" :data-id="pref.id"  >
                {{pref.name}}

              </option>
            </template>
          </select>
        </div>

        <div class="form-group form_item">
          <label class="need-item" for="user_city">市町村</label>
          <select class="select_citys form-control" name="user[city]" id="user_city">
            <option value="">市町村を選択してください</option>
            <template v-for="city in citys">
              <option v-bind:value="city.cityName" v-bind:key="city.cityCode">
                {{city.cityName}}
              </option>
            </template>
          </select>
        </div>

        <div class="form-group form_item">
          <label for="user_job">職業</label>
          <select class="form-control" name="user[job]" id="user_job">
            <option value="一般会社員">一般会社員</option>
            <option value="自治体関係者">自治体関係者</option>
            <option value="地域おこし協力隊">地域おこし協力隊</option>
            <option value="学生">学生</option>
            <option value="起業家">起業家</option>
            <option value="その他">その他</option>
          </select>
        </div>

        <div class="form_item">
          <label class="need-item" for="user_password">パスワード</label>
          <input class="form-control" type="password" name="user[password]" id="user_password">
        </div>
        <div class="form_item">
          <label class="need-item" for="user_password_confirmation">パスワード確認</label>
          <input class="form-control" type="password" name="user[password_confirmation]" id="user_password_confirmation">
        </div>

        <button class="btn btn-outline-info login_btn signup-btn" type="submit">Sign Up</button>
      </form>
    </div>

    <span class="other">
      または
    </span>
    <div class="other-login__link">
      <a href="/users/auth/facebook">
      <img alt="Facebook link" class="other-login__link-img" src="/assets/facebook_link.png">
      </a>
    </div>
  </div>

</div>
</template>

<script>
import axios from "axios";
import prefs from '../mixins/prefsMixin'

export default {
  mixins: [ prefs ],
  data: function(){
    return {
      citys: [],
      users: {
        name: "",
        avatar: "",
        email: "",
        state: "",
        city: "",
        job: "",
        password: ""
      }
    };
  },
  methods: {
    changeState: function(event){
      this.setCity(event.target.selectedIndex)
      this.users.city= ""

    },

    setCity: function(val = 22){
      let url = `https://opendata.resas-portal.go.jp/api/v1/cities?prefCode=${val + 1}`
      console.log(val)
      axios({
      headers: {
        "X-API-KEY" : "sLXRi2Ovt21lcBxeFykUus8r0XIiHIAqtPrxntoW"
       },
        method: 'get',
        url: url
      })
      .then(response => {
        this.citys = response.data.result
      }).catch(error => {
        console.log(error);
      });
    }
  }
}
</script>


<style scoped>



</style>
