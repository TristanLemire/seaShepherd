
<template>
  <div class="home">
    <!-- <nuxt-link to="/about" class="button--green">Home</nuxt-link> -->
    <Intro/>
    <video data-play="true" class="home__video" src="../assets/video/home.mp4"  autoplay @click="controlVideo"></video>
  <svg @click="controlVideo" display="none" class="play" width="100" height="100" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"/>
        <path d="M74 49.5L37.25 70.7176V28.2824L74 49.5Z" fill="white"/>
      </svg>
      <svg @click="controlVideo" display="none" class="play" width="100" height="100" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="30" y="27" width="13" height="46" fill="white"/>
        <rect x="57" y="27" width="13" height="46" fill="white"/>
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"/>
      </svg>
    <div id="player"></div>

    <h1>Take part in the trip of a volunteer through a campaign of Sea Shepherd to save whales.</h1>
    <hr>
    <Menu/>
    <div class="home__button">
      <SkipButton/>
      <Logo/>
    </div>
  </div>
</template>
<script>
import Menu from "~/components/Menu.vue";
import SkipButton from "~/components/SkipButton.vue";
import SoundButton from "~/components/SoundButton.vue";
import Logo from "~/components/Logo.vue";
import Intro from "~/components/Intro.vue";
import { returnStatement } from "babel-types";

let memo;

if (process.client) {
  localStorage.setItem('user','');
  window.addEventListener('click', () => {
  localStorage.setItem('audioTime','');
  })
}

export default {
    transition: "intro",
  components: {
    Menu,
    SkipButton,
    SoundButton,
    Logo,
    Intro
  },
  methods: {
    soundActive() {
      let video = document.querySelector(".home__video");
      let active = localStorage.getItem("sound");
      let audios = document.querySelectorAll("audio");
      if (active == "OFF" || active == null) {
        if (audios.length > 0) {
          audios.forEach(audio => {
            audio.pause();
          });
        }
      }
    },
    endVideo() {
      let video = document.querySelector(".home__video");
      video.addEventListener("ended", function() {
        window.location.href = "/nameChoice";
      });
    },
        controlVideo() {
      let video = document.querySelector('video');
      let svgPlay = document.querySelector('svg:nth-child(2)');
      let svgPause = document.querySelector('svg:nth-child(3)');

      if (memo === false) {
        memo = true;
        svgPlay.setAttribute('display', 'none');
        svgPause.setAttribute('display', '');
        setTimeout(function() {
          svgPause.style.opacity = 0;
        }, 200)
        video.play();
      } else {
        svgPause.style.opacity = 1;
        memo = false;
        svgPause.setAttribute('display', 'none');
        svgPlay.setAttribute('display', '');
        video.pause();
      }
    }
  },
  beforeMount() {
    this.soundActive();
    this.endVideo();
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

.play {
  opacity: 1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 10;
  transition: opacity .25s ease-in-out;
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
    z-index: 1;
  }

  h1 {
    font-size: 20px;
    color: white;
    font-weight: bold;
    letter-spacing: 0.1em;
    font-family: "Poppins", sans-serif;
    position: absolute;
    left: 50%;
    bottom: 15%;
    transform: translateX(-50%);
    z-index: 1;
    text-align: center;
  }

  .home__video {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    height: 100vh;
    width: 100%;
    object-fit: cover;
    z-index: 1;
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
