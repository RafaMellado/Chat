import template from './_room.pug';

export default Vue.extend({
  template: template(),
  data() {
    return {
        user: undefined,
        room: []
    };
  },
  methods: {
  },
  created() {
    this.user = JSON.parse(localStorage.getItem('user'));
    API.room(this.$route.params.room_id, {headers: {Authorization: this.user.token}}).then(response => {
      this.room = response.data;
    });
  }
});
