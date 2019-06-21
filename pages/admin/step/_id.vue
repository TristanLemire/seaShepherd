<template>
  <div class="container">
    <br>
    <br>
    <br>
    <a href="/admin/steps" class="button">
        <i class="fas fa-arrow-left"></i>&nbsp
      <span>Go back to steps</span>
    </a>
    <br>
    <br>
    <br>
    <br>
    <h1 class="title">Welcome on step {{ id}}</h1>
    <h2 class="subtitle">{{ step.title }}</h2>
    <p>{{ step.description }}</p>
  </div>
</template>

<script>

export default {
    head () {
    return {
      script: [
        { src: 'https://kit.fontawesome.com/62db70851e.js' }
      ]
    } 
  },
  asyncData({ params }) {
    return fetch("http://localhost:3000/api/steps/" + params.id, {
      method: "GET"
    })
      .then(response => {
        return response.json();
      })
      .then(response => {
        return { step: response };
      });
  },
  data() {
    return {
      id: this.$route.params.id
    };
  }
};
</script>
