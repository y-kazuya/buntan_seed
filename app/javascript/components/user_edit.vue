<template>
 <div class="wapper">

  <!-- <div id="error_explanation" v-if="current_user">
    <div class="error-title">
      フォームに誤りがあります
    </div>
  </div> -->
  <form class="edit_user" action="/users" method="post" >
    <input type="hidden" name="_method" value="put">
    <input name="utf8" type="hidden" value="✓">
    <input type="hidden" name="authenticity_token" value="<users_patch_action_token>">

     <div class="form-group">
      <label for="user_name" class="need-item">名前</label>
      <input class="form-control"  autofocus="autofocus" autocomplete="name" name="user[name]" v-model="current_user.name" id="user_name">
    </div>

    <div class="form_item picture_field form-group">
      <p>
      プロフィール画像
      </p>
      <label for="user_avatar">
        <img class="avatar_preview" v-bind:src="current_user.avatar" alt="Hito">
        <img  v-if="!current_user.avatar" class="avatar_preview" src="/assets/hito-f386204efbe5a1895129239362ab0d5dc306159d195d467343a97f9ef5f4adab.jpg" alt="Hito">
      </label>
      <input class="display_none file" type="file" name="user[avatar]" id="user_avatar">
    </div>




    <div class="form-group form_item">
      <label class="need-item" for="user_state">都道府県</label>
      <select class="select_state form-control" name="user[state]" id="user_state" v-model="current_user.state">
        <option v-for="(value, key) in states" v-bind:value="key" v-bind:key="value">
          {{key}}
        </option>
      </select>
    </div>

    <div class="form-group form_item">
      <label class="need-item" for="user_city">市町村</label>
      <select class="form-control select_citys" name="user[city]" id="user_city" v-model.lazy="current_user.city">
        <option v-for="city in citys" v-bind:value="city.cityName" v-bind:key="city.cityCode">
          {{city.cityName}}
        </option>
      </select>
    </div>

    <div class="form-group form_item">
      <label for="user_job">職業</label>
      <select class="form-control" name="user[job]" id="user_job" v-model="current_user.job">
        <option value="一般会社員">一般会社員</option>
        <option value="自治体関係者">自治体関係者</option>
        <option value="地域おこし協力隊">地域おこし協力隊</option>
        <option value="学生">学生</option>
        <option value="起業家">起業家</option>
        <option value="その他">その他</option>
      </select>
    </div>

    <div class="form-group">
      <label for="user_profile">プロフィール</label>
      <textarea class="form-control" v-model="current_user.profile" id="user_proflie" name="user[profile]" rows="3"></textarea>
    </div>



    <input class="btn btn-outline-info" type="submit" name="commit">
  </form>
</div>
</template>

<script>
import axios from "axios";
export default {
  props: ["current_user"],
  data: function() {
    return {
      states: "",
      citys: "",
    };
  },
  mounted: function() {
    axios.get("/api/get_state").then(response => {

        this.states = response.data
      });
    axios({
      headers: {
        "X-API-KEY" : "sLXRi2Ovt21lcBxeFykUus8r0XIiHIAqtPrxntoW"
       },
        method: 'get',
        url: `https://opendata.resas-portal.go.jp/api/v1/cities?prefCode=${this.current_user.state_code}`
      })
      .then(response => {
        this.citys = response.data.result


      }).catch(error => {
        console.log(error);
      });
  },


  methods: {
    editUser: function(event){
      axios({
        method: 'put',
        url: '/api/update_current_user',
        data: {
          users: {
            name: 'Fred'
          }
        }
      })
      .then(response => {
        console.log(response.data);
      }).catch(error => {
        console.log(error);
      });
    },

  }
};
</script>
<style lang="scss">
  .wapper{
    width: 100vw;
    min-height: 83.5vh;
    position: relative;
    background: #f6f4f3;
  }
</style>
