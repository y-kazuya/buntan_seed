import Vue from "vue";
import VueRouter from "vue-router";

import App from "../app.vue";
import MainVue from "../components/main_vue.vue";
import ItemDetail from "../components/item_detail.vue";

import ItemForm from "../components/item_form.vue"
import NotFoundComponent from '../components/NotFoundComponent.vue'
import UserBasic  from "../components/user_basic.vue"
import UserNew from "../components/user_new.vue"
import AboutVue from "../components/about_vue.vue";
import PrivacyPoricy from "../components/privacy_policy.vue";
import UserItems from "../components/user_items.vue"
import ItemBasic from "../components/item_basic.vue"
import axios from "axios";

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
    { path: "/item/new", component: ItemForm ,meta: {requiresAuth: true}},
    { path: "/user/basic", component: UserBasic ,meta: {requiresAuth: true}},
    { path: "/user/new", component: UserNew ,meta: {NonrequiresAuth: true}},
    { path: "/about", component: AboutVue },
    {
      path: "/item/:id",
      name: "Item",
      component: ItemDetail,
      props: route => ({ id: Number(route.params.id) }),
    },
    {
      path: "/item/:id/basic",
      name: "Item_basic",
      component: ItemBasic,
      props: route => ({ id: Number(route.params.id) })
    },
    { path: '*', component: NotFoundComponent },
    { path: "/privacy-poricy", component: PrivacyPoricy },
    {
      path: "/user/:id/items",
      name: "userItem",
      component: UserItems,
      props: route => ({ id: Number(route.params.id) })
    },
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
});

router.beforeEach((to, from, next) => {



  if(to.matched.some(record => record.meta.requiresAuth) ){ //login 必要

    axios.get("/api/check_login").then(response => { // login認証
      if (response.data){
        next()
      }else {
        next({path: '/'})
      }
    });
  }
  else {
   next()
  }

  if(to.matched.some(record => record.meta.NonrequiresAuth) ){ //login 必要

    axios.get("/api/check_login").then(response => { // login認証
      if (!response.data){
        next()
      }else {
        next({path: '/'})
      }
    });
  }
  else {
   next()
  }

})


export default router;
