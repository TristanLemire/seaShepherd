<template>
  <div class="summary">
    <Back />
    <StepsMenu />

    <section class="section__hero">
      <h1>CONGRATULATION</h1>
      <p>You've been through the Sea-Shepherd experience, we hope it has made you feel better.
      Discover your results without further delay with your answers to the questions you have been asked during your exploration!</p>
    </section>

    <section class="section__stats">
      <h2>Summary of your answers</h2>
      <div class="stats__data">
        <div class="data__values data__values--first">
          <div class="values__user">
            <h3 class="question">Can you swim?</h3>
            <h3 class="answer">Yes</h3>
          </div>
          <div class="values__all">
            <h3 class="like">Like</h3>
            <h3 class="percentage">85%</h3>
          </div>
        </div>
      </div>
    </section>
    <section class="section__score"></section>
  </div>
</template>

<script>
  import Back from "~/components/Back.vue";
  import StepsMenu from "~/components/StepsMenu.vue";
  /* import Logo from "~/components/Logo.vue"; */

  export default {
    components: {
      /* Logo, */
      StepsMenu,
      Back,
    },
  }
</script>

<style lang="scss">

  html {
    background-color: #0D1B2A;
  }

</style>