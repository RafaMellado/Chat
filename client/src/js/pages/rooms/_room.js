import template from './_room.pug';

let subscription = undefined;

export default Vue.extend({
  template: template(),
  data() {
    return {
        user: undefined,
        message: undefined,
        room: []
    };
  },
  methods: {
    async postMessage() {
      await API.sendMessage(
        {
          text: this.message,
          room_id: this.room.id,
          user_id: this.user.id
        },{
          headers: {Authorization: this.user.token}
        });
    },
    async getRooms() {
      await API.room(this.$route.params.room_id, {headers: {Authorization: this.user.token}}).then(response => {
        this.room = response.data;
      });
    },
    sendMessage(e) {
      e.preventDefault();
      this.postMessage();
      this.message = '';
    },
    unsubscribe() {
      this.$cable.unsubscribe('RoomChannel');
    }
  },
  created() {
    const vm = this;

    this.user = JSON.parse(localStorage.getItem('user'));
    this.getRooms();
        
    this.$nextTick( () => {
      vm.room = JSON.parse(JSON.stringify(vm.room));
      subscription = Vue.$cable().subscriptions.create({channel: 'RoomChannel', room: this.$route.params.room_id},
      {
        received(data) {
          vm.room.messages.push(data);
        }
      });
    });
  },
  destroyed() {
    Vue.$cable().subscriptions.remove(subscription);
  }
});
