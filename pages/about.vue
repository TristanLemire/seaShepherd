<template>
  <div class="about">
    <Menu/>
    <div class="back">
      <svg class="fleche_back" width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M26.3599 9.24001L15.3199 20.6L26.3599 32L25.9999 32.6L14.3599 20.6L25.9999 8.60001L26.3599 9.24001Z" fill="white"/>
    </svg>
    <p>BACK</p>
    </div>
    <div class="text">
      <h1>ABOUT US</h1>
      <span>
        Established in 1977, Sea Shepherd Conservation Society (SSCS) is an international non-profit, marine wildlife conservation 
        organization. Our mission is to end the destruction of habitat and slaughter of wildlife in the world’s oceans in order to conserve 
        and protect ecosystems and species.
      </span>
      <span>
        Sea Shepherd uses innovative direct-action tactics to investigate, document, and take action when necessary to expose and confront 
        illegal activities on the high seas. By safeguarding the biodiversity of our delicately balanced ocean ecosystems, Sea Shepherd works to 
        ensure their survival for future generations.
      </span>
    </div>
    <div class="image">
    <img src="../assets/image/baleine_about.jpg" alt="baleines">
    </div>
  </div>
</template>
<script>
import Menu from "~/components/Menu.vue";

export default {
  components: {
    Menu
  },
};
</script>

<style lang="scss">
  html {
    background-color: #0D1B2A;
  }

  .back {
    display: flex;
    width: 10vw;
    font-size: 14px;
    align-items: center;
  }

  .about {
    display: flex;
    align-items: end;
    

    .text {
      width: 35vw;

      h1 {
        font-family: "Poppins", sans-serif;
        font-weight: 700;
        font-size: 56px;
        color: white;
        margin-bottom: 10%;
      }

      span {
        font-family: "Poppins", sans-serif;
        color: white;
        font-size: 18px;
        display: inline-block;
      }

      span:nth-child(even) {
        margin-bottom: 10%;
      }
    } 
  } 

  p {
    font-family: "Poppins", sans-serif;
    font-weight: 500;
    color: white;
  }
</style>