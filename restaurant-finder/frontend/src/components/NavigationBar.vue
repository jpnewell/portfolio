<template>  
    <div id="nav" v-if="$store.state.token != '' && $store.state.isNewUser == false">
      <router-link v-bind:to="{ name: 'home' }" v-if="$store.state.token != ''">Home</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'UpdateProfile' }" v-if="$store.state.token != ''">Questionnaire</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'favorites' }" v-if="$store.state.token != ''">Favorite Restaurants</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'swipe' }" v-if="$store.state.token != ''">Food Finder</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'about' }" v-if="$store.state.token != ''">About</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>    
</template>

<script>
export default {
    name: 'navigation-bar'
}
</script>

<style scoped>


#nav{
  display: flex;
  justify-content: space-around;
  padding: 0.3rem 1rem;
  color:black; /* color of dividers */
  background-color: rgba(238, 113, 11);
  border: 1px solid rgba(238, 113, 11);
  border-radius: 9px;
  margin:auto;
  width: 44%
}

a {
    color: black; /* color of link  */
}
</style>