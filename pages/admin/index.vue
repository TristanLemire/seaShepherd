<template>
  <div>
    <Hero :active="active"/>
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
