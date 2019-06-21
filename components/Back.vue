<template>
  <a class="back" href="./worldMap">
    <svg class="fleche_back" width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M26.3599 9.24001L15.3199 20.6L26.3599 32L25.9999 32.6L14.3599 20.6L25.9999 8.60001L26.3599 9.24001Z" fill="white"/>
    </svg>
    <!-- <p>BACK</p> -->
  </a>
</template>

<style lang="scss">
  .back {
    position: fixed;
    top: 15%;
    left: 6.86%;
    display: flex;
    width: 10vw;
    font-size: 14px;
    align-items: center;
    color: #fff;

    &:after {
      font-family: "Poppins", sans-serif;
      content: 'BACK';
      font-size: 14px;
      text-decoration: none;
      color: white;
    }
    &:hover {
      color: inherit;
    }
  }
</style>



