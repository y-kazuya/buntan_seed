/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from "vue";
import BootstrapVue from "bootstrap-vue";
import App from "../app.vue";

import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.body.appendChild(document.createElement("hello"));
  new Vue({
    el: "#app",
    render: h => h(App)
  });
  console.log(app);
});

Vue.use(BootstrapVue);

// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// import Vue from "vue";
// import Vue from "vue/dist/vue.esm";
// import App from "../components/app.vue";

// document.addEventListener("DOMContentLoaded", () => {
//   const app = new Vue({
//     el: "#navbar",
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   });
// });

//
//
//
// If the using turbolinks, install 'vue-turbolinks':
//
// yarn add 'vue-turbolinks'
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
