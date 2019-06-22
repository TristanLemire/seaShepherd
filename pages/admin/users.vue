<template>
  <div>
    <Hero :active="active"/>
    <div class="container">
      <br>
      <br>
      <table class="table is-fullwidth">
        <thead>
          <tr>
            <th class="has-text-weight-bold">ID</th>
            <th class="has-text-weight-bold">Name</th>
            <th class="has-text-weight-bold">Date</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in userList" :key="user.id">
            <td>{{ user.id }}</td>
            <td>{{ user.name }}</td>
            <td>{{user.date}}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <br>
    <br>
    <br>
    <br>
  </div>
</template>

<script>
import Hero from "~/components/Hero.vue";
if (process.client) {
  if(!localStorage.getItem('connected') || localStorage.getItem('connected') !== 'true') window.location.href = 'http://localhost:3000/login';
}
export default {
  data() {
    return {
      active: "users",
      userList: this.getUsers()
    };
  },
  components: {
    Hero
  },
  methods: {
    getUsers() {
      let url = "http://localhost:3000/api/users";
      fetch(url, { method: "GET" })
        .then(response => {
          return response.json();
        })
        .then(response => {
          this.userList = response;
        });
    }
  }
};
</script>
