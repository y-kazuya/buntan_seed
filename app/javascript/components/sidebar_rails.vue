<template>
  <div id="dash-sidebar">
    <div class="dash-sidebar-main" v-bind:class='{toggle_sidebar:side_lists.sideOpne}' >
      <div class="dash-sidebar-top">
        <p class="middle-title"> {{side_lists.sideTitle}} </p>
      </div>

      <ul class="dash-sidebar-lists">
        <template v-for="(link, key, index) in side_lists.links">
          <router-link class="d-link" :to="{ name: link.path_name}" :key="index">
            <li :class="[link.name == '基本情報' ?'dash-sidebar-active': '','dash-sidebar-list']" >
              {{link.name}}
            </li>
           </router-link>
        </template>
      </ul>
    </div>
    <div id="side-open">
      <button type="button" class="btn btn-secondary sidebar-open-button" v-on:click='side_lists.sideOpne=!side_lists.sideOpne'>＜＜メニュー</button>
    </div>
  </div>
</template>

<script>
export default {
  props: ["side_lists"],
  data: function() {
    return {
      links:[
        {
          name: "基本情報",
          path: "#",
        },
        {
          name: "お支払い情報",
          path: "#",
        },
        {
          name: "アカウント",
          path: "#",
        },
        {
          name: "設定",
          path: "#",
        },
      ],
      sideTitle: "アカウント設定",
      sideOpne: true
    };
  },

  methods:{
    openSidebar: function(){

    }
  },

};
</script>
<style scoped lang="scss">

</style>