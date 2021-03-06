import VueRouter from 'vue-router';

// Pages
import Home from './pages/home/index.js';
import Rooms from './pages/rooms/index.js';

import Room from './pages/rooms/_room.js';

// Le indicamos a Vue que use VueRouter
Vue.use(VueRouter);

// Componente vacio para usarlo en las rutas padres
const RouteParent = {render(c) { return c('router-view'); }};

// Each route should map to a component. The 'component' can
// either be an actual component constructor created via
// Vue.extend(), or just a component options object.
// We'll talk about nested routes later.

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    meta: {
      layout: 'default',
    }
  },
  {
    path: '/rooms',
    name: 'rooms',
    component: Rooms,
    meta: {
      layout: 'default',
      auth: true
    }
  },
  {
    path: '/rooms/:room_id',
    name: 'room',
    component: Room,
    meta: {
      layout: 'default',
      auth: true
    }
  },
  {
    path: '*',
    redirect: '/'
  }
];

// Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = new VueRouter({routes});

router.beforeEach((to, from, next) => {
  if (to.meta.auth === true && localStorage.getItem('user') === null) {
    next({name: 'home'});
  } else {
    next();
  }
});

export default router;
