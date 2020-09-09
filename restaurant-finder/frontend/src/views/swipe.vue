<template>
  <section>
    <navigation-bar />
      <div
      v-if="current"
      class="fixed fixed--center"
      style="z-index: 3"
      :class="{ 'transition': isVisible }">

      <Vue2InteractDraggable
        v-if="isVisible"
        :interact-out-of-sight-x-coordinate="1000"
        :interact-max-rotation="15"
        :interact-x-threshold="500"
        :interact-y-threshold="500"
        :interact-event-bus-events="interactEventBus"
        interact-block-drag-down
        @draggedRight="emitAndNext('match')"
        @draggedLeft="emitAndNext('reject')"
        class="rounded-borders card card--one">
        <div style ="height: 100%">
        <img :src="require(`@/assets/${current.image}`)" class="rounded-borders" />
        <div class="text">
        <h2>{{current.name}}, {{current.types[0]}}, {{current.zipCode}}</h2>
        </div>
        </div>
      </Vue2InteractDraggable>
    </div>
    <div v-if="next" class="rounded-borders card card--two fixed fixed--center" style="z-index: 2">
      <div class="flex flex--center" style="height: 100%">
        <img :src="require(`@/assets/${next.image}`)" class="rounded-borders" />
        <h1>{{next.text}}</h1>
      </div>
    </div>
    <div
      v-if="index + 2 < restaurantArray.length"
      class="rounded-borders card card--three fixed fixed--center"
      style="z-index: 1" >
      <div style="height: 100%"></div>
    </div>
    <div class="footer fixed">
      <div class="btn btn--decline" @click="reject">
        <i class="material-icons">Reject</i>
      </div>
    <div class="favorites">
      <input type="button" onclick="location.href='/favorites';"
       value="Click here to view your favorite restauarants!"/> 
    </div>
      <div class="btn btn--like" @click="match" >
        <i class="material-icons">Like</i>
      </div>
    </div>
  </section>
</template>
<script>
import { Vue2InteractDraggable, InteractEventBus } from "vue2-interact";
import NavigationBar from '@/components/NavigationBar.vue';

const EVENTS = {
  MATCH: "match",
  REJECT: "reject"
}
import RestaurantService from '../services/RestaurantService'
import FavoriteRestaurantService from '../services/FavoriteRestaurantsService'
export default {
  name: "SwipeableCards",
  components: { Vue2InteractDraggable, NavigationBar },
  data() {
    return {
      restaurantArray: [],
      isVisible: true,
      index: 0,
      interactEventBus: {
        draggedRight: EVENTS.MATCH,
        draggedLeft: EVENTS.REJECT
      },
      favoriteRestaurants: {
        restaurantId: '', 
      }
    };
  },
    created(){
      RestaurantService.getRestaurants().then(r =>{
      this.restaurantArray = r.data
      })
  },
  computed: {
    current() {
      return this.restaurantArray[this.index]
    },
    next() {
      return this.restaurantArray[this.index + 1]
    },
  },
  methods: {
    match() {
      InteractEventBus.$emit(EVENTS.MATCH);
    },
    reject() {
      InteractEventBus.$emit(EVENTS.REJECT)
    },
    emitAndNext(event) { 
      if(event === 'match'){
      this.favoriteRestaurants = this.restaurantArray[this.index];
      FavoriteRestaurantService
      .addFavoriteRestaurant({"RestaurantId": this.favoriteRestaurants.restaurantId
      })
      .then(response => {
        if (response.status === 201) {
          // 
        }
      })
      }
      this.$emit(event, this.index);
      setTimeout(() => (this.isVisible = false), 200)
      setTimeout(() => {
        this.index++
        this.isVisible = true
      }, 200)
    }}}
</script>

<style lang="scss" scoped>

.footer {
  width: 77vw;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  padding-bottom: 30px;
  justify-content: space-around;
  align-items: center;
}
.btn {
  position: relative;
  width: 125px;
  height: 75px;
  padding: 0.2rem;
  border-radius: 50%;
  background-color: white;
  box-shadow: 0 6px 6px -3px rgba(0, 0, 0, 0.02),
    0 10px 14px 1px rgba(0, 0, 0, 0.02), 0 4px 18px 3px rgba(0, 0, 0, 0.02);
  cursor: pointer;
  transition: all 0.3s ease;
  user-select: none;
  -webkit-tap-highlight-color: transparent;
  &:active {
    transform: translateY(4px);
  }
  i {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    &::before {
      content: "";
    }
  }
  &--like {
    background-color: chartreuse;
    padding: 0.5rem;
    color: black;
    box-shadow: 0 10px 13px -6px rgba(0, 0, 0, 0.2),
      0 20px 31px 3px rgba(0, 0, 0, 0.14), 0 8px 38px 7px rgba(0, 0, 0, 0.12);
    i {
      font-size: 32px;
    }
  }
  &--decline {
    background-color: red;
    color: black;
     font-size: 32px;
  }
}

.flex {
  display: flex;
  &--center {
    align-items: center;
    justify-items: center;
    justify-content: center;
  }
}

.fixed {
  position: fixed;
  &--center {
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }
}

.rounded-borders {
  border-radius: 12px;
}
.card{
  width: 20vw;
  height: 60vh;
  color: black;
  img {
    object-fit: cover;
    display: block;
    width: 100%;
    height: 100%;
  }
  &--one {
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2), 0 1px 1px rgba(0, 0, 0, 0.14),
      0 2px 1px -1px rgba(0, 0, 0, 0.12);
  }
  &--two {
    transform: translate(-48%, -48%);
    box-shadow: 0 6px 6px -3px rgba(0, 0, 0, 0.2),
      0 10px 14px 1px rgba(0, 0, 0, 0.14), 0 4px 18px 3px rgba(0, 0, 0, 0.12);
  }
  &--three {
    background: rgba(black, 0.8);
    transform: translate(-46%, -46%);
    box-shadow: 0 10px 13px -6px rgba(0, 0, 0, 0.2),
      0 20px 31px 3px rgba(0, 0, 0, 0.14), 0 8px 38px 7px rgba(0, 0, 0, 0.12);
  }
  .text {
    position: absolute;
    bottom: 0;
    width: 100%;
    background: white;
    background: white;
    border-bottom-right-radius: 12px;
    border-bottom-left-radius: 12px;
    span {
      font-weight: normal;
    }
  }
}
.transition {
  animation: appear 200ms ease-in;
}

@keyframes appear {
  from {
    transform: translate(-48%, -48%);
  }
  to {
    transform: translate(-50%, -50%);
  }
}
</style>
