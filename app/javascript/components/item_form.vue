<template>
    <div id="dash-wrapper">
    <div class="dash-left-warpper">
      <div class="dash-content">
        <div class="dash-content-title middle-title">
           新規資産登録
        </div>
        <div class="user-form dash-content-main">
          <form @submit.prevent="onsubmit">
            <div class="form-group form_item dash-content-item">
                <label for="user_name" class="need-item">タイトル</label>
                <input placeholder="土佐市のあきやま" required="required" type="text" v-model="item.title" id="item_title" class="form-control">
            </div>

            <div class="form-group form_item dash-content-item">
              <label for="user_state" class="need-item" >都道府県</label>
              <select class="select_state form-control" @change="changeState($event)" v-model="item.state">
                <template v-for="pref in prefs">
                  <option v-if="pref.name ==`高知県`" v-bind:value="pref.name" v-bind:key="pref.id" :data-id="pref.id" selected>
                    {{pref.name}}
                  </option>
                  <option v-else v-bind:value="pref.name" v-bind:key="pref.id" :data-id="pref.id" >
                    {{pref.name}}

                  </option>

                </template>
              </select>
            </div>

            <div class="form-group form_item">
              <label class="need-item" for="item_city">市町村</label>
              <select required="required" class="select_citys form-control" id="item_city" v-model="item.city">
                <option value="">市町村を選択してください</option>
                <template v-for="city in citys">
                  <option v-bind:value="city.cityName" v-bind:key="city.cityCode">
                    {{city.cityName}}
                  </option>
                </template>
              </select>
            </div>

            <div class="form-group form_item">
              <label class="need-item" for="item_category">資産カテゴリー</label>
              <select required="required" class="form-control" id="item_category" v-model="item.category_id">
                <option value="">カテゴリーを選択してください</option>
                <template v-for="category in categoryies">

                  <option v-bind:value="category.id" v-bind:key="category.name">
                    {{category.name}}
                  </option>
                </template>
              </select>
            </div>

            <div class="content-box">
              <div class="content-title need-item">
                貸し出しタイプ/値段
              </div>

              <div class="content-box-area">
                <b-form-group class="form-group c-left-content">
                  <b-form-radio v-model="item.is_rent" name="some-radios" value="true" v-on:change="onChangeRent">賃貸</b-form-radio>
                  <b-form-radio v-model="item.is_rent" name="some-radios" value="false" v-on:change="onChangeRent">販売</b-form-radio>
                </b-form-group>

                <div class="form_item form-group c-right-content">

                  <input :placeholder="placeholder.price" required="required" type="text" v-model="item.price" id="item_price" class="form-control" >
                </div>
              </div>
            </div>

            <div class="form-group form_item dash-content-item">
              <label for="item_profile">説明文</label>
              <textarea id="item_profile" class="form-control" v-model="item.profile" required></textarea>
            </div>

            <template v-for="(image, index) in images">
              <template v-if="index ==0">
                <div class="form_item form-group" v-bind:key="index" :id="index">
                  メイン写真{{image.preview}}
                  <label :for="'image_' + index">
                    <img class="avatar_preview" :src="image.preview" alt="Hito">
                  </label>
                  <input class="display_none file" type="file" :id="'image_' + index" @change="onFileChange">
                  <input placeholder="土佐 太郎"  type="text" v-model="image.comment" class="form-control">
                </div>
              </template>
              <template v-else>
                <div class="form_item form-group" v-bind:key="index" :id="index">
                  サブ画像(4マイまで){{image.preview}}
                  <label :for="'image_' + index">
                    <img class="avatar_preview" :src="image.preview" alt="Hito">
                  </label>
                  <input class="display_none file" type="file" :id="'image_' + index" @change="onFileChange">
                  <input placeholder="土佐 太郎"  type="text" v-model="image.comment" class="form-control">
                  <div class="imageDeleteButton" @click="deleteImage"> X</div>
                </div>
              </template>
            </template>
            <div class="addImage" @click="addImageField" v-if="images.length < 5">
              写真を追加{{images.length}}
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

  data: function(){
    return {
      citys: [],
      change: false,
      validation: {
        title: false
      },
      categoryies: [],
      item: {
        title: "",
        profile: "",
        state: "高知県",
        city: "",
        price: "",
        category_id: "",
        is_rent: "",
        price: "",
      },
      images: [
        {file: "", comment: "", preview: "/assets/hito-f386204efbe5a1895129239362ab0d5dc306159d195d467343a97f9ef5f4adab.jpg"},
        {file: "", comment: "", preview: "/assets/hito-f386204efbe5a1895129239362ab0d5dc306159d195d467343a97f9ef5f4adab.jpg"}
      ],
      placeholder: {
        price: "貸し出しタイプを選択してください"
      }
    };
  },

  methods:{
    deleteImage: function(event){
      console.log(event.path[1].id)
      this.images.splice(event.path[1].id, 1)
    },
    addImageField: function(){
      console.log("add")
      this.images.push({file: "", commnet: "", preview: "/assets/hito-f386204efbe5a1895129239362ab0d5dc306159d195d467343a97f9ef5f4adab.jpg"})
    },
    onFileChange: function(e) {

      var file = e.target.files[0];
        if(file && file.type.match(/^image\/(png|jpeg)$/)){
            this.images[e.path[1].id].preview = URL.createObjectURL(file);
            this.images[e.path[1].id].file = file
        }
    },

    setCategory: function(){
      axios.get("/api/get_items_category").then(response => {
        this.categoryies = response.data
      });
    },
    setCity: function(val = 38){

      let url = `https://opendata.resas-portal.go.jp/api/v1/cities?prefCode=${val + 1}`

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

    onChangeRent: function(event){
      if (event == "true"){
        this.item.is_rent = "true"
        this.placeholder.price = "例)1ヶ月 1万円~"
      }
      else {
      this.item.is_rent = "false"
      this.placeholder.price = "例)100万円、応相談"
      }
      console.log(this.item.is_rent)
    },


    changeState: function(event){
      this.setCity(event.target.selectedIndex)
      this.item.city= ""
      console.log(this.images[0].file)
    },

    onsubmit: function(){
      const item = this.item
      let files = new FormData();
      let file = this.images[0].file
      // for (var i = 0; i < this.images.length; i++) {
      //   let file = this.images[i].file;
      //   files.append('files[' + i + ']', file);
      // }

      // files.append("imageeeee", this.images[0].file);

      // console.log(files)

      axios({
        method: 'post',
        url: '/api/create_item',
        data: {item: item}
        })
        .then(function (response) {

          alert("登録に成功しました！");
        })
        .catch(function (response) {
            //handle error
            console.log(response);
        });

      // files.append('yourFileKey', this.images[0].file);
      // axios({
      //   method: 'post',
      //   url: '/api/create_item',
      //   data: {
      //     item: item,
      //     file: files
      //   },
      //   config: { headers: {'content-type' : 'multipart/form-data'}}
      // })
      // .then(response => {
      //   console.log("suc")
      // }).catch(error => {
      //   console.log(error);
      // });

      files.append('avatar', file)

      console.log(files)
      let config = {
          headers: {
              'content-type': 'multipart/form-data'
          }
      };

      axios.post('/api/create_item', files, config)
      .then(function(response) {

        console.log(response);
      })
      .catch(function(error) {
        console.log(error);
      });








    },

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
    },
    // categoryies: function(){

    //   axios.get("/api/get_items_category").then(response => {
    //     console.log(response.data)
    //     return response.data
    //   });

    // }
  },


  mounted: function(){

    this.setCity()
    this.setCategory()
  },
  beforeDestroy: function(){
    this.$emit("get_current_user")
  }
}
</script>

<style lang="scss">

  .content-box-area{
    display: flex;
    align-items: center;
  }

  .c-left-content{
    margin-right: 35px;
  }

  .c-right-content{
    min-width: 20%;
  }
</style>
