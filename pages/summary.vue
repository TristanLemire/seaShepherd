<template>
  <div class="template__summary">
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
          <div class="values__user values">
            <h3 class="question">Can you swim?</h3>
            <h3 class="answer">Yes</h3>
          </div>
          <div class="values__all values">
            <h3 class="like">Like</h3>
            <h3 class="percentage">85%</h3>
          </div>
        </div>

        <div class="data__values data__values--second">
          <div class="values__user values">
            <h3 class="question">Are you seasick?</h3>
            <h3 class="answer">No</h3>
          </div>
          <div class="values__all values">
            <h3 class="like">Like</h3>
            <h3 class="percentage">64%</h3>
          </div>
        </div>
      </div>
    </section>
    <section class="section__score">
      <img src="../assets/image/paulwatson-sig.png" alt="">
      <div class="summary">
        <h3 class="score__sentence">According to your answers, you are eligible to be part of this journey!</h3>
        <h3 class="score__text">Your score is:</h3>
        <h3 class="score__percentage">77%</h3>
      </div>
    </section>
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

  .template__summary {
    font-family: "Poppins", sans-serif;
    color: #fff;
  }

  section {
    width: 100vw;
    min-height: 100vh;
  }

  .section__hero {
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    h1 {
      font-size: 35px;
      font-weight: bold;
      position: absolute;
      top: 5%;
    }

    p {
      text-align: center;
      font-size: 16px;
      width: 64%;
    }
  }

  .section__stats {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;
    background: #0D1B2A;

    h2 {
      position: absolute;
      top: 7.4%;
    }

    .stats__data {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      width: 55%;
      min-height: 42vh;

      .data__values {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;

        .values {
          display: flex;
          flex-direction: column;
          justify-content: space-between;
          align-items: center;
        }
      }
    }
  }

  .question, .like {
    font-size: 22px;
  }

  .answer, .percentage {
    font-size: 32px;
    font-weight: bold;
    margin-top: 32px;
  }

  .section__score {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;

    img {
        position: absolute;
        bottom: 14%;
        right: 8.9%;
        width: 26%;
      }

    .summary {
      width: 52%;
      min-height: 24vh;
      display: flex;
      flex-direction: column;
      justify-content: space-evenly;
      align-items: center;

      .score__sentence {
        font-size: 16px;
      }

      .score__text {
        font-size: 22px;
      }

      .score__percentage {
        font-size: 32px;
        font-weight: bold;
      }
    }
  }
</style>