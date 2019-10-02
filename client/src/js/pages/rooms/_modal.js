import template from './_modal.pug';

export default Vue.extend({
  template: template(),
  data() {
    return {
        room: undefined,
        errors: []
    };
  },
  methods: {
    closeModal() {
        this.$emit('close-modal');
    },
    async postRoom(e) {
        e.preventDefault();
        this.errors = [];

        try {
            await API.sendRoom({name: this.room},{
                headers: {Authorization: JSON.parse(localStorage.getItem('user')).token}
            });
            this.closeModal();
        } catch (error) {
            if (error.status === 422) {
                this.errors.push("La sala tiene que tener entre 4 y 40 caracteres");
            }
            else if(error.status === 409) {
                this.errors.push("Ya existe esa sala");
            }
            else {
                this.errors.push("Error de servidor");
            }
        }
        
    }
  }
});
