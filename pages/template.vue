<template>
  <div class="template">
            <audio class="musique" loop autoplay src="https://sendeyo.com/getuncry/file/02a7f4b2bf"></audio>
    <StepsMenu/>

    <section class="top">
      <Back/>
      <div class="top__title">
        <p>STEP 01:</p>
        <h1>Boarding and departure</h1>
      </div>
      <div class="top__resume">
        <h2>Welcome!</h2>
        <p>Embarked on one of the ships in Sea-Shepherd's fleet. Attends the traditional departure of a boat and the final preparations.</p>
      </div>
      <div class="home__button">
        <SoundButton/>
        <Logo/>
      </div>
    </section>

    <section class="video">
      <video class="home__video" src="../assets/video/home.mp4" @click="controlVideo"></video>
      <svg @click="controlVideo" class="play" width="100" height="100" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"/>
        <path d="M74 49.5L37.25 70.7176V28.2824L74 49.5Z" fill="white"/>
      </svg>
      <svg @click="controlVideo" display="none" class="play" width="100" height="100" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="30" y="27" width="13" height="46" fill="white"/>
        <rect x="57" y="27" width="13" height="46" fill="white"/>
        <circle cx="50" cy="50" r="49" stroke="#DEDEDE" stroke-width="2"/>
      </svg>
    </section>

    <section class="imageText">
      <img src="../assets/img/img.png" alt>
      <div class="imageText__title">
        <div>
          <h2>Welcome!</h2>
          <p>Embarked on one of the ships in Sea-Shepherd's fleet. Attends the traditional departure of a boat and the final preparations.</p>
        </div>
      </div>
    </section>
    <Footer />
  </div>
</template>

<script>
import StepsMenu from "~/components/StepsMenu.vue";
import SoundButton from "~/components/SoundButton.vue";
import Logo from "~/components/Logo.vue";
import Back from "~/components/Back.vue";
import Footer from "~/components/Footer.vue";
import { returnStatement } from "babel-types";

if (process.client) {

  let audiotime = document.querySelector('.musique');
  audiotime.currentTime = localStorage.getItem('audioTime');

  window.addEventListener('click', () => {
      let audiotime = document.querySelector('.musique');
      localStorage.setItem('audioTime',audiotime.currentTime);
  })
}

let memo;

export default {
  components: {
    SoundButton,
    Logo,
    StepsMenu,
    Back,
    Footer
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

    controlVideo() {
      let video = document.querySelector('video');
      let svgPlay = document.querySelector('.video svg:nth-child(2)');
      let svgPause = document.querySelector('.video svg:nth-child(3)');

      if (memo === false) {
        console.log('oui')
        memo = true;
        svgPause.setAttribute('display', 'none');
        svgPlay.setAttribute('display', '');
        video.pause();
      } else if (memo === true) {
        console.log('non')
        svgPause.style.opacity = 1;
        memo = false;
        svgPlay.setAttribute('display', 'none');
        svgPause.setAttribute('display', '');
        setTimeout(function() {
          svgPause.style.opacity = 0;
        }, 200)
        video.play();
      } else {
        memo = false;
        video.play();
        svgPause.style.opacity = 1;
        svgPlay.setAttribute('display', 'none');
        svgPause.setAttribute('display', '');
        setTimeout(function() {
          svgPause.style.opacity = 0;
        }, 200)
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
    background-color: #0D1B2A;
  }
  
.video {
  background: #0d1b2a;
  height: 100vh;
  width: 100%;

  video {
    height: 100vh;
    width: 100%;
    object-fit: cover;
  }

  .play {
    opacity: 1;
    position: absolute;
    top: 150%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1;
    transition: opacity .25s ease-in-out;
  }
}

.top {
  background: linear-gradient(180deg, rgba(13, 27, 42, 0.42) 0%, #0d1b2a 88.46%),
    url("../assets/img/fond.png"), no-repeat;
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

.imageText {
  background: #0d1b2a;
  height: 100vh;
  width: 100%;
  display: flex;

  img {
    width: 50%;
    object-fit: cover;
  }

  .imageText__title {
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
