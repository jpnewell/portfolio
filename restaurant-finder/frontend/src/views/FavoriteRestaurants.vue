<template>
    <div>
        <navigation-bar />
        <favorited-restaurants />
    </div>
</template>

<script>
import FavoritedRestaurants from '../components/FavoritedRestaurants';
import NavigationBar from '@/components/NavigationBar.vue';

export default {
    components: {
        FavoritedRestaurants,
        NavigationBar
    }
};
</script>