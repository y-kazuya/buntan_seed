<template>
  <div id="dash-wrapper">
    <div class="dash-left-warpper">
      <div class="dash-content">
        <div class="dash-content-title middle-title">新規資産登録</div>
        <div class="user-form dash-content-main">
          <form @submit.prevent="onsubmit">
            <div class="form-group form_item dash-content-item">
              <label for="user_name" class="need-item">タイトル</label>
              <input
                placeholder="土佐市のあきやま"
                required="required"
                type="text"
                v-model="item.title"
                id="item_title"
                v-bind:class="[`form-control`, validTitle ? `is-error`  : '']"
                @change="valiUnique($event,'Item','title'),valiLong($event,'Item','title',50)"
              >
              <template v-for="(error,i) in errors.Item.title">
                <div class="validate-message" v-bind:key="i">{{error}}</div>
              </template>
            </div>

            <div class="form-group form_item dash-content-item">
              <label for="user_state" class="need-item">都道府県</label>
              <select
                class="select_state form-control"
                @change="changeState($event)"
                v-model="item.state"
              >
                <template v-for="pref in prefs">
                  <option
                    v-if="pref.name ==`高知県`"
                    v-bind:value="pref.name"
                    v-bind:key="pref.id"
                    :data-id="pref.id"
                    selected
                  >{{pref.name}}</option>
                  <option
                    v-else
                    v-bind:value="pref.name"
                    v-bind:key="pref.id"
                    :data-id="pref.id"
                  >{{pref.name}}</option>
                </template>
              </select>
            </div>

            <div class="form-group dash-content-item form_item">
              <label class="need-item" for="item_city">市町村</label>
              <select
                required="required"
                class="select_citys form-control"
                id="item_city"
                v-model="item.city"
              >
                <option value>市町村を選択してください</option>
                <template v-for="city in citys">
                  <option v-bind:value="city.cityName" v-bind:key="city.cityCode">{{city.cityName}}</option>
                </template>
              </select>
            </div>

            <div class="form-group dash-content-item form_item">
              <label class="need-item" for="item_category">資産カテゴリー</label>
              <select
                required="required"
                class="form-control"
                id="item_category"
                v-model="item.category_id"
              >
                <option value>カテゴリーを選択してください</option>
                <template v-for="category in categoryies">
                  <option v-bind:value="category.id" v-bind:key="category.name">{{category.name}}</option>
                </template>
              </select>
            </div>

            <div class="content-box form-group dash-content-item form_item">
              <label class="content-title need-item">貸し出しタイプ/値段</label>

              <div class="content-box-area">
                <b-form-group class="form-group c-left-content">
                  <b-form-radio
                    v-model="item.is_rent"
                    name="some-radios"
                    value="true"
                    v-on:change="onChangeRent"
                  >賃貸</b-form-radio>
                  <b-form-radio
                    v-model="item.is_rent"
                    name="some-radios"
                    value="false"
                    v-on:change="onChangeRent"
                  >販売</b-form-radio>
                </b-form-group>

                <div class="form_item form-group c-right-content">
                  <input
                    :placeholder="placeholder.price"
                    required="required"
                    type="text"
                    v-model="item.price"
                    id="item_price"
                    class="form-control"
                  >
                </div>
              </div>
            </div>

            <div class="form-group form_item dash-content-item">
              <label for="item_profile" class="need-item">説明文</label>
              <textarea
                id="item_profile"
                v-model="item.profile"
                required
                v-bind:class="[`form-control`,`normal-textarea`, validProfile ? `is-error`  : '']"
                @change="valiLong($event,'Item','profile',800)"
              ></textarea>
              <template v-for="(error,i) in errors.Item.profile">
                <div class="validate-message" v-bind:key="i">{{error}}</div>
              </template>
            </div>

            <div class="form-group form_item dash-content-item">
              <label class="need-item">メイン写真</label>

              <template v-for="(image, index) in images">
                <template v-if="index ==0">
                  <div class="form_item form-group t-c" v-bind:key="index" :id="index">
                    <label :for="'image_' + index">
                      <img class="avatar_preview" :src="image.preview" alt="Hito">
                    </label>
                    <input
                      class="display_none file"
                      type="file"
                      :id="'image_' + index"
                      @change="onFileChange"
                    >
                    <input
                      placeholder="コメント: 春になると庭には桜が咲きます！"
                      type="text"
                      v-model="image.comment"
                      class="form-control"
                    >
                  </div>
                </template>
              </template>
            </div>
            <div class="form-group form_item dash-content-item">
              <label>サブ写真(4枚まで)</label>
              <template v-for="(image, index) in images">
                <template v-if="index > 0">
                  <div class="form_item form-group t-c" v-bind:key="index" :id="index">
                    <label :for="'image_' + index">
                      <img class="avatar_preview" :src="image.preview" alt="Hito">
                    </label>
                    <input
                      class="display_none file"
                      type="file"
                      :id="'image_' + index"
                      @change="onFileChange"
                    >
                    <input
                      placeholder="コメント: 家の外観です！"
                      type="text"
                      v-model="image.comment"
                      class="form-control"
                    >
                    <div class="imageDeleteButton" @click="deleteImage">写真の削除</div>
                  </div>
                </template>
              </template>
            </div>
            <div class="addImage" @click="addImageField" v-if="images.length < 5">写真を追加+</div>
            <div class="form-group form_item dash-content-item">
              <button
                type="submit"
                class="btn btn-outline-info login_btn signup-btn dash-submit"
                :disabled="goSubmit"
              >保存</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import axios from "axios";
import prefs from "../mixins/prefsMixin";

