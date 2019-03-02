<template>
  <div id="footer">
    <b-container>
      <b-row>
        <b-col>運営会社</b-col>
        <b-col>サイトポリシー</b-col>
        <b-col>利用規約</b-col>
      </b-row>
      <b-row>
        <b-col>2018. Kspace©</b-col>
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
      }
    }
  }
}
</style>