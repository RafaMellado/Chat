import template from './index.pug';

export default Vue.extend({
  template: template(),
  data() {
    return {
      name: undefined,
      errors: []
    };
  },
  methods: {
    sendUser(e) {
      e.preventDefault();
      this.errors = [];

      if(this.name) {
        API.create({name: this.name}).then(response => {},
          (response) => {
            console.log(response);
            if (response.status === 422) {
              this.errors.push("El nombre tiene que tener al menos, 4 caracteres y máximo 40");
            }
            if (response.status === 409) {
              this.errors.push("El nombre " + this.name + " ya está en uso.");
            }
        });
      }
    }
  }
});
