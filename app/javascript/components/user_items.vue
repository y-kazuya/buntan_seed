<template>
  <div class="user_items">
    <router-link to="/item/new" class="">物件を登録する</router-link>

    {{id}}
    <template v-for="item in user.items">
      <div v-bind:key="item.id">
        {{item.title}}
      </div>

    </template>
  </div>
</template>

<script>
import axios from "axios";
export default {
  props: { id: Number },
  data: function() {
    return {
      user: ""
    };
  },

  mounted: function(){
    let main = this
    axios.get("/api/get_user",{params: {id: this.$props.id}})
      .then(response => {
        this.user = response.data
      })
      .catch(function (response) {
          main.$router.push({ path: '/' })
        });

  }

};
</script>
<style scoped lang="scss">

</style>
