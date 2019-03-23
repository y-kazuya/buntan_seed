<template>
  <div id="footer">
    <b-container>
      <b-row>
        <b-col>運営者情報</b-col>
        <b-col>
          <router-link to="/privacy-poricy">
            プライバシーポリシー
          </router-link>
        </b-col>
        <b-col>利用規約</b-col>
      </b-row>
      <b-row>
        <b-col>2019. Vacant©</b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
export default {
  data: function() {
    return {};
  }
};
</script>
<style scoped lang="scss">
#footer {
  background-color: #17a2b8;

  .container {
    padding: 15px 10px;
    .row {
      .col {
        font-size: 15px;
        color: white;
        text-align: center;
        a {
          text-decoration: none;
          color: white;
        }
      }
    }
  }
}
</style>