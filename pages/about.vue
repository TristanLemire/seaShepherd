<template>
<div>
  <video src="../assets/video/home.mp4" class="home__video" autoplay></video>
        <SoundButton />
              <SkipButton/>
</div>
</template>
<script>
import Menu from "~/components/Menu.vue";
import SkipButton from "~/components/SkipButton.vue";
import SoundButton from "~/components/SoundButton.vue";


export default {
  transition: "intro",
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
       if(active == 'OFF'){
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

