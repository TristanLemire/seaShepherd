<template>
  <button @click="soundChange">SOUND: ON</button>
</template>

<script>
export default {
  methods: {
    soundChange() {
      let videoSound = document.querySelector("video");
      let audioSounds = document.querySelectorAll("audio");
      let off = localStorage.getItem('sound');
      if (off != true) {
        console.log('coucou',off);
        localStorage.setItem('sound',false);
        console.log('coucou',off);
        if (videoSound != null) {
          videoSound.volume = 0;
        }
        if (audioSounds.length > 1) {
          audioSounds.forEach(audioSound => {
            audioSound.pause;
          });
        }
      } else   {
        console.log('coucou');
        localStorage.setItem('sound',true);
        if (videoSound != null) {
          videoSound.volume = 1;
        }
        if (audioSounds.length > 1) {
          audioSounds.forEach(audioSound => {
            audioSound.play();
          });
        }
      }
    }
  }
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
  z-index: 2;
}
</style>
