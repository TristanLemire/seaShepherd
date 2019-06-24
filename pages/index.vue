<template>
  <div class="home">
    <!-- <nuxt-link to="/about" class="button--green">Home</nuxt-link> -->
    <Intro/>
    <video class="home__video" src="../assets/video/home.mp4"  autoplay @click="controlVideo"></video>
    <!-- <iframe class="home__video"
src="hhttps://www.youtube.com/embed/b44QrmTn0Ng?autoplay=1&controls=0&fs=0&modestbranding=1&rel=0&showinfo=0" frameborder="0" allowfullscreen> -->
<!-- <iframe class="home__video" src="https://www.youtube.com/embed/668nUCeBHyY?autoplay=1&controls=0&fs=0&modestbranding=1&rel=0&showinfo=0" frameborder="0" allowfullscreen>
</iframe> -->
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

    <h1>Introduction</h1>
    <hr>
    <Menu/>
    <div class="home__button">
      <SkipButton/>
      <SoundButton/>
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
      console.log(document.querySelector(".home__video"));
      let video = document.querySelector(".home__video");
      let active = localStorage.getItem("sound");
      let audios = document.querySelectorAll("audio");
      if (active == "OFF" || active == null) {
        if (video != null) {
          video.volume = 0;
        }
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
        console.log("end");
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
    position: absolute;
    left: 50%;
    bottom: 15%;
    transform: translateX(-50%);
    font-family: "Poppins", sans-serif;
    z-index: 1;
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

.page-enter-active,
.page-leave-active {
  transition-property: opacity;
  transition-timing-function: ease-in-out;
  transition-duration: 5000ms;
}

.page-enter,
.page-leave-to {
  opacity: 0;
}

$t-duration: 800ms;
$t-delay: 300ms;

.intro-enter-active,
.intro-leave-active {
  transition-duration: $t-duration * 2;

  &::before,
  &::after {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    z-index: 2;
    display: block;
    width: 100%;
    height: 50%;
    transition-property: opacity, transform;
    transition-timing-function: ease-in-out;
  }

  &::before {
    background-color: #2e2e2e;
  }

  &::after {
    top: 50%;
    background-color: #2e2e2e;
  }
}

.intro-leave {
  &::before,
  &::after {
    transform: scaleX(0);
  }
}

.intro-leave-active {
  &::before {
    transition-duration: $t-duration;
  }

  &::after {
    transition-duration: $t-duration - $t-delay;
    transition-delay: $t-delay;
  }
}

.intro-leave-to {
  &::before,
  &::after {
    transform: scale(1);
    transform-origin: left;
  }
}

.intro-enter {
  &::before,
  &::after {
    transform: scaleX(1);
  }
}

.intro-enter-active {
  &::before {
    transition-duration: $t-duration;
  }

  &::after {
    transition-duration: $t-duration - $t-delay;
    transition-delay: $t-delay;
  }
}

.intro-enter-to {
  &::before,
  &::after {
    transform: scaleX(0);
    transform-origin: right;
  }
}
</style>
