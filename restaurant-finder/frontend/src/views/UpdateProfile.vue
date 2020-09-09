<template>
    <div >
        <navigation-bar />
        <div id="main-container">
            <h2 id="greeting"> {{username}}'s Current Profile</h2>
            <profile-questionnaire />
        </div>
    </div>
</template>

<script>

import ProfileQuestionnaire from '@/components/ProfileQuestionnaire';
import NavigationBar from '@/components/NavigationBar.vue';

export default {

    components: {
        ProfileQuestionnaire,
        NavigationBar
    },
    
    computed: {
        username() {
            return this.$store.state.user.username[0].toUpperCase() + this.$store.state.user.username.slice(1);
        }
    }   
    
}
</script>

<style scoped>

    #main-container {
    position: absolute;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%);
  
    }

    #greeting {
    text-align: center;
    margin-top: 17vh;
    color:blanchedalmond;
    }


</style>