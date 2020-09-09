<template>
  <div class="home">
    <navigation-bar />
      <div id="content"> 
        <h1>Foodies Galore Welcomes {{username}}!</h1>
        <h2 class="description">This application helps foodies looking for a good bite to eat decide where to go!</h2>
        <p>Click <a href ="update-profile"> here</a> to take your Foodies questionnaire!</p>
    </div>
  </div>
</template>

<script>
import NavigationBar from '@/components/NavigationBar.vue';

export default {
  name: 'home',
  components: {
    NavigationBar
  },  
  computed: {
        username() {
            return this.$store.state.user.username[0].toUpperCase() + this.$store.state.user.username.slice(1);
        }
    }   
};
</script>


<style scoped>


#content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);  
}

h1, h2 {
  padding-bottom: 3rem;
}



</style>
