import axios from 'axios';

export default {

  getOptions() {
    return axios.get('/restaurant/types');
  }, 

  updateProfile(profile) {
    return axios.put('/account', profile);
  },

  addProfile(profile) {
    return axios.post('/account', profile);
  },

  getProfile() {
    return axios.get('/account');
  },

  postPreference(typeAcct) {
    console.log(typeAcct);
    return axios.post('/account/type', typeAcct);
  },

  deletePreference(typeId) {
    return axios.delete(`/account/${typeId}`);
  }
}
