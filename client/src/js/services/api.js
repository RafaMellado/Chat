export default {
    index(params) {
        return Vue.http.get('http://localhost:3000/users', params).then(
            response => {
                return response.data;
            }
        );
    },
    create(params) {
        return Vue.http.post('http://localhost:3000/users', params);
    },
};
