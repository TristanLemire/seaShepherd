<template>
  <div class="nameChoice">
    <audio class="musique" autoplay src="http://media.w3.org/2010/07/bunny/04-Death_Becomes_Fur.oga"></audio>
    <div class="nameChoice__form">
      <h1>Hello, what is your name?</h1>
      <form>
        <input type="text" placeholder="Your Name">
        <input type="submit" value="CONFIRM">
      </form>
    </div>

    <Menu/>
    <div class="home__button">
      <SoundButton/>
      <Logo/>
    </div>
  </div>
</template>
<script>
import Menu from "~/components/Menu.vue";
import SoundButton from "~/components/SoundButton.vue";
import Logo from "~/components/Logo.vue";
import { returnStatement } from "babel-types";

if (process.client) {
    let audiotime = document.querySelector('.musique');
  audiotime.currentTime = localStorage.getItem('audioTime');
  let submit = document.querySelector("input[type=submit]");
    let nameText = document.querySelector("input[type=text]");
  submit.addEventListener("click", event => {
    event.preventDefault();
    let today = new Date();
    let dd = today.getDate();

    let mm = today.getMonth() + 1;
    let yyyy = today.getFullYear();
    if (dd < 10) {
      dd = "0" + dd;
    }
    if (mm < 10) {
      mm = "0" + mm;
    }
    today = dd + "/" + mm + "/" + yyyy;
    let data = {
      name: nameText.value,
      date: today
    };
    fetch("http://localhost:3000/api/users", {
      method: "POST",
      mode: "cors",
      cache: "no-cache",
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json"
      },
      referrer: "no-referrer", // no-referrer, *client
      body: JSON.stringify(data) // body data type must match "Content-Type" header
    }).then(response => {
      return response.json();
    }).then(user => {
      localStorage.setItem('user',JSON.stringify(user));
    })
      let audiotime = document.querySelector('.musique');
      localStorage.setItem('audioTime',audiotime.currentTime);
      window.location.href = "/worldMap";
  });
}

export default {
  components: {
    Menu,
    SoundButton,
    Logo
  },
  methods: {
    soundActive: function() {
      let video = document.querySelector("video");
      let active = localStorage.getItem("sound");
      let audios = document.querySelectorAll("audio");
      if (active == "OFF") {
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
body {
  background-color: #0d1b2a;
  height: 100vh;
  width: 100%;
}

div.nameChoice {
  overflow: hidden;
  height: 100vh;
  width: 100%;

  .nameChoice__form {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;

    form {
      width: 100%;
      input[type="text"] {
        margin-top: 20px;
        width: 100%;
        background-color: transparent;
        border: none;
        border-bottom: solid 3px white;
        color: white;
        letter-spacing: 0.02em;
        font-family: "Poppins", sans-serif;
        font-size: 32px;
        text-align: center;
        font-weight: lighter;
      }

      input[type="submit"] {
        margin-top: 40px;
        cursor: pointer;
        font-family: Poppins;
        font-style: normal;
        font-size: 14px;
        color: white;
        padding: 5px 30px 5px 30px;
        border-radius: 50px;
        border: white solid 1px;
        background: transparent;
        transition: background-color 0.5s, color 0.5s;

        &:hover {
          background-color: white;
          color: #0d1b2a;
        }
      }
    }

    h1 {
      color: white;
      letter-spacing: 0.02em;
      font-family: "Poppins", sans-serif;
      font-size: 32px;
      letter-spacing: 0.1em;
    }
  }
}
</style>