export default {
  props: {
    current_user: {
      name: String,
      state: String,
      city: String
    }
  },
  mixins: [ prefs ],

  data: function() {
    return {
      citys: [],
      change: false,
      categoryies: [],
      item: {
        title: "",
        profile: "",
        state: "高知県",
        city: "",
        price: "",
        category_id: "",
        is_rent: true,
        price: ""
      },
      images: [
        { file: "", comment: "", preview: "/assets/amp_house.png" },
        { file: "", comment: "", preview: "/assets/amp_house.png" }
      ],
      placeholder: {
        price: "例)1ヶ月 1万円~"
      },

      validation: {
        title: false,
        profile: false,
        loadtime: false
      },

      errors: {
        Item: {
          title: {
            unique: "",
            max: ""
          },
          profile: {
            max: ""
          }
        }
      }
    };
  },

  methods:{
    valiLong(event,model,name,max){
      if (event.target.value.length > max) {
        this.errors[model][name].max = `長すぎます${max}文字以下にしてください`;
      } else {
        this.errors[model][name].max = "";
      }
    },

    valiUnique: function(event, model, name) {
      axios
        .get("/api/check_unique", {
          params: { model: model, name: name, value: event.target.value }
        })
        .then(response => {
          if (response.data == "valid") {
            this.errors[model][
              name
            ].unique = `すでに使われています。変更してください`;
          } else {
            this.errors[model][name].unique = "";
          }
        });
    },

    deleteImage: function(event) {
      this.images.splice(event.path[1].id, 1);
    },
    addImageField: function() {
      this.images.push({
        file: "",
        commnet: "",
        preview: "/assets/amp_house.png"
      });
    },
    onFileChange: function(e) {
      var file = e.target.files[0];
      if (file && file.type.match(/^image\/(png|jpeg)$/)) {
        this.images[e.path[1].id].preview = URL.createObjectURL(file);
        this.images[e.path[1].id].file = file;
      }
    },

    setCategory: function() {
      axios.get("/api/get_items_category").then(response => {
        this.categoryies = response.data;
      });
    },
    setCity: function(val = 38) {
      let url = `https://opendata.resas-portal.go.jp/api/v1/cities?prefCode=${val +
        1}`;

      axios({
        headers: {
          "X-API-KEY": "sLXRi2Ovt21lcBxeFykUus8r0XIiHIAqtPrxntoW"
        },
        method: "get",
        url: url
      })
        .then(response => {
          this.citys = response.data.result;
        })
        .catch(error => {});
    },

    onChangeRent: function(event) {
      if (event == "true") {
        this.item.is_rent = "true";
        this.placeholder.price = "例)1ヶ月 1万円~";
      } else {
        this.item.is_rent = "false";
        this.placeholder.price = "例)100万円、応相談";
      }
    },

    changeState: function(event) {
      this.setCity(event.target.selectedIndex);
      this.item.city = "";
    },

    onsubmit: function() {
      if (this.images[0].file == "") {
        alert("メイン画像は必須です");
        return;
      }

      this.validation.loadtime = true;
      let data = new FormData();
      let item = this.item;

      for (let key in item) {
        data.append(key, item[key]);
      }

      for (var i = 0; i < this.images.length; i++) {
        let file = this.images[i].file;
        let comment = this.images[i].comment;
        data.append("files[" + i + "]", file);
        data.append("comment[" + i + "]", comment);
      }

      let config = {
        headers: {
          "content-type": "multipart/form-data"
        }
      };
      config.headers["X-HTTP-Method-Override"] = "POST";

      let main = this

      axios.post('/api/create_item', data, config)
        .then(
          response => {
            this.$emit("getCurrentUser")
            this.$emit("reloadAll")
            main.$router.push({ name: 'Item', params: { id: response.data.id, create: true} })
          }
        ).catch(function (response) {
          alert("通信エラーです")
          console.log(response);
        });
      this.validation.loadtime = false;
    }
  },

  computed: {
    // isValid: function () {
    //   var valid = true
    //   for (var key in this.validation) {
    //     if (!this.validation[key]) {
    //       valid = false
    //     }
    //   }
    //   return valid
    // },

    validTitle: function() {
      for (var key in this.errors.Item.title) {
        if (this.errors.Item.title[key]) {
          this.validation.title = true;
          return true;
        }
      }
      this.validation.title = false;
      return false;
    },

    validProfile: function() {
      for (var key in this.errors.Item.profile) {
        if (this.errors.Item.profile[key]) {
          this.validation.profile = true;
          return true;
        }
      }
      this.validation.profile = false;
      return false;
    },

    goSubmit: function() {
      for (var key in this.validation) {
        if (this.validation[key]) {
          return true;
        }
      }
      return false;
    }
  },


  mounted: function() {
    this.setCity();
    this.setCategory();
  }
};

</script>

<style scoped>
.content-box-area {
  display: flex;
  align-items: center;
}

.c-left-content {
  margin-right: 35px;
}

.c-right-content {
  min-width: 20%;
}

.dash-content {
  padding: 30px 250px 50px 250px;
}
.avatar_preview {
  border: 1px solid rgb(7, 5, 5);
  width: 40vw;
  height: 45vh;
  margin-left: 0;
}
.t-c {
  text-align: center;
  position: relative;
}

.imageDeleteButton {
  display: inline-block;
  position: absolute;
  top: 3px;
  left: 0;
  color: red;
  cursor: pointer;
  padding: 5px;
  border: 1px solid pink;
}

.imageDeleteButton:hover {
  color: pink;
}

.addImage {
  color: green;
  font-size: 1.3rem;
  cursor: pointer;
  display: inline-block;
  margin-bottom: 20px;
}

.addImage:hover {
  color: lightgreen;
}

@media screen and (max-width: 480px) {
  .avatar_preview {
    height: 20vh;
  }
}
</style>
