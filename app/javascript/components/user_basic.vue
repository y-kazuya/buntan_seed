<template>

  <div id="dash-wrapper">
    <side></side>
    <div class="dash-left-warpper">
      <div class="dash-content">
        <div class="dash-content-title middle-title">
          基本編集{{this.isValid}}
        </div>
        <div class="user-form dash-content-main">
          <form @submit.prevent="onsubmit">
            <div class="content-box">
              <div class="form-group right-content dash-content-item">
                <label for="user_name" class="need-item">名前</label>
                <input placeholder="土佐 太郎" required="required" type="text" v-model="current_user.name" id="user_name" class="form-control">
              </div>
              <div class="form_item picture_field form-group left-content">
                <p>プロフィール画像</p>
                <label for="user_avatar">
                 <img class="avatar_preview" v-bind:src="current_user.avatar" alt="" >
                </label>
                <input type="file" name="user[avatar]" id="user_avatar" class="display_none file">
              </div>
            </div>

            <div class="form-group form_item dash-content-item">
              <label for="user_state" class="need-item" >都道府県</label>
              <select class="select_state form-control" name="user[state]" id="user_state" v-model="current_user.state" @change="changeState">

                <option v-for="pref in prefs" v-bind:value="pref.name" v-bind:key="pref.id" :data-id="pref.id">
                  {{pref.name}}

                </option>
              </select>
            </div>
            <div class="form-group form_item dash-content-item">
              <label for="user_city" class="need-item">市町村</label>
              <select class="form-control select_citys" name="user[city]" id="user_city" v-model="current_user.city" debounce="500">
                <option value="">市町村を洗濯してください </option>
                <template v-for="city in citys">
                  <option v-bind:value="city.cityName" v-bind:key="city.cityCode">
                    {{city.cityName}}
                  </option>
                </template>
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
            <div class="form-group form_item dash-content-item">
              <label for="user_profile">プロフィール</label>
              <textarea name="user[profile]" id="user_profile" class="form-control" v-model="current_user.profile" ></textarea>
            </div>
            <div class="form-group form_item dash-content-item">
              <button type="submit" class="btn btn-outline-info login_btn signup-btn dash-submit">保存</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Sidebar from "../components/sidebar_rails.vue";
import axios from "axios";
import prefs from '../mixins/prefsMixin'

export default {
  props: {
    current_user: {
      name: String,
      state: String,
      city: String
    }},
  mixins: [ prefs ],
  components:{
    side: Sidebar,
  },

  data: function(){
    return {
      citys: [],
      change: false,
      validation: {
        name: false
      }
    };
  },

  methods:{
    setCity: function(){

      let stateCode = document.getElementById("user_state").selectedIndex + 1
      let url = `https://opendata.resas-portal.go.jp/api/v1/cities?prefCode=${stateCode}`

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
    },


    changeState: function(){
      this.setCity()
      this.current_user.city= ""
    },

    onsubmit: function(){
      const users = this.current_user
      let file = document.getElementById('user_avatar').files[0]


      axios({
        method: 'put',
        url: '/api/update_current_user',
        data: {
          users: users
        }
      })
      .then(response => {

      }).catch(error => {
        console.log(error);
      });

      let data = new FormData();
      data.append('avatar', file)
      console.log(data)
      let config = {
        headers : {
        'content-type' : 'multipart/form-data'
        }
      }

        config.headers['X-HTTP-Method-Override'] = 'PUT';
        axios.post('/api/update_current_user', data, config).then(
          response => {
            this.$emit("getCurrentUser")
            this.$emit("reloadAll")
          }
        )

    }
  },


  computed: {
    isValid: function () {
      var valid = true
      for (var key in this.validation) {
        if (!this.validation[key]) {
          valid = false
        }
      }
      return valid
    }
  },

  mounted: function(){
    this.setCity()

  },
  beforeDestroy: function(){
    this.$emit("get_current_user")
  }
}
</script>

<style lang="scss">

</style>
