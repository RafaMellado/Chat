import template from './index.pug';

import Modal from './_modal.js';

let subscription = undefined;

export default Vue.extend({
  template: template(),
  components: {
    Modal
  },
  data() {
    return {
      user: undefined,
      rooms: [],
      showModal: false
    };
  },
  methods: {
    async getRooms() {
      await API.rooms({headers: {Authorization: this.user.token}}).then(response => {
        this.rooms = response.data;
      });
    },
    goToRoom(room) {
      this.$router.push({name: 'room', params: { room_id: room.id}});
    },
    openModal() {
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },
    unsubscribe() {
      this.$cable.unsubscribe('RoomsChannel');
    }
  },
  created() {
    const vm = this;
    this.user = JSON.parse(localStorage.getItem('user'));
    this.getRooms();

    subscription = Vue.$cable().subscriptions.create({channel: 'RoomsChannel'},
    {
      received(data) {
        vm.rooms.push(data);
      }
    });
  },
  destroyed() {
    Vue.$cable().subscriptions.remove(subscription);
  }
});
