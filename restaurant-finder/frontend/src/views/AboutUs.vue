<template>
    <div>
        <navigation-bar />
        <h1 class="head">ABOUT THESE FOODIES</h1>
        <div class="names">
            <div id="Michaela">
            <img src="../assets/michBITMOJI.jpg">
            <p>Michaela has only just started her breakout into the tech world - and can't wait to grow and learn more every day. She's a team player, hard worker and always excited for the next task ahead.</p>
            </div>
            <div id="Blake">
            <img src="../assets/blakeBITMOJI.jpg">
            <p>Blake is a one of a kind teammate. He's a master of stepping out of his comfort zone to do what needs done. There's no challenge Blake isn't up for, and he's sure to make something incredible every time.</p>
            </div>
            <div id="Luke">
            <img src="../assets/lukeBITMOJI.jpg">
            <p>Luke dives in to any and all things head first, despite comfort and confidence level. Nothing is too difficult for him once he sets his mind. Every day Luke comes to the table ready to give 110% into all his work, and is a strong team member to have.</p>
            </div>
            <div id ="Jon">
            <img src="../assets/jonBITMOJI2.jpg">
            <p>Jon is an invaluable member of this team. His knowledge and work ethic played fundamental parts in making this project a glowing reality. He's the kind of teammate you can turn to and he'll get you there, and get you feeling confident in the material yourself.</p>
            </div>
        </div>
    </div>
</template>

<script>
import NavigationBar from '@/components/NavigationBar.vue';

export default {
    components: {
        NavigationBar
    }
};
</script>

<style>
 .names{
     text-align:left;
 }

 .head {
     margin-top: 14vh;
    display: flex;
    margin-left: 35vh;
 }

 .names div {
     margin-top: 2.5vh;
     margin-left: 30vh;
     margin-right: 50vh;
     margin-bottom: 0vh;
 }

 #Michaela {
    display: flex;
    column-gap: 10vh;
    border: 4px solid maroon;
    background-color: rgba(59, 51, 51, 0.65);
 }

 img {
     width: 14vh
 }

p {
    font-size: 2.5vh;
}

 #Blake {
    display: flex;
    column-gap: 10vh;
    border: 4px solid maroon;
    background-color: rgba(59, 51, 51, 0.65);
 }

 #Luke {
     display: flex;
    column-gap: 10vh;
    border: 4px solid maroon;
    background-color: rgba(59, 51, 51, 0.65);
 }

 #Jon {
     display: flex;
    column-gap: 10vh;
    border: 4px solid maroon;
    background-color: rgba(59, 51, 51, 0.65);
 }

    h3 {
        justify-content: space-between;
    }
</style>