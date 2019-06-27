<template>
  <div class="template">
    <audio class="musique" loop autoplay :src="require('@/assets/music/musique.mp3')"></audio>
    <StepsMenu/>
    <section class="top scrollto">
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
    <section v-for="content in contents" :key="content.id" :class="'scrollto ' + content.type">
      <video
        data-play="false"
        v-if="content.type === 'video'"
        class="home__video"
        :src="'/'+content.source"
      ></video>
      <svg
        v-if="content.type === 'video'"
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
      <img
        v-if="content.type === 'image'  && content.content !== null && content.content !== ''"
        :src="'/'+content.source"
      >
      <img
        v-if="content.type === 'image'  && content.content === null || content.type === 'image' && content.content === ''"
        class="image-full"
        :src="'/'+content.source"
      >
      <div v-if="content.type === 'image'" class="image__title">
        <div>
          <h2>{{ content.subtitle }}</h2>
          <p>{{ content.content }}</p>
        </div>
      </div>
      <div v-if="content.type === 'text' && content.order !== 0">
        <h2 v-if="content.type === 'text' && content.order !== 0">{{ content.subtitle }}</h2>
        <p v-if="content.type === 'text' && content.order !== 0">{{ content.content }}</p>
      </div>
    </section>
    <ScrollDown/>
    <!-- <a :href="'/steps/'+step.next" class="button">Next step</a> -->
    <Footer class="scrollto" :next="'/steps/'+step.next"/>
  </div>
</template>

<script>
import StepsMenu from "~/components/StepsMenu.vue";
import SoundButton from "~/components/SoundButton.vue";
import Logo from "~/components/Logo.vue";
import Back from "~/components/Back.vue";
import { returnStatement } from "babel-types";
import Footer from "~/components/Footer.vue";
import ScrollDown from "~/components/ScrollDown.vue";

if (process.client) {
  function videoControl(videos, svgPlays, svgPauses, i) {
    let video = videos[i];
    let svgPlay = svgPlays[i];
    let svgPause = svgPauses[i];
    let audioSound = document.querySelector("audio");

    if (video.getAttribute("data-play") == "false") {
      for (let i2 = 0; i2 < videos.length; i2++) {
        if (videos[i2].getAttribute("data-play") == "true") {
          videos[i2].setAttribute("data-play", "false");
          videos[i2].pause();
          svgPauses[i2].setAttribute("display", "none");
          svgPlays[i2].setAttribute("display", "");
        }
      }
      video.play();
      video.setAttribute("data-play", "true");
      svgPause.style.opacity = 1;
      svgPlay.setAttribute("display", "none");
      svgPause.setAttribute("display", "");
      audioSound.pause();
      setTimeout(function() {
        svgPause.style.opacity = 0;
      }, 200);
    } else {
      video.pause();
      video.setAttribute("data-play", "false");
      svgPause.setAttribute("display", "none");
      svgPlay.setAttribute("display", "");
      if (localStorage.getItem("sound") == "ON") {
        audioSound.play();
      }
    }
  }
  setTimeout(() => {
    let videos = document.querySelectorAll("video");
    let svgPlays = document.querySelectorAll(".video svg:nth-child(2)");
    let svgPauses = document.querySelectorAll(".video svg:nth-child(3)");
    let audioSound = document.querySelector("audio");

    window.addEventListener("scroll", () => {
      for (let i = 0; i < videos.length; i++) {
        videos[i].setAttribute("data-play", "false");
        videos[i].pause();
        svgPauses[i].setAttribute("display", "none");
        svgPlays[i].setAttribute("display", "");
        if (localStorage.getItem("sound") != "OFF") {
          audioSound.play();
        }
      }
    });

    let allSection = document.querySelectorAll("section");
    for (let i = 0; i < allSection.length; i++) {
      console.log(allSection[i]);
      let waypoint = new Waypoint({
        element: allSection[i],
        handler: function(direction) {
          if (allSection[i].className == "scrollto video") {
            let laVideo = allSection[i].querySelector("video");
            let leSvgPlay = allSection[i].querySelector("svg:nth-child(2)");
            let leSvgPause = allSection[i].querySelector("svg:nth-child(3)");
            laVideo.play();
            console.log(allSection[i]);
            laVideo.setAttribute("data-play", "true");
            leSvgPause.style.opacity = 1;
            leSvgPlay.setAttribute("display", "none");
            leSvgPause.setAttribute("display", "");
            audioSound.pause();
            setTimeout(function() {
              leSvgPause.style.opacity = 0;
            }, 200);
          }
        },
        offset: "0%"
      });
    }

    // for (let i = 0; i < videos.length; i++) {
    //   videos[i].setAttribute("id", i);
    // }

    // for (let i = 0; i < videos.length; i++) {
    //   let theVideo = videos[i];
    //   let waypoint = new Waypoint({
    //   element: theVideo,
    //   handler: function(direction) {
    //     theVideo.play();
    //     svgPauses[i].style.opacity = 1;
    //     svgPlays[i].setAttribute("display", "none");
    //     svgPauses[i].setAttribute("display", "");
    //     audioSound.pause();
    //     setTimeout(function() {
    //       svgPauses[i].style.opacity = 0;
    //     }, 200);
    //     for (let i2 = 0; i2 < videos.length; i2++) {
    //       if(videos[i2] != theVideo){
    //         videos[i2].pause();
    //         svgPauses[i2].setAttribute("display", "none");
    //         svgPlays[i2].setAttribute("display", "");
    //       }
    //     }
    //   },
    //   offset: '0%'
    // });

    // }

    for (let i = 0; i < videos.length; i++) {
      videos[i].addEventListener("click", () => {
        videoControl(videos, svgPlays, svgPauses, i);
      });
      svgPlays[i].addEventListener("click", () => {
        videoControl(videos, svgPlays, svgPauses, i);
      });
      svgPauses[i].addEventListener("click", () => {
        videoControl(videos, svgPlays, svgPauses, i);
      });
    }
  }, 200);

  // TODO: solve scroll problems
  setTimeout(() => {
    let sections = document.querySelectorAll(".scrollto");
    let arr = [];
    sections.forEach(section => {
      arr.push(section);
    });
    if (sections[1].className === "scrollto text") arr.splice(1, 1);
    sections = arr;
    let pos = 0;
    let scroll = 0;
    let flag = true;
    let offset = 0;

    window.addEventListener("wheel", e => {
      // If the function is allowed to run
      if (flag) {
        if (e.deltaY > 5 && pos < sections.length - 1) {
          pos += 1;
          offset = sections[pos].offsetTop;

          window.scrollTo({
            behavior: "smooth",
            top: offset
          });
          flag = false;

          // Allow the listener to work again
          setTimeout(() => {
            flag = true;
          }, 1000);
        } else if (e.deltaY < -5 && pos > 0) {
          pos -= 1;
          offset = sections[pos].offsetTop;

          window.scrollTo({
            behavior: "smooth",
            top: offset
          });
          flag = false;

          // Allow the listener to work again
          setTimeout(() => {
            flag = true;
          }, 1000);
        }
      }
    });
  }, 200);

  let audiotime = document.querySelector(".musique");
  audiotime.currentTime = localStorage.getItem("audioTime");

  window.addEventListener("click", () => {
    let audiotime = document.querySelector(".musique");
    localStorage.setItem("audioTime", audiotime.currentTime);
  });
}

