import Vue from "vue";
import VueRouter from "vue-router";

import App from "../app.vue";
import MainVue from "../components/main_vue.vue";
import ItemDetail from "../components/item_detail.vue";

Vue.use(VueRouter);

const routes = [
  { path: "/", component: MainVue },
  { path: "/item", component: ItemDetail }
];

export default new VueRouter({ routes });
