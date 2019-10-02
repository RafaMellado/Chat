import Vue from "vue";

export default {
    login(params) {
        return Vue.http.post('http://localhost:3000/auth/login', params);
    },
    rooms(params) {
        return Vue.http.get('http://localhost:3000/rooms', params);
    },
    room(room, params) {
        return Vue.http.get(`http://localhost:3000/rooms/${room}`, params);
    },
    sendMessage(message, params) {
        return Vue.http.post('http://localhost:3000/messages', message, params);
    },
    sendRoom(room, params) {
        return Vue.http.post('http://localhost:3000/rooms', room, params);
    }
};
