import template from './index.pug';

export default Vue.extend({
  template: template(),
  data() {
    return {
      user: undefined,
      rooms: []
    };
  },
  methods: {
    goToRoom(room) {
      //localStorage.setItem('room', JSON.stringify(room));
      this.$router.push({name: 'room', params: { room_id: room.id}});
    }
  },
  created() {
    this.user = JSON.parse(localStorage.getItem('user'));
    API.rooms({headers: {Authorization: this.user.token}}).then(response => {
      this.rooms = response.data;
    });
  }
});
