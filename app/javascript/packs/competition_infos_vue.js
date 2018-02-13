import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
import Qs from 'qs'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ja'
import 'element-ui/lib/theme-chalk/index.css'

Vue.use(ElementUI, { locale })

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue( {
    el: '#competition-infos-index',
    data: function() {
      return {
        competitioninfos: [],
        query: {
          day_gteq: null,
          day_lteq: null,
          name_cont: null,
          place: null
        }
      }
    },
    created: function() {
      this.search()
    },
    methods:{
      notify: function(msg) {
        this.$notify({
          type: 'error',
          title: 'Error',
          message: msg
        });
      },
      search: function() {
        axios.get('/api/competition_infos/search', {
          headers: {
            'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
          },
          params: {
            q: this.query
          },
          paramsSerializer: function(params) {
            return Qs.stringify(params, {arrayFormat: 'brackets'})
          }
        })
        .then((response) => {
          console.log(response);
          this.competitioninfos = response.data.competitioninfos;
        })
        .catch((error) => {
          console.log(error);
          this.notify(error.message);
        })
      }
    }
  })
})

// Vue.component('competition-infos-grid', {
//   template: '#competition-infos-template',
//   props: {
//     data: Array,
//     columns: Array,
//     filterKey: String
//   },
//   data: function () {
//     var sortOrders = {}
//     this.columns.forEach(function (key){
//       sortOrders[key] = 1
//     })
//     return {
//       sortKey: '',
//       sortOrders: sortOrders
//     }
//   },
//   computed: {
//     filteredData: function() {
//       var sortKey = this.sortKey
//       var filterKey = this.filterKey && this.filterKey.toLowerCase()
//       var order = this.sortOrders[sortKey] || 1
//       var data = this.data
//       if (filterKey) {
//         data = data.filter(function (row) {
//           return Object.keys(row).some(function (key) {
//             return String(row[key]).toLowerCase().index0f(filterKey) > -1
//           })
//         })
//       }
//       if (sortKey) {
//         data = data.slice().sort(function (a,b) {
//           a = a[sortKey]
//           b = b[sortKey]
//           return (a == b ? 0 : a > b ? 1 : -1) * order
//         })
//       }
//       return data
//     }
//   },
//   filters: {
//     capitalize: function (str) {
//       return str.charAt(0).toUpperCase()  str.slice(1)
//     }
//   },
//   methods: {
//     sortBy: function (key) {
//       this.sortKey = key
//       this.sortOrders[key] = this.sortOrders[key] * -1
//     }
//   }
// })
//
// var app = new Vue({
//   el: '#competition_infos',
//   data: {
//     searchQuery: '',
//     gridColumns: ['day', 'name', 'place'],
//     gridData: []
//   }
// })
