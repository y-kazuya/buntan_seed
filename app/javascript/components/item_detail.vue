<template>
  <div id="itempage">
    <!-- モバイル画面 -->
    <!-- <section id="item-mobile">
      <b-card no-body style="max-width: 100%;">
        <b-carousel
          id="item-carousel"
          style="text-shadow: 1px 1px 2px #333; height: 373px;"
          controls
          indicators
          background="#ababab"
          :interval="8000"
          img-width="373"
          img-height="373"
          v-model="slide"
          @sliding-start="onSlideStart"
          @sliding-end="onSlideEnd"
        >
          <b-carousel-slide
            v-for="pic in item.pictures"
            :key="pic.id"
            :text="pic.comment"
            :img-src="pic.content.url"
          ></b-carousel-slide>
        </b-carousel>
        <b-card-body>
          <h4>
            <strong>{{ item.title }}</strong>
          </h4>
          <p class="card-text">{{ item.profile }}</p>
        </b-card-body>
        <b-list-group flush>
          <b-list-group-item>
            <span>カテゴリ</span>
            <span class="mb-list-right">{{ item.category.name }}</span>
          </b-list-group-item>
          <b-list-group-item>築年数</b-list-group-item>
          <b-list-group-item>住所</b-list-group-item>
        </b-list-group>
        <div class="clearfix">
          <b-img left src="https://picsum.photos/125/125/?image=58" alt="left image"/>
          <div style="position: relative; left: 15px; top: 15px;">
            <h4>{{ item.user.name }}</h4>
            <p>{{ item.user.city }}</p>
            <p>{{ item.user.profile }}</p>
            <p>評価：★★★★☆</p>
          </div>
        </div>
        <b-card-body>
          <a href="#" class="card-link">シェアする</a>
          <a href="#" class="card-link">管理者にメッセージ</a>
        </b-card-body>
        <b-card-footer>所在地</b-card-footer>
        <iframe src="https://maps.google.co.jp/maps?output=embed&q=原宿駅" class="map"></iframe>
      </b-card>
    </section>-->

    <!-- タブレット画面 -->

    <!-- PC画面 -->
    <section id="item-detail">
      <b-container class="bg-white">
        <b-row>
          <b-col md="8">
            <b-row>
              <b-card-body>
                <h4>
                  <strong>{{ item.title }}</strong>
                </h4>
                <b-badge variant="light">{{ item.city }}</b-badge>
                <b-badge v-if="item.is_rent">レンタル</b-badge>
                <b-badge v-else>購入</b-badge>
                <b-badge variant="secondary">{{item.category.name}}</b-badge>
                <b-carousel
                  id="item-carousel"
                  class="mt-1"
                  style="text-shadow: 1px 1px 2px #333;"
                  controls
                  indicators
                  background="#ababab"
                  :interval="4000"
                  img-width="1024"
                  img-height="480"
                  v-model="slide"
                  @sliding-start="onSlideStart"
                  @sliding-end="onSlideEnd"
                >
                  <b-carousel-slide
                    v-for="pic in item.pictures"
                    :key="pic.id"
                    :text="pic.comment"
                    :img-src="pic.content.url"
                  ></b-carousel-slide>
                </b-carousel>
              </b-card-body>
            </b-row>
            <b-row>
              <b-card-body>
                <p class="card-text">{{ item.profile }}</p>
                <h5>設備・特徴</h5>
                <ul>
                  <li v-for="tag in tags" :key="tag.id">・{{tag.name}}</li>
                </ul>
                <h5>アクセス</h5>
                <iframe src="https://maps.google.co.jp/maps?output=embed&q=原宿駅" class="map"></iframe>
              </b-card-body>
            </b-row>
          </b-col>
          <b-col md="4">
            <b-card border-variant="info" header="ホスト情報" align="center" class="mt-4 mb-2">
              <h5 class="card-text">{{ item.user.name }}</h5>
              <b-img
                :src="item.user.avatar.url"
                width="150"
                height="150"
                rounded
                alt="Circle image"
              ></b-img>
              <p class="mt-2">{{ item.user.profile }}</p>
              <ul class="user_sns">
                <li>
                  <i class="fa fa-twitter"></i>
                </li>
                <li>
                  <i class="fa fa-facebook"></i>
                </li>
                <li>
                  <i class="fa fa-instagram"></i>
                </li>
              </ul>
              <b-button variant="success">予約リクエスト</b-button>
            </b-card>
          </b-col>
        </b-row>
      </b-container>
    </section>
  </div>
</template>


<script>
import axios from "axios";
export default {
  props: { id: Number,
           create: Boolean,
           current_user: Object},
  data: function() {
    return {
      slide: 0,
      sliding: null,
      detail: [
        { isActive: true, table_left: "カテゴリ", table_right: "キャンプ向け" },
        {
          isActive: false,
          table_left: "所在地",
          table_right: "幡多郡中村市朝倉22-41"
        },
        { isActive: false, table_left: "築年数", table_right: "55年" },
        { isActive: true, table_left: "物件情報", table_right: "2LDK" },
        { isActive: true, table_left: "状態", table_right: "要改修" }
      ],
      tags: [
        { id: 1, name: "水道" },
        { id: 2, name: "wifi" },
        { id: 3, name: "トイレ" }
      ],
      loading: false,
      item: "",
      error: null,
      category: 0,
      pictures: []
    };
  },

  methods: {
    onSlideStart(slide) {
      this.sliding = true;
    },
    onSlideEnd(slide) {
      this.sliding = false;
    },

  },
  computed: {
    itemOwner: function (){
      if(this.current_user && this.current_user.id == this.item.user.id){
        console.log("aa")
        return true
      }

      return false
    }

  },
  created: function() {
    if (this.$route.params.create){
      this.$emit("setFlash", "success", "資産の登録に成功しました！")
    }

    axios
      .get("/api/get_item", { params: { id: this.$route.params.id } })
      .then(response => {
        this.item = response.data;
        console.log(this.item);
      });
  },
  mounted: function() {}
};
</script>
<style scoped lang="scss">
@import "app/assets/stylesheets/items.scss";
</style>
