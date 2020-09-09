import axios from 'axios';


export default {

    getRestaurants() {
        return axios.get('/restaurant');
    },

    getRestaurant() {
        return axios.get('/restaurant/${restaurantId}')
    }
}