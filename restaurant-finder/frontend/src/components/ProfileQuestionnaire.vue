<template>
    <div id="form-container" >
        
        <form id="form-view" v-on:submit.prevent>
            
            <div id="zip" class="field">
                    <label for="zip">Zip Code</label>
                    <input type="text" name="zip" size="5" v-model="userProfile.zipCode" 
                    v-on:change="feedbackBeforeSave"
                    required autofocus /><b-spinner v-if="isUpdating" label="Spinning"></b-spinner>
            </div>
            <div class="field" v-on:click="updatePreferences($event.target.value)" >
                
                <b-form-group  name="restaurant-preferences">    

                    <b-form-checkbox-group id="box"  
                    v-model="userProfile.likedTypesId"
                    :options="availableOptions" 
                    text-field="type"
                    value-field="typeId"
                    switches stacked size="lg"
                    :disabled="this.$store.state.isNewUser">     
                                
                    </b-form-checkbox-group>
                </b-form-group>
                
            </div>
                <div class="actions">            
                <button type="submit" v-on:click="viewSuggestions"
                :disabled="userProfile.likedTypesId.length === 0"
                >See Your Matches!</button>
            </div>

        </form>
    </div>
</template>

<script>



import selectionService from '@/services/SelectionService';

export default {
    name: 'profile-questionnaire',
    data() {
        return {
            
            isUpdating: false,
            availableOptions: [], 
            currentSelection: '',
                                   
            userProfile: {
                userId: this.$store.state.user.userId,
                zipCode: '',
                likedTypes: [],
                likedTypesId: []             
            }            
        }

    },
    created() {
            
            selectionService.getOptions()
            .then(response => { 
                this.availableOptions = response.data;                               
            })
            .catch(error => {
                if (error.response) {
                    alert("Could not retrieve types.");
                }
            });

            if(this.$store.state.isNewUser === false) {
                selectionService.getProfile()
                .then(response => {
                this.userProfile = response.data; 
                });     
            }                   
    },

    computed: {
        isNewUser() {
          return this.$store.state.isNewUser;  
        } 
    },
        
    methods: {
        
        viewSuggestions() {
            this.$router.push(`/swipe`);
        },
        
        updatePreferences(preference) {
            if(preference){
                
                if(this.userProfile.likedTypesId.includes( parseInt(preference) ))
                {
                    selectionService.deletePreference( parseInt(preference) );
                }
                else
                {
                    const typeAccount = {userId: this.userProfile.userId, typeId: preference }
                    selectionService.postPreference(typeAccount);
                }
                this.isIncomplete = false;
            }
        },
        feedbackBeforeSave(){
            this.isUpdating = true;
            setTimeout(()=>this.saveProfile(), 700);
        },

        saveProfile() {            
            
            if(this.$store.state.isNewUser){
                this.userProfile.userId = this.$store.state.user.userId;
                selectionService.addProfile(this.userProfile)
                .then(response => {
                    if (response.status === 200) {
                        this.$store.commit('SET_RETURNING_USER');
                        this.isUpdating = false;
                    }
                })
                .catch(error => {
                    if (error.response) {
                        alert("Could not create profile.");            
                    }
                });                
            }
            else
            {
                selectionService.updateProfile(this.userProfile)
                .then(response => {
                    if (response.status === 200) {
                       this.isUpdating = false;  
                    }
                })
                .catch(error => {
                    if (error.response) {
                        alert("Could not update profile.");            
                    }
                });
            }          
            
        }, 
        
      

    },
    
}
</script>

<style scoped>
form {
    
    padding: 1rem;    
    width: 40vh;
    background-color: rgba(59, 51, 51, 0.65);    
    border: 4px solid maroon;
    border-radius: 25px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;    
    text-align: left;
    color: blanchedalmond;
    
}

#zip {
    display: flex;
    column-gap: 1rem;        
}

#box {
    margin-left: 1rem;
    padding: 0 1rem;
    
}

#box-label{
    margin-left: 2rem;
    padding: 0 .1rem;
}

.actions {
    
    justify-content: space-evenly;
}

</style>