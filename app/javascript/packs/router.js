import Vue from "vue";
import VueRouter from "vue-router";

import App from "../app.vue";
import MainVue from "../components/main_vue.vue";
import ItemDetail from "../components/item_detail.vue";

import ItemForm from "../components/item_form.vue"
import NotFoundComponent from '../components/NotFoundComponent.vue'
import UserBasic  from "../components/user_basic.vue"
import UserNew from "../components/user_new.vue"
import UserEdit from "../components/user_edit.vue";
import AboutVue from "../components/about_vue.vue";
import PrivacyPoricy from "../components/privacy_policy.vue";


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
    { path: "/about", component: AboutVue },
    {
      path: "/item/:id",
      name: "Item",
      component: ItemDetail,
      props: route => ({ id: Number(route.params.id) })
    },
    { path: '*', component: NotFoundComponent },

    { path: "/user/edit", component: UserEdit },
    { path: "/privacy-poricy", component: PrivacyPoricy }
  ],
                             
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    } else {
      return { x: 0, y: 0 };
    }
  }

});

router.afterEach((to, from) => {
  if (to.meta && to.meta.title) {
    document.title = to.meta.title
  }
})


export default router;
