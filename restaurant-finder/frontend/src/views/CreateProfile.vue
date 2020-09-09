<template>
    <div id="t">
        <navigation-bar />
        <div id="main-container">
            <h2 id="greeting">Welcome, {{username}}!</h2>
            <h2>Let's Create Your Profile</h2>
            <profile-questionnaire />
        </div>
    </div>
</template>

<script>

import ProfileQuestionnaire from '@/components/ProfileQuestionnaire';


export default {

    components: {
        ProfileQuestionnaire
    },
    
    computed: {
        username() {
            return this.$store.state.user.username[0].toUpperCase() + this.$store.state.user.username.slice(1);
        }
    }   
    
}
</script>

<style scoped>
#t {
    display: flex;
    justify-content: center;
}
    #main-container {
        position: absolute;
        top: 45%;
        left: 50%;
        transform: translate(-50%, -50%);
        color:blanchedalmond;
    }

    #greeting {
        text-align: center;
        margin-top: 17vh;        
    }

</style>