<template>
  <div>
    <Hero :active="active"/>
    <div class="container">
      <br>
      <br>
      <h2 class="title">Introduction</h2>
      <p class="content">If you are here you are an admin. <br>
      Enjoy your visit.
      </p>
    </div>
  </div>
</template>

<script>
if (process.client) {
  if(!localStorage.getItem('connected') || localStorage.getItem('connected') !== 'true') window.location.href = 'http://localhost:3000/login';
}

import Hero from '~/components/Hero.vue';

export default {
    data() {
        return {
            active: 'index'
        }
    },
    components: {
        Hero
    }
}
</script>
