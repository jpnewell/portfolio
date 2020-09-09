import axios from 'axios';

export default {

    addFavoriteRestaurant(restaurant){
        return axios.post('/like', restaurant)
    },

    getFavoriteRestaurants(){
        return axios.get(`/like`)
    },

    deleteFavoriteRestaurants(restaurantId){
        return axios.delete(`/like/${restaurantId}`)
    }

}
