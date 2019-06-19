<template>
  <div>
      <video src="../assets/video/home.mp4" class="video" autoplay></video>
      <h1>Introduction</h1>
     <hr>
     <Menu />
  </div>
</template>
<script>
import Menu from "~/components/Menu.vue";

export default {
  components: {
    Menu
  }
};

</script>

<style lang="scss">
div {
  overflow: hidden;
  height: 100vh;
  width: 100%;

hr{
  position: absolute;
  left: 50%;
  bottom: 10%;
  transform: translateX(-50%);
  width: 5%;
  height: 3px;
  background-color: white;
  border: none; /*on supprime le style par défaut*/
}

  h1{
    font-size: 20px;
    color: white; 
    font-weight: bold;
    letter-spacing: 3px;
    position: absolute;
    left: 50%;
    bottom: 15%;
    transform: translateX(-50%);
  }

  .video {
  position: absolute;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100%;
  object-fit: cover;
  z-index: -20;
}
}

 .center {
    display: table-cell;
    vertical-align: middle;
    overflow: hidden;
    :nth-of-type(1) {
      transform: rotate(0deg);
      position: relative;
      bottom: 0;
      left: 0;
      transition: 0.55s all cubic-bezier(0.18, 0.89, 0.32, 1.28);
    }
    :nth-of-type(2) {
      right: 0;
      transition: 0.55s all cubic-bezier(0.18, 0.89, 0.32, 1.28);
    }
    :nth-of-type(3) {
      transform: rotate(0deg);
      position: relative;
      top: 0;
      left: 0;
      transition: 0.55s all cubic-bezier(0.18, 0.89, 0.32, 1.28);
    }
  }
</style>
