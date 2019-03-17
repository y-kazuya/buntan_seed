import Vue from "vue";
import VueRouter from "vue-router";

import App from "../app.vue";
import MainVue from "../components/main_vue.vue";
import ItemDetail from "../components/item_detail.vue";
import UserEdit from "../components/user_edit.vue";
import AboutVue from "../components/about_vue.vue";
import PrivacyPoricy from "../components/privacy_policy.vue";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: MainVue },
    { path: "/about", component: AboutVue },
    {
      path: "/item/:id",
      name: "Item",
      component: ItemDetail,
      props: route => ({ id: Number(route.params.id) })
    },
    { path: "/user/edit", component: UserEdit },
    { path: "/privacy-poricy", component: PrivacyPoricy }
  ]
});

export default router;
