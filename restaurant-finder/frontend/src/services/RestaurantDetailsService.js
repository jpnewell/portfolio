import axios from 'axios';


export default {
    getRestaurantDetails(restaurantId) {
        return axios.get(`/Restaurant/${restaurantId}/details`);
    },
}