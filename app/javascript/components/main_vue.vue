<template>
  <div id="main">
    <section class="top">
      <div class="top-text">
        <p class="top-text-big" style="font-family: fantasy;">Enjoy your own Mountain</p>
        <p>
          自然好きにたまらない場所がここに。
          <br>山のレンタル、購入ならVacant
        </p>
      </div>
      <div class="top-searchForm">
        <b-card>
          <b-container>
            <b-row class="mb-2">
              <b-col cols="12" class="pr-0 pl-0">
                <b-form-radio-group
                  v-model="selectedCate"
                  :options="cates"
                  plain
                  name="plainInline"
                />
              </b-col>
            </b-row>
            <b-row>
              <b-col cols="8" class="pr-0 pl-0">
                <div class="form-group form_item">
                  <label class="need-item" for="user_city">都道府県</label>
                  <select class="select_state form-control" name="user[state]" id="user_state">
                    <option
                      v-for="(value, key) in states"
                      v-bind:value="key"
                      v-bind:key="value"
                    >{{key}}</option>
                  </select>
                  <label class="need-item" for="user_city">市町村</label>
                  <select class="form-control select_citys" name="user[city]" id="user_city">
                    <option
                      v-for="city in citys"
                      v-bind:value="city.cityName"
                      v-bind:key="city.cityCode"
                    >{{city.cityName}}</option>
                  </select>
                </div>
              </b-col>
              <b-col cols="4" class="pr-0 pl-2">
                <div>
                  <b-button class="pr-3 pl-3">検索</b-button>
                </div>
              </b-col>
            </b-row>
          </b-container>
        </b-card>
      </div>
    </section>
    <section class="items-area mt-4 mb-2">
      <b-container>
        <h3>こんな土地・物件があります</h3>

        <!-- PC -->
        <div class="pc-only">
          <b-row class="items">
            <div v-for="(item, key, index) in items" :key="index">
              <router-link :to="{ name: 'Item', params: { id: item.id }}">
                <b-card
                  :img-src="item.pictures[0].content.url"
                  img-alt="Image"
                  img-top
                  tag="article"
                  style="max-width: 20rem;"
                  class="mb-2 item-card"
                >
                  <p class="card-title">{{ item.title }}</p>
                  <span variant="danger">{{ item.city }}</span>
                  <b-badge>{{ item.city }}</b-badge>
                  <b-badge variant="secondary">{{item.category.name}}</b-badge>
                  <b-badge v-if="is_rent=true">レンタル</b-badge>
                  <b-badge v-if="is_rent=false">購入</b-badge>
                </b-card>
              </router-link>
            </div>
          </b-row>
        </div>

        <!-- モバイル -->
        <div class="mobile-only">
          <div v-for="(item, key, index) in items" :key="index" style="margin: 4px 0;">
            <router-link :to="{ name: 'Item', params: { id: item.id }}">
              <b-card class="item-mobile">
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
                  <b-col cols="8">
                    <h5>{{ item.title }}</h5>
                    <span>
                      <b-badge>{{ item.city }}</b-badge>
                      <b-badge variant="secondary">{{item.category.name}}</b-badge>
                      <b-badge v-if="is_rent=true">レンタル</b-badge>
                      <b-badge v-if="is_rent=false">購入</b-badge>
                    </span>
                    <p v-if="is_rent=true">{{item.price}}万円/月</p>
                    <p v-if="is_rent=false">{{item.price}}万円で購入</p>
                  </b-col>
                </b-row>
              </b-card>
            </router-link>
          </div>
        </div>
      </b-container>
    </section>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function() {
    return {
      input_area: "",
      selectedCate: null,
      cates: [
        { value: "a", text: "空き家" },
        { value: "b", text: "空き山" },
        { value: "c", text: "空き地" }
      ],
      citys: "",
      states: "",
      item: "",
      items: ""
    };
  },

  methods: {
    onSlideStart(slide) {
      this.sliding = true;
    },
    onSlideEnd(slide) {
      this.sliding = false;
    },

    getItems: function() {
      axios.get("/api/get_items").then(response => {
        this.items = response.data;
      });
    },
  },
  mounted: function() {
    axios.get("/api/get_state").then(response => {
      this.states = response.data;
    });
    axios({
      headers: {
        "X-API-KEY": "Z3EL4ocLlD9uJcZUi61WnBtnZT8fltrlCPjcVeZ5"
      },
      method: "get",
      url: `https://opendata.resas-portal.go.jp/api/v1/cities?prefCode=1
      }`
    })
      .then(response => {
        this.citys = response.data.result;
      })
      .catch(error => {
        console.log(error);
      });
    axios.get("/api/get_items").then(response => {
      this.items = response.data;
      console.log(this.items);
    });
  },

  created: function(){
    this.getItems();
  }
};
</script>
<style scoped lang="scss">
@import "app/assets/stylesheets/main.scss";
</style>
