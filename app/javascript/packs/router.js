import Vue from "vue";
import VueRouter from "vue-router";

import App from "../app.vue";
import MainVue from "../components/main_vue.vue";
import ItemDetail from "../components/item_detail.vue";
import UserEdit from "../components/user_edit.vue";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: MainVue },
    {
      path: "/item/:id",
      name: "Item",
      component: ItemDetail,
      props: route => ({ id: Number(route.params.id) })
    },

    { path: "/user/edit", component: UserEdit},
  ]
});

export default router;
