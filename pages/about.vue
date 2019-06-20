<template>
<div>
  <video src="../assets/video/home.mp4" class="home__video" autoplay></video>
        <SoundButton />
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
