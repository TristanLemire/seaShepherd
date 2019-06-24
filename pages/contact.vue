<template>
  <div class="contact">
            <audio class="musique" autoplay src="http://media.w3.org/2010/07/bunny/04-Death_Becomes_Fur.oga"></audio>
    <Menu/>
    <Back/>
        <SoundButton/>
    <h1>CONTACT</h1>
    <div class="contact__content">
      <div>
        <div>
          <h2>Global Headquarters</h2>
          <p>
            52 Alexander Boersstraat
            <br>1071 KZ Amsterdam, The Netherlands
            <br>
            <a href="tel:+31202337701">Tel : +31 20 233 7701</a>
            <br>
            <a href="mail:to@seashepherdglobal.org">Email info @seashepherdglobal.org</a>
          </p>
        </div>

        <div>
          <h2 class="content__title--press">Press Inquiries</h2>
          <p>
            Heather Stimmler, Global Media Director
            <br>
            <a href="tel:+33977197742">Tel : +339 7719 7742 (Europe)</a>
            <br>
            <a href="mail:to@seashepherdglobal.org">Email media @seashepherdglobal.org</a>
          </p>
          <p>
            For Press Inquiries regarding SSCS (North America)
            <br>
            <a href="tel:+12122202302">Tel : +1 212 220 2302 (USA)</a>
            <br>
            <a href="mail:to@seashepherd.org">Email media @seashepherd.org</a>
          </p>
        </div>
      </div>

      <div class="contact__row"></div>

      <div>
        <div>
          <h2>Donations</h2>
          <p>
            Jan Hazeleger, CFO
            <br>
            <a href="mailto:@seashepherdglobal.org">Email finance @seashepherdglobal.org</a>
          </p>
        </div>

        <div>
          <h2 class="content__title--volunteer">Volunteer Crew</h2>
          <p>
            General crew inquiries:
            <br>
            <a
              href="www.seashepherdglobal.org/get-involved/volunteer-sea/"
              target="_blank"
            >www.seashepherdglobal.org/get-involved/volunteer-sea/</a>
          </p>
          <p>
            If you're a ticketed navigator or engineer
            <br>crewing @seashepherdglobal.org
          </p>
        </div>
      </div>

      <div class="contact__row"></div>

      <div>
        <div>
          <h2>Sea Shepherd Store</h2>
          <p>
            52 Alexander Boersstraat
            <br>1071 KZAmsterdam, The Netherlands
            <br>Opening hours:
            <br>Tue-Sun 11am – 5pm
            <br>
            <a href="tel:+31202337701">Tel : +31 20 233 7701</a>
            <br>
            <a href="mailto:cs@seashepherdstore.com">Email : cs@seashepherdstore.com</a>
          </p>
        </div>

        <div>
          <h2 class="content__title--online">Online Store</h2>
          <p>
            <a href="www.seashepherdstore.com" target="_blank">www.seashepherdstore.com</a>
            <br>
            <a href="mailto:shop@sea-shepherd.de">Email : shop@sea-shepherd.de</a>
          </p>
        </div>
      </div>
    </div>
    <h3>Please read our Frequently Asked Questions (FAQs) before sending your email. We run a very tight ship at Global headquarters, and our top priority is managing the daily operations of our direct-action campaigns. We don’t have “administrative staff” to answer calls and emails, so please be patient when awaiting a reply.</h3>
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
  
.contact {
  color: #fff;
  background-color: #0d1b2a;
  min-height: 100vh;
  width: 100vw;
  font-family: "Poppins", sans-serif;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;

  .contact__content {
    display: flex;
    flex-direction: row;
    justify-content: center;
    width: 78vw;
    height: 58vh;

    div:nth-child(5) {
      text-align: right;
    }

    .contact__row {
      background: #415a77;
      width: 2px;
      height: 100%;
      margin: 0 24px 0 24px;
    }
  }
}

a {
  text-decoration: none;
  color: white;

  &:hover {
    color: inherit;
  }
}

p {
  margin-top: 32px;
}

h1 {
  font-weight: bold;
  font-size: 35px;
}

h2 {
  font-weight: bold;
  font-size: 24px;
}

h3 {
  font-size: 14px;
  text-align: center;
  margin-bottom: 24px;
  margin-top: 20px;
  width: 60%;
}

.content__title--press {
  margin-top: 74px;
}

.content__title--volunteer {
  margin-top: 122px;
}

.content__title--online {
  margin-top: 27px;
}
</style>