<template>
 <div class="wapper">

  <div id="error_explanation" v-if="current_user">
    <div class="error-title">
      フォームに誤りがあります
    </div>
  </div>
  <form class="edit_user" v-on:submit.prevent="editUser">
    <input type="hidden" name="_method" value="put">
    <input name="utf8" type="hidden" value="✓">
    <input type="hidden" name="authenticity_token" value="<users_patch_action_token>">

    <input class="form-control"  autofocus="autofocus" autocomplete="name" v-model="current_user.name" id="user_name">
    <div class="form-group form_item">

    <label class="need-item" for="user_state">都道府県</label>
    <select class="select_state form-control" name="user[state]" id="user_state" v-model="current_user.state">
      <option v-for="(value, key) in states" v-bind:value="key" v-bind:key="value">
        {{key}}
      </option>
    </select>

    <div class="form-group form_item">
    <label class="need-item" for="user_city">市町村</label>
    <select class="select_citys form-control" name="user[city]" id="user_city" v-model="current_user.city"></select>
    </div>
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
      states: ""
    };
  },
  mounted: function() {
    axios.get("/api/get_state").then(response => {
        console.log(response.data)
        this.states = response.data
        // console.log(this.current_user);
      });
  },
  methods: {
    editUser: function(event){
      console.log(event)
    }
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
