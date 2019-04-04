<template>
  <div id="itempage">
    <section id="item-mobile">
      <b-card no-body
            style="max-width: 100%;"
            >
        <b-carousel id="item-carousel"
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
                <b-carousel-slide caption="スライド１"
                                  text="スライドのキャッチコピー"
                                  img-src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190202/20190202174926.png">
                </b-carousel-slide>
                <b-carousel-slide caption="スライド２"
                                  text="スライドのキャッチコピー"
                                  img-src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190202/20190202174926.png">
                </b-carousel-slide>
                <b-carousel-slide caption="スライド３"
                                  text="スライドのキャッチコピー"
                                  img-src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190202/20190202174926.png">
                </b-carousel-slide>
                <b-carousel-slide caption="スライド４"
                                  text="スライドのキャッチコピー  "
                                  img-src="https://cdn-ak.f.st-hatena.com/images/fotolife/k/kyuma-morita/20190202/20190202174926.png">
                </b-carousel-slide>
              </b-carousel>
        <b-card-body>
          <h4><strong>{{ item.title }}</strong></h4>
          <p class="card-text">
              {{ item.profile }}
          </p>
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
          <b-img left src="https://picsum.photos/125/125/?image=58" alt="left image" />
          <div style="position: relative; left: 15px; top: 15px;">
            <h4>{{ item.user.name }}</h4>
            <p>{{ item.user.city }}</p>
            <p>{{ item.user.profile }}</p>
            <p>評価：★★★★☆</p>
          </div>
        </div>
        <b-card-body>
            <a href="#"
               class="card-link">シェアする</a>
            <a href="#"
               class="card-link">管理者にメッセージ</a>
        </b-card-body>
        <b-card-footer>所在地</b-card-footer>
        <iframe src="https://maps.google.co.jp/maps?output=embed&q=原宿駅" class="map"></iframe>
      </b-card>
    </section>
    <section id="item-md">
      <b-container class="bg-white">
        <b-row>
          <b-col md="8">
            <b-row>
              <b-carousel id="item-carousel"
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
                <b-carousel-slide caption="スライド１"
                                  text="スライドのキャッチコピー"
                                  img-src="https://picsum.photos/1024/480/?image=52">
                </b-carousel-slide>
                <b-carousel-slide caption="スライド２"
                                  text="スライドのキャッチコピー"
                                  img-src="https://picsum.photos/1024/480/?image=52">
                </b-carousel-slide>
                <b-carousel-slide caption="スライド３"
                                  text="スライドのキャッチコピー"
                                  img-src="https://picsum.photos/1024/480/?image=52">
                </b-carousel-slide>
                <b-carousel-slide caption="スライド４"
                                  text="スライドのキャッチコピー  "
                                  img-src="https://picsum.photos/1024/480/?image=52">
                </b-carousel-slide>
              </b-carousel>
            </b-row>
            <b-row>
              <b-card-body>
                <h4><strong>{{ item.title }}</strong></h4>
                <p class="card-text">
                  {{ item.profile }}
                </p>
              </b-card-body>
              <b-table striped hover :detail="detail" :fields="fields"></b-table>
            </b-row>
          </b-col>
          <b-col md="4">
            <b-card border-variant="info" header="所在地" align="center" class="mt-3">
              <p class="card-text">{{ item.user.city }}</p>
              <iframe src="https://maps.google.co.jp/maps?output=embed&q=原宿駅" class="map"></iframe>
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
  props: { id: Number },
  data: function() {
    return {
      slide: 0,
      sliding: null,
      fields: ["table_left", "table_right"],
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
      loading: false,
      item: "",
      error: null
    };
  },

  methods: {
    onSlideStart(slide) {
      this.sliding = true;
    },
    onSlideEnd(slide) {
      this.sliding = false;
    }
  },
  created: function() {
    console.log(this.$route.params.id);
    axios
      .get("/api/get_item", { params: { id: this.$route.params.id } })
      .then(response => {
        this.item = response.data;
        console.log(this.item);
      });
  }
};
</script>
<style scoped lang="scss">
@import "app/assets/stylesheets/items.scss";
</style>
