<template>
  <div id="dash-sidebar">

    <div class="dash-sidebar-top">
      <p class="middle-title"> アカウント設定 </p>
    </div>

    <ul class="dash-sidebar-lists">
      <li  v-for="(link, key, index) in links" :key="index"
        :class="[link.name == '基本情報' ?'dash-sidebar-active': '','dash-sidebar-list']">
        <a :href="link.path" class="link-fix">{{link.name}}</a>
      </li>
    </ul>

  </div>
</template>

<script>
export default {
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
      ]
    };
  }
};
</script>
<style scoped lang="scss">

</style>