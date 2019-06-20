<template>
  <div>
    <Hero :active="active" />
  </div>
</template>

<script>
import Hero from '~/components/Hero.vue';

export default {
    data() {
        return {
            active: 'users'
        }
    },
    components: {
        Hero
    }
}
</script>
