<template>
  <div class="template">
    <StepsMenu/>

    <section class="top">
      <Back/>
      <div class="top__title">
        <p>{{ step.title }}</p>
        <h1>{{ step.description }}</h1>
      </div>
      <div v-for="content in contents" :key="content.id" class="top__resume">
        <h2 v-if="content.order === 0">{{ content.subtitle }}</h2>
        <p v-if="content.order === 0">{{ content.content }}</p>
      </div>
      <div class="home__button">
        <SoundButton/>
        <Logo/>
      </div>
    </section>
    <section v-for="content in contents" :key="content.id" :class="content.type">
      <video v-if="content.type === 'video'" class="home__video" :src="'/'+content.source" @click="controlVideo"></video>
      <svg
        v-if="content.type === 'video'"
        @click="controlVideo"
        class="play"
        width="100"
        height="100"
        viewBox="0 0 100 100"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"></circle>
        <path d="M74 49.5L37.25 70.7176V28.2824L74 49.5Z" fill="white"></path>
      </svg>
      <svg
        v-if="content.type === 'video'"
        @click="controlVideo"
        display="none"
        class="play"
        width="100"
        height="100"
        viewBox="0 0 100 100"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect x="30" y="27" width="13" height="46" fill="white"></rect>
        <rect x="57" y="27" width="13" height="46" fill="white"></rect>
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"></circle>
      </svg>
      <img v-if="content.type === 'image'  && content.content !== null && content.content !== ''" :src="'/'+content.source">
      <img v-if="content.type === 'image'  && content.content === null || content.content === ''" class="image-full" :src="'/'+content.source">
        <div v-if="content.type === 'image'" class="image__title">
           <div>
            <h2>{{ content.subtitle }}</h2>
            <p>{{ content.content }}</p>
           </div>
        </div>
    </section>
    <!-- <section class="video">
      <video class="home__video" src="../../assets/video/home.mp4" @click="controlVideo"></video>
      <svg @click="controlVideo" class="play" width="100" height="100" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"/>
        <path d="M74 49.5L37.25 70.7176V28.2824L74 49.5Z" fill="white"/>
      </svg>
      <svg @click="controlVideo" display="none" class="play" width="100" height="100" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="30" y="27" width="13" height="46" fill="white"/>
        <rect x="57" y="27" width="13" height="46" fill="white"/>
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"/>
      </svg>
    </section>-->

    <!-- <section class="image">
      <img src="../../assets/img/img.png" alt>
      <div class="image__title">
        <div>
          <h2>Welcome!</h2>
          <p>Embarked on one of the ships in Sea-Shepherd's fleet. Attends the traditional departure of a boat and the final preparations.</p>
        </div>
      </div>
    </section> -->
  </div>
</template>

<script>
import StepsMenu from "~/components/StepsMenu.vue";
import SoundButton from "~/components/SoundButton.vue";
import Logo from "~/components/Logo.vue";
import Back from "~/components/Back.vue";
import { returnStatement } from "babel-types";

if (process.client) {
}

let memo;

export default {
  data() {
    return {
      contents: this.getContent()
    };
  },
  components: {
    SoundButton,
    Logo,
    StepsMenu,
    Back
  },
  asyncData({ params }) {
    return fetch("http://localhost:3000/api/steps/" + params.id, {
      method: "GET"
    })
      .then(response => {
        return response.json();
      })
      .then(response => {
        return { step: response };
      });
  },
  methods: {
    getContent() {
      let idStep = this.$route.params.id;
      fetch("http://localhost:3000/api/contents/" + idStep, {
        method: "GET"
      })
        .then(response => {
          return response.json();
        })
        .then(response => {
          this.contents = response;
        });
    },
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

    controlVideo() {
      let video = document.querySelector("video");
      let svgPlay = document.querySelector(".video svg:nth-child(2)");
      let svgPause = document.querySelector(".video svg:nth-child(3)");

      if (memo === false) {
        console.log("oui");
        memo = true;
        svgPause.setAttribute("display", "none");
        svgPlay.setAttribute("display", "");
        video.pause();
      } else if (memo === true) {
        console.log("non");
        svgPause.style.opacity = 1;
        memo = false;
        svgPlay.setAttribute("display", "none");
        svgPause.setAttribute("display", "");
        setTimeout(function() {
          svgPause.style.opacity = 0;
        }, 200);
        video.play();
      } else {
        memo = false;
        video.play();
        svgPause.style.opacity = 1;
        svgPlay.setAttribute("display", "none");
        svgPause.setAttribute("display", "");
        setTimeout(function() {
          svgPause.style.opacity = 0;
        }, 200);
      }
    }
  },
  beforeMount() {
    this.soundActive();
  }
};
</script>

<style lang="scss">
html {
  background-color: #0d1b2a;
}

.video {
  background: #0d1b2a;
  height: 100vh;
  width: 100%;
  position: relative;
  video {
    height: 100vh;
    width: 100%;
    object-fit: cover;
  }

  

  .play {
    opacity: 1;
    position: absolute;
    top: 50vh;
    left: 50vw;
    transform: translate(-50%, -50%);
    z-index: 1;
    transition: opacity 0.25s ease-in-out;
  }
}

.top {
  background: linear-gradient(180deg, rgba(13, 27, 42, 0.42) 0%, #0d1b2a 88.46%),
    url("../../assets/img/fond.png"), no-repeat;
  background-size: cover;
  height: 100vh;
  width: 100%;

  .top__title {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 33%;
    position: absolute;
    left: 50%;
    top: 20%;
    transform: translateX(-50%);

    p {
      margin-bottom: 48px;
      font-family: Poppins;
      font-style: normal;
      font-weight: bold;
      font-size: 16px;
      letter-spacing: 0.02em;
      color: #ffffff;
    }

    h1 {
      font-family: Poppins;
      font-weight: bold;
      font-size: 50px;
      letter-spacing: 2px;
      text-transform: uppercase;
      color: #ffffff;
      text-align: center;
    }
  }
  .top__resume {
    width: 50%;
    position: absolute;
    left: 183px;
    top: 499px;

    h2 {
      font-family: Poppins;
      font-weight: bold;
      font-size: 25px;
      letter-spacing: 2px;
      text-transform: capitalize;
      color: #ffffff;
      margin-bottom: 27px;
    }

    p {
      font-family: Poppins;
      font-weight: 500;
      font-size: 18px;
      letter-spacing: 2px;
      color: #ffffff;
    }
  }
}

.back {
  height: 0;
  position: fixed;
  top: 15%;
  left: 5.86%;
}

.image {
  background: #0d1b2a;
  height: 100vh;
  width: 100%;
  display: flex;

  img:not(.image-full) {
    width: 50%;
    object-fit: cover;
  }

  .image-full {
    position: absolute;
    width: 100vw;
    height: 100vh;
    object-fit: cover;
  }

  .image__title {
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: center;

    div {
      width: 50%;
      text-align: center;
      color: #ffffff;
      h2 {
        font-family: Poppins;
        font-weight: bold;
        font-size: 25px;
        letter-spacing: 2px;
        text-transform: capitalize;
        margin-bottom: 27px;
      }

      p {
        font-family: Poppins;
        font-weight: 500;
        font-size: 18px;
        letter-spacing: 2px;
      }
    }
  }
}
</style>
