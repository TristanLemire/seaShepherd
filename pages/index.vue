<template>
  <div class="home">
    <video src="../assets/video/home.mp4" class="home__video" autoplay></video>
    <h1>Introduction</h1>
    <hr>
    <Menu/>
    <div class="home__button">
      <SkipButton/>
      <SoundButton />
    </div>
  </div>
</template>
<script>
import Menu from "~/components/Menu.vue";
import SkipButton from "~/components/SkipButton.vue";
import SoundButton from "~/components/SoundButton.vue";

export default {
  components: {
    Menu,
    SkipButton,
    SoundButton
  },
  methods:{
    soundActive: function() {
      let video = document.querySelector('video');
      let active = localStorage.getItem('sound');
      let audios = document.querySelectorAll('audio');
       if(active == 'OFF' || active == null){
        if(video != null){
          video.volume = 0;
        } 
        if (audios.length > 0) {
          audios.forEach(audio => {
          audio.pause();
        });
        }
       }
     }
  },
  beforeMount(){
    this.soundActive()
  }
};
</script>

<style lang="scss">
body {
  align-items: center;
  display: flex;
  height: 100%;
  justify-content: center;
  margin: 0;
  overflow: hidden;
  position: absolute;
  width: 100%;
}

div.home {
  overflow: hidden;
  height: 100vh;
  width: 100%;

  hr {
    position: absolute;
    left: 50%;
    bottom: 10%;
    transform: translateX(-50%);
    width: 5%;
    height: 3px;
    background-color: white;
    border: none; /*on supprime le style par défaut*/
  }

  h1 {
    font-size: 20px;
    color: white;
    font-weight: bold;
    letter-spacing: 0.1em;
    position: absolute;
    left: 50%;
    bottom: 15%;
    transform: translateX(-50%);
    font-family: "Poppins", sans-serif;
  }

  .home__video {
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
