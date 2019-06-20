<template>
  <div class="home">
    <nuxt-link to="/about" class="button--green">Home</nuxt-link>
    <Intro/>
    <video src="../assets/video/home2.mp4" class="home__video" autoplay></video>
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
      let video = document.querySelector("video");
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
      let video = document.querySelector("video");
      video.addEventListener("ended", function() {
        console.log("end");
        window.location.href = "/about";
      });
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
