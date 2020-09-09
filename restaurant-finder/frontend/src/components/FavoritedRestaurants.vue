<template>
  <div class = "restaurants">
    <h1 class = "header">Favorite Restaurants!</h1>
    <div class="d-flex">
    <div v-for="restaurant in favoriteRestaurants" v-bind:key="restaurant.restaurantid">
      <div class="container">
      <b-button class="btn" v-bind:id="restaurant.restaurantId" @click="showModal($event)">{{restaurant.restaurantName}}</b-button>
      <img class="plate-img" src="@/assets/plate-for-background.png">
      </div>
      <b-modal v-bind:id="restaurant.restaurantId.toString()" hide-footer>
        <template v-slot:modal-title>
          <h3>{{restaurant.restaurantName}}</h3>
          <div class="d-inline">
          <p class="d-inline p-2">Number: ({{restaurant.restaurantPhonenumber}})</p> 
          <b-button class="d-inline p-2 bg-danger" @click="removeRestaurant(restaurant.restaurantId)">UNFAVORITE</b-button>
          </div>
        </template>
        <div class="d-block">
          <li>{{restaurant.restaurantDescription}}</li>
          <li>{{restaurant.covidMessage}}</li>
          <div class ="text-center">
            <iframe  v-bind:src="restaurant.mapUrl" width="400" height="250" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
        </div>
          <b-button class="mt-3" v-bind:id="restaurant.restaurantId" block @click="hideModal($event)">Close Me</b-button>
      </b-modal>
    </div>
    </div>
  </div>   
</template>


<script>

import favoriteRestaurantsService from '@/services/FavoriteRestaurantsService'

export default {

    name: 'favorited-restaurants',
    data() {
        return {
          favoriteRestaurants: [],
          showDetails: null,
        }          
        },
    created() {
        
        favoriteRestaurantsService.getFavoriteRestaurants()
        .then(response => {
            this.favoriteRestaurants = response.data;
        });
    },
    methods: {
      showModal(event) {
        console.log(event)
        this.$bvModal.show(event.currentTarget.id);
      },
      hideModal(event) {
        this.$bvModal.hide(event.currentTarget.id);
      },
      removeRestaurant(id) {
        console.log(event)
        favoriteRestaurantsService.deleteFavoriteRestaurants(id).then(response => {
          if(response.status == 204)
          {
            location.reload();
          }
        })
      }
  }
}
    
    </script>
 
 <style>
 
.header {
    height: 14vh;
    margin-top: 11vh;
    size: 10vh;
    color: blanchedalmond;
}

.btn {
    margin-top: 5vh;
    width: 16vh;
}

.d-flex {
  flex-direction: row;
  justify-content: center;
  flex-wrap: wrap;
  margin-left: 10vh;
  margin-right: 40vh;
}

.d-flex>div {
  width: 20%;
}

.plate-img {
  width: 28vh;
}

.container {
  position: relative;
  width: 50%;
}


.container .btn {
  position: absolute;
  top: 25%;
  left: 105%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  background-color: maroon;
  color: blanchedalmond;
  font-size: 2vh;
  border: none;
}

.container .btn:hover {
  background-color: black;
}

 </style>
