<template>
  <div id="main">
    <section class="top">
      <div class="top-text">
        <p class="top-text-big">空き家 X 起業家</p>
        <p>その空き家、<br/>無限の可能性を秘めています</p>
      </div>
      <div class="top-searchForm">
        <b-card>
          <b-container>
            <b-row class="mb-2">
                <b-col cols="12" class="pr-0 pl-0">
                  <b-form-input v-model="input_area"
                    type="text"
                    placeholder="地名を入力">
                  </b-form-input>
                </b-col>
            </b-row>
            <b-row>
              <b-col cols="8" class="pr-0 pl-0">
                <b-form-select v-model="selected" :options="options">
                </b-form-select>
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
        <h3>こんな物件があります</h3>
        <b-row class="items">
          <div v-for="(item, key, index) in items" :key="index">
            <router-link :to="{ name: 'Item', params: { id: item.id }}">
          <b-card
                  img-src="https://picsum.photos/600/300/?image=25"
                  img-alt="Image"
                  img-top
                  tag="article"
                  style="max-width: 20rem;"
                  class="mb-2 item-card"
                  >
            <p class="card-title">{{ item
              .title }}</p>
            <p class="card-text">
              {{ item.profile }}
            </p>
            <span variant="danger">{{ item
              .city }}</span>
            <!-- <router-link :to="{ name: 'Item', params: { id: item.id }}">detail</router-link> -->
          </b-card>
          </router-link>
          </div>
          
        </b-row>
      </b-container>
    </section>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      input_area: "",
      selected: null,
      options: [
        { value: null, text: "カテゴリを選ぶ" },
        { value: "a", text: "空き家" },
        { value: "b", text: "空き山" },
        { value: "c", text: "空き畑" },
        { value: "d", text: "その他" }
      ]
    };
  },
  props: ["items"],
  mounted: function() {
    console.log(this.items);
  }
};
</script>
<style scoped lang="scss">
#main {
  @media screen and (max-width: 480px) {
    .top {
      background-image: url("../../assets/images/top-mobile.png");
      background-repeat: no-repeat;
      width: 100%;
      height: 600px;
      background-position: top;
      background-size: cover;

      .top-text {
        position: relative;
        top: 80px;
        text-align: center;

        p {
          color: #3e3d3c;
          font-size: 20px;
          font-weight: bold;
        }
      }

      .top-searchForm {
        margin: 0 30px;
        position: relative;
        top: 210px;
      }
    }

    .items-area {
      .items {
        margin-left: 5%;

        .item-card {
          width: 80%;
          text-align: auto 0;
          margin: 5px 10px 5px 10px;

          .card-title {
            font-size: 16px;
            font-weight: bold;
          }
        }
      }
    }
  }

  @media screen and (min-width: 481px) {
    .top {
      background-image: url("../../assets/images/top-pc.png");
      background-repeat: no-repeat;
      width: 100%;
      height: 700px;
      background-position: bottom center;
      background-size: cover;

      .top-text {
        position: relative;
        top: 100px;
        left: 10%;

        p {
          color: white;
          font-size: 35px;
          font-weight: bold;
        }

        .top-text-big {
          font-size: 50px;
        }
      }

      .top-searchForm {
        width: 50%;
        position: relative;
        top: 100px;
        left: 10%;
      }
    }

    .items-area {
      .items {
        .item-card {
          width: 100%;
          text-align: auto 0;
          margin: 15px 20px 15px 20px;

          .card-title {
            font-size: 20px;
            font-weight: bold;
          }
        }
      }
    }
  }
}
</style>
