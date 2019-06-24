<template>
  <div class="about">
    <audio class="musique" loop autoplay src="https://sendeyo.com/getuncry/file/02a7f4b2bf"></audio>
    <Menu/>
    <Back/>
    <SoundButton/>
    <div class="content">
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
    <img src="../assets/image/baleine_about.jpg" alt="baleines">
    </div>
  </div>
</template>
<script>
import Menu from "~/components/Menu.vue";
import Back from "~/components/Back.vue";
import SoundButton from "~/components/SoundButton.vue";


if (process.client) {
      let audiotime = document.querySelector('.musique');
  audiotime.currentTime = localStorage.getItem('audioTime');
      window.addEventListener('click', () => {
      let audiotime = document.querySelector('.musique');
      localStorage.setItem('audioTime',audiotime.currentTime);
  })
}

export default {
  transition: "intro",
  components: {
    Menu,
    Back,
    SoundButton
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

  html {
    background-color: #0D1B2A;
  }

  h1, img {
    margin-top: 128px;
  }

  .content {
    width: 80vw;
    display: flex;
    justify-content: space-around;
    margin: auto;
    /* margin-top: 11%; */

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
