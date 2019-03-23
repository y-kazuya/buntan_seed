import Vue from "vue";
import VueRouter from "vue-router";

import App from "../app.vue";
import MainVue from "../components/main_vue.vue";
import ItemDetail from "../components/item_detail.vue";
import ItemForm from "../components/item_form.vue"
import NotFoundComponent from '../components/NotFoundComponent.vue'
import UserBasic  from "../components/user_basic.vue"
import UserNew from "../components/user_new.vue"


Vue.use(VueRouter);

const router = new VueRouter({
  scrollBehavior (to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { x: 0, y: 0 }
    }
  },
  mode: "history",
  routes: [
    { path: "/", component: MainVue },
    { path: "/item/new", component: ItemForm},
    { path: "/user/basic", component: UserBasic},
    { path: "/user/new", component: UserNew},
    {
      path: "/item/:id",
      name: "Item",
      component: ItemDetail,
      props: route => ({ id: Number(route.params.id) })
    },
    { path: '*', component: NotFoundComponent },
  ]
});

router.afterEach((to, from) => {
  if (to.meta && to.meta.title) {
    document.title = to.meta.title
  }
})


export default router;
