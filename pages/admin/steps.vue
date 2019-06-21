<template>
  <div>
    <Hero :active="active"/>
    <div class="container">

    </div>
  </div>
</template>

<script>
import Hero from '~/components/Hero.vue';

export default {
    data() {
        return {
            active: 'steps',
        }
    },
    components: {
        Hero
    }
}
</script>
