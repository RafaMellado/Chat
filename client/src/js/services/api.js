import Vue from "vue";

export default {
    login(params) {
        return Vue.http.post('auth/login', params);
    },
    rooms(params) {
        return Vue.http.get('rooms', params);
    },
    room(room, params) {
        return Vue.http.get(`rooms/${room}`, params);
    },
    sendMessage(message, params) {
        return Vue.http.post('messages', message, params);
    },
    sendRoom(room, params) {
        return Vue.http.post('rooms', room, params);
    }
};
