<template>
  <button @click="soundChange">SOUND: {{ sound }}</button>
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
      let video = document.querySelector('video');
      let audios = document.querySelectorAll('audio');
      console.log(video);
      if(this.sound == 'OFF'){
        this.sound = 'ON'
        if(video != null){
          video.volume = 1;
        } 
        if (audios.length > 0) {
          audios.forEach(audio => {
          audio.start();
        });
        }
        localStorage.setItem('sound','ON');
      } else {
        this.sound = 'OFF'
        if(video != null){
          video.volume = 0;
        } 
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
button {
  cursor: pointer;
  position: absolute;
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
