import VueResource from 'vue-resource';

import DefaultLayout from 'js/layouts/default';

import router from 'js/router.js';
import store from 'js/vuex/store.js';
import i18n from 'js/i18n.js';

import ActionCable from 'actioncable';

// ActionCable
Vue.$cableConnection = null;
Vue.$cable = () => {
  if (!Vue.$cableConnection) {
    Vue.$cableConnection = ActionCable.createConsumer(`${WS_HOST}`);
  }
  return Vue.$cableConnection;
};
import Vue from 'vue';

require('scss/main.scss');

/* --- Vue-Resource --- */
Vue.router = router;
Vue.store = store;

Vue.use(VueResource);

import VueMoment from 'vue-moment';
import moment from 'moment';
import 'moment/locale/es';
Vue.use(VueMoment);

Vue.moment();

moment.locale('es');

moment.updateLocale('es', {
  relativeTime : {
    
  }
});

Vue.http.options.root = API_HOST;
Vue.http.headers.common['Access-Control-Allow-Origin'] = 'Content-Type'

// Create and mount the root instance.
// Make sure to inject the router with the router option to make the
// whole app router-aware.
new Vue({
  router,
  store,
  i18n,
  components: {
    DefaultLayout,
  }
}).$mount('#app');
