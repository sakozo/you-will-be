/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)

//   console.log(app)
// })


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#week_time_form',
    data: {
      time1: "",
      time2: "",
      time3: ""
    },
    computed: {
      input_week_time: function () {
        if (this.time1 && this.time2 && this.time3 ) {
          var input_week_time =
          24*7 - (7*(this.time1) + 5*(this.time2) + 7*(this.time3));
          return input_week_time ;
        }else{
          return "";
        }
      },

      week_time: function () {
        if (this.time1 && this.time2 && this.time3 ) {
          var week_time =
          24*7 - (7*(this.time1) + 5*(this.time2) + 7*(this.time3));
          return "1週間で" + week_time + "時間です";
        }else{
          return "";
        }
      },

      week_day_time: function () {
        if (this.time1 && this.time2 && this.time3 ) {
          var week_day_time =
          24 - (Number(this.time1) + Number(this.time2) + Number(this.time3));
          return "平日: " + week_day_time + "時間";
        }else{
          return "";
        }
      },

      week_end_time: function () {
        if (this.time1 && this.time2 && this.time3 ) {
          var week_end_time =
          24 - (Number(this.time1) + Number(this.time3));
          return "休日: " + week_end_time + "時間";
        }else{
          return "";
        }
      }

    }
  })
})
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
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
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
