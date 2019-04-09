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
        <li v-for="(item,index) in user.items" :key="index" :id="'item' + index">
          <router-link class="d-link" :to="{ name: 'Item', params: { id: item.id }}">
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
                    <b-badge v-if="item.is_rent==true">レンタル</b-badge>
                    <b-badge v-else>購入</b-badge>
                  </span>
                  <p >{{item.price}}</p>
                </b-col>
                <b-col cols="2">
                  <router-link :to="{ name: 'Item_basic', params: { id: item.id }}">
                    <button type="button" class="btn btn-info">編集</button>
                  </router-link>

                  <button type="button" class="btn btn-danger" @click="deleteItem(item.id, index)">削除</button>
                </b-col>
              </b-row>
            </b-card>
          </router-link>
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
      user: "",
    };
  },

  mounted: function() {
    let main = this;
    axios
      .get("/api/get_user", { params: { id: this.$props.id } })
      .then(response => {
        this.user = response.data;
      })
      .catch(function(response) {
        main.$router.push({ path: "/" });
      });
  },

  methods:{
    deleteItem: function(id,index){
      var res = confirm("削除してもよろしいですか？");
      if (!res){
        return
      }

      axios
        .delete("/api/delete_item", {
          params: {id: id}
        })
        .then(response => {
          this.$emit("setFlash", "info", "削除しました")
          document.getElementById(`item${index}`).textContent = null
        })
        .catch(error => {
          alert("通信エラーです")
        });;
    }
  }
};
</script>
<style scoped lang="scss">
@media screen and (max-width: 700px) {
  .col-2{
    padding: 0;
  }
}

</style>
