<template>
  <div class="user_items">
    <b-container>
      <b-row class="mt-4">
        <b-col cols="9">
          <h3>登録済み一覧</h3>
        </b-col>
        <b-col cols="3">
          <router-link to="/item/new" style="float: right;">
            <i class="fa fa-plus-circle fa-3x" style="color: #F9E79F;"></i>
          </router-link>
        </b-col>
      </b-row>
      <ul class="mt-4">
        <li v-for="(item, key, index) in user.items" :key="index">
          <b-card>
            <b-row>
              <b-col cols="4">
                <b-img
                  left
                  rounded
                  :src="item.pictures[0].content.url"
                  width="100"
                  height="100"
                  alt="img"
                />
              </b-col>
              <b-col cols="6">
                <h5>{{ item.title }}</h5>
                <span>
                  <b-badge>{{ item.city }}</b-badge>
                  <b-badge v-if="is_rent=true">レンタル</b-badge>
                  <b-badge v-if="is_rent=false">購入</b-badge>
                </span>
                <p v-if="is_rent=true">{{item.price}}万円/月</p>
                <p v-if="is_rent=false">{{item.price}}万円で購入</p>
              </b-col>
              <b-col cols="2">
                <b-badge>編集</b-badge>
                <b-badge>削除</b-badge>
              </b-col>
            </b-row>
          </b-card>
        </li>
      </ul>
    </b-container>
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

  mounted: function() {
    let main = this;
    axios
      .get("/api/get_user", { params: { id: this.$props.id } })
      .then(response => {
        this.user = response.data;
        console.log(this.user);
      })
      .catch(function(response) {
        main.$router.push({ path: "/" });
      });
  }
};
</script>
<style scoped lang="scss">
</style>
