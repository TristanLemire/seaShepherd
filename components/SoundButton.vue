<template>
  <button class="soundButton" @click="soundChange">MUSIC: {{ sound }}</button>
</template>

<script>

export default {
  data() {
    return {
      sound: 'ON'
    };
  },
  methods: {
    soundChange() {
      let audios = document.querySelectorAll('audio');
      let videos = document.querySelectorAll('video');
      let countVideoPlay = 0;
      if(this.sound == 'OFF'){
        for (let i = 0; i < videos.length; i++) {
          if(videos[i].getAttribute("data-play") === 'true'){
            countVideoPlay++;
          }
        }
        if(countVideoPlay == 0){
          this.sound = 'ON'
        if (audios.length > 0) {
          audios.forEach(audio => {
          audio.play();
        });
        }
        localStorage.setItem('sound','ON');
        } else {
          this.sound = 'ON'
          localStorage.setItem('sound','ON');
        }
      } else {
        this.sound = 'OFF'
        if (audios.length > 0) {
          audios.forEach(audio => {
          audio.pause();
        });
        }
        localStorage.setItem('sound','OFF');  
      }
    }
  },
  beforeMount(){
    if(localStorage.getItem('sound') == 'OFF'){
      this.sound = localStorage.getItem('sound');
    }
 },
};
</script>


<style lang="scss">
.soundButton {
  cursor: pointer;
  position: fixed;
  left: 5.86%;
  bottom: 5.33%;
  background-color: transparent;
  color: white;
  letter-spacing: 0.1em;
  font-weight: 600;
  font-size: 14px;
  font-family: "Poppins", sans-serif;
  border: none;
  z-index: 3;
}
</style>
