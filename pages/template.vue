<template>
  <div class="template">
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
      <video class="home__video" src="../assets/video/home.mp4" controls></video>
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

export default {
  components: {
    SoundButton,
    Logo,
    StepsMenu,
    Back
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
    }
  },
  beforeMount() {
    this.soundActive();
  }
};
</script>

<style lang="scss">
.video {
  background: #0d1b2a;
  height: 100vh;
  width: 100%;

  video {
    height: 100vh;
    width: 100%;
    object-fit: cover;
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
  position: absolute;
  top: 15%;
  left: 6.86%;
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
