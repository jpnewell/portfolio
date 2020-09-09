<template>
  <div id="login" class="text-center">    
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials">
      Invalid username and password!
      </div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <div>
        <label for="username" class="sr-only">Username</label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
        <label for="password" class="sr-only">Password</label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        />      
        <button type="submit" id="sign-in" class="btn-primary form-control">Sign in</button>
      </div>
      <router-link :to="{ name: 'register' }" id="register-link" >Need an account?</router-link>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';


export default {
  name: 'login',
  components: {},
  data() {
    return {
      user: {
        username: '',
        password: ''
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            
            this.$store.commit('SET_AUTH_TOKEN', response.data.token);
            this.$store.commit('SET_USER', response.data.user);            
              if (this.$store.state.isNewUser) {
                this.$router.push(`/add-profile`);
              }
              else {
                this.$router.push(`/favorites`)
              }
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
          
        });
    }
  }
};
</script>

<style scoped>

#login {
  
  font-family: "Impact", Charcoal, sans-serif;
}

form {
    margin: 1rem 0;
    padding: 1rem;
    width: 25%;
    background-color: rgba(59, 51, 51, 0.65);
    border: 4px solid maroon;
    border-radius: 25px;
    position: absolute;
  margin: -25px 0 0 -25px;
  top: 30%;
  left: 38%;
   color: blanchedalmond;
}

.burgerpizzapile{
  margin-top: 2rem;
  border-style: solid;
  border-color: maroon;
  border-top-width: 10px;
  border-left-width: 10px;
  border-right-width: 10px;
  border-bottom-width: 10px;
}

.form-signin {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  
}

.form-control {
  width: 15rem;
  justify-content: center;
  background-color: rgb(247, 219, 169);
}

#sign-in {
  background-color: maroon;
  color: blanchedalmond;
}

#sign-in:hover {
  background-color: blanchedalmond;
  color: maroon;
}

#register-link {
  margin: 0.5rem 0 0;   
}

</style>