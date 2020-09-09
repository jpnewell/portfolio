<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div id="input">
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
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <button id="create" class="btn-primary  form-control" type="submit">
        Create Account
      </button>
      </div>
      <router-link :to="{ name: 'login' }" id="signin-link" >Already have an account?</router-link>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$store.commit('SET_NEW_USER');
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
#register {
  padding: 1rem 0;
  font-family: "Impact", Charcoal, sans-serif;
  padding-top: 30vh;
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

.form-register {
  display: flex;
  flex-direction: column;
  align-items: center;  
}

.form-control {
  width: 15rem;
  justify-content: center;
  background-color: rgb(247, 219, 169);
}

#create {
  background-color: maroon;
  color: blanchedalmond;
}

#create:hover {
  background-color: blanchedalmond;
  color: maroon;
}

#signin-link {
  margin: 0.5rem 0 0;   
}
</style>