let memo;

export default {
  head() {
    return {
      script: [
        {
          src:
            "https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/noframework.waypoints.min.js"
        }
      ]
    };
  },

  data() {
    return {
      contents: this.getContent()
    };
  },
  components: {
    SoundButton,
    Logo,
    StepsMenu,
    Back,
    Footer,
    ScrollDown
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
      let video = document.querySelector(".home__video");
      let active = localStorage.getItem("sound");
      let audios = document.querySelectorAll("audio");
      if (active == "OFF" || active == null) {
        if (audios.length > 0) {
          audios.forEach(audio => {
            audio.pause();
          });
        }
      }
    }

    // controlVideo() {
    //   let video = document.querySelector("video");
    //   let svgPlay = document.querySelector(".video svg:nth-child(2)");
    //   let svgPause = document.querySelector(".video svg:nth-child(3)");
    //   let audioSound = document.querySelector("audio");

    //   if (memo === false) {
    //     memo = true;
    //     svgPause.setAttribute("display", "none");
    //     svgPlay.setAttribute("display", "");
    //     video.pause();
    //     if (localStorage.getItem("sound") == "ON") {
    //       audioSound.play();
    //     }
    //   } else if (memo === true) {
    //     svgPause.style.opacity = 1;
    //     memo = false;
    //     svgPlay.setAttribute("display", "none");
    //     svgPause.setAttribute("display", "");
    //     setTimeout(function() {
    //       svgPause.style.opacity = 0;
    //     }, 200);
    //     video.play();
    //     audioSound.pause();
    //   } else {
    //     memo = false;
    //     video.play();
    //     audioSound.pause();
    //     svgPause.style.opacity = 1;
    //     svgPlay.setAttribute("display", "none");
    //     svgPause.setAttribute("display", "");
    //     setTimeout(function() {
    //       svgPause.style.opacity = 0;
    //     }, 200);
    //   }
    // }
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
body {
  // padding: 0;
  // box-sizing: border-box;
  // margin: 0;
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
.text {
  div {
    background: #0d1b2a;
    height: 100vh;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    color: #ffffff;

    h2 {
      font-family: Poppins;
      font-size: 30px;
      font-weight: bold;
      letter-spacing: 2px;
      text-transform: capitalize;
      margin-bottom: 57px;
    }

    p {
      text-align: center;
      font-family: Poppins;
      font-weight: 500;
      font-size: 23px;
      letter-spacing: 2px;
      width: 50vw;
    }
  }
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
