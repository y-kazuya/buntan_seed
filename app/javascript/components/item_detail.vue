<template>
  <div id="item-mobile">
    <b-card no-body
            style="max-width: 100%;"
            img-src="https://picsum.photos/600/300/?image=25"
            img-alt="Image"
            img-top>
        <h4 slot="header">馬路村の山奥</h4>
        <b-card-body>
          <p class="card-text">
              周りには、川がたくさんあり、魚の釣り場もあったりして色々なアクティビティを楽しめます！ハンモックと、雨が降ったらログキャビンも利用できます。
          </p>
        </b-card-body>
        <b-list-group flush>
          <b-list-group-item>カテゴリ</b-list-group-item>
          <b-list-group-item>築年数</b-list-group-item>
          <b-list-group-item>住所</b-list-group-item>
        </b-list-group>
        <div class="clearfix">
          <b-img left src="https://picsum.photos/125/125/?image=58" alt="left image" />
          <h4>空き家太郎</h4>
          <p>出身地：高知県幡多郡中村市</p>
          <p>職業：中村市役所職員</p>
          <p>評価：★★★★☆</p>
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
  </div>
</template>
<script>
export default {
  data: function() {
    return {
      message: "item detail!"
    };
  }
};
</script>
<style scoped lang="scss">
@media screen and (max-width: 800px) {
  #item-mobile {
    .map {
      margin: 5px;
    }
  }
}

@media screen and (min-width: 801px) {
  #item-mobile {
    display: none;
  }
}
</style>
