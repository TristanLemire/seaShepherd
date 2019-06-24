<template>
  <div>
    <div class="menuSteps">
      <ul class="steps">
        <li v-for="step, key in steps" :key="step.id">
          <a :href="'/steps/'+step.id">{{ step.title }} <span>0{{++key}}</span></a>
        </li>
      </ul>
      <ul class="basic">
        <li>
          <a href="./about">ABOUT</a>
        </li>
        <li>
          <a href="./contact">CONTACT</a>
        </li>
        <li>
          <a href="https://www.facebook.com/seashepherdglobal/">FACEBOOK</a>
        </li>
        <li>
          <a href="https://twitter.com/seashepherd?lang=fr">TWITTER</a>
        </li>
        <li>
          <a href="https://www.instagram.com/seashepherd/?hl=fr">INSTAGRAM</a>
        </li>
      </ul>
    </div>
    <svg
      @click="openMenu"
      id="menuBouton"
      class="ham hamRotate ham8"
      viewBox="0 0 100 100"
      width="80"
    >
      <path
        class="line top"
        d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20"
      ></path>
      <path class="line middle" d="m 30,50 h 40"></path>
      <path
        class="line bottom"
        d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20"
      ></path>
    </svg>
  </div>
</template>

<script>
export default {
  data() {
    return {
      steps: this.getSteps()
    }
  },
  methods: {
    getSteps() {
      fetch("http://localhost:3000/api/steps/", {
        method: "GET"
      })
        .then(response => {
          return response.json();
        })
        .then(response => {
          this.steps = response;
        });
    },
    openMenu() {
      let menu = document.querySelector(".menuSteps");
      let bouton = document.querySelector('.ham');
      if(menu.className === 'menuSteps zIdenx open'){
        bouton.classList.remove('active')
        menu.classList.remove('open');
        setTimeout(function() {
          menu.classList.remove('zIdenx');
          }, 500);
      } else if (menu.className === 'menuSteps') {
        bouton.classList.add('active')
        menu.classList.add('zIdenx');
        menu.classList.add('open');
      }
    }
  }
};
</script>


<style lang="scss">
.menuSteps {
  background: #0d1b2a;
  width: 100%;
  height: 100vh;
  position: fixed;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
  transition: opacity 0.6s;
  z-index: -1;
  opacity: 0;
  overflow: hidden;

  &.open {
      opacity: 1;
  }

  &.zIdenx {
    z-index: 3;
  }

  ul.steps {
    position: absolute;
    display: flex;
    flex-direction: column;
    align-items: left;
    justify-content: space-around;
    height: 40vh;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    text-align: center;

    li {
      a {
        
        span{
          font-family: "Poppins", sans-serif;
          font-style: normal;
          font-weight: bold;
          font-size: 18px;
          position: absolute;
          top:-7px;
          right: -35px;
        }

        position: relative;
        font-family: "Poppins", sans-serif;
        color: white;
        text-decoration: none;
        cursor: pointer;
        background-image: linear-gradient(180deg, transparent 65%, #fcf113 0);
        background-repeat: no-repeat;
        background-size: 0 100%;
        transition: background-size 0.4s ease;
        text-transform: uppercase;
        font-weight: bold;
        font-size: 36px;
        line-height: 54px;
        letter-spacing: 2px;
      }
      a:hover {
        background-size: 100% 100%;
      }
    }
    li:nth-child(1),
    li:nth-child(2),
    li:nth-child(3),
    li:nth-child(4),
    li:nth-child(5) {
            margin-bottom: 40px;
    }
  }

    ul.basic {
    position: absolute;
    display: flex;
    justify-content: space-between;
    width: 50%;
    left: 50%;
    bottom: -15px;
    transform: translateX(-50%);
    text-align: center;

    li {
      a {
        
        span{
          font-family: "Poppins", sans-serif;
          font-style: normal;
          font-weight: bold;
          position: absolute;
          top:-7px;
          right: -35px;
        }

        font-weight: 500;
        position: relative;
        font-family: "Poppins", sans-serif;
        color: white;
        text-decoration: none;
        cursor: pointer;
        background-image: linear-gradient(180deg, transparent 65%, #fcf113 0);
        background-repeat: no-repeat;
        background-size: 0 100%;
        transition: background-size 0.4s ease;
        text-transform: uppercase;
        font-size: 18px;
        line-height: 54px;
        letter-spacing: 2px;
      }
      a:hover {
        background-size: 100% 100%;
      }
    }
    li:nth-child(1),
    li:nth-child(2),
    li:nth-child(3),
    li:nth-child(4),
    li:nth-child(5) {
            margin-bottom: 40px;
    }
  }
}

.ham {
  cursor: pointer;
  -webkit-tap-highlight-color: transparent;
  transition: transform 400ms;
  -moz-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;
  user-select: none;
  position: fixed;
  left: 5.86%;
  top: 2.33%;
  z-index: 3;
}
.hamRotate.active {
  transform: rotate(45deg);
}
.hamRotate180.active {
  transform: rotate(180deg);
}
.line {
  fill: none;
  transition: stroke-dasharray 400ms, stroke-dashoffset 400ms;
  stroke: #ffffff;
  stroke-width: 5.5;
  stroke-linecap: round;
}
.ham8 .top {
  stroke-dasharray: 40 160;
}
.ham8 .middle {
  stroke-dasharray: 40 142;
  transform-origin: 50%;
  transition: transform 400ms;
}
.ham8 .bottom {
  stroke-dasharray: 40 85;
  transform-origin: 50%;
  transition: transform 400ms, stroke-dashoffset 400ms;
}
.ham8.active .top {
  stroke-dashoffset: -64px;
}
.ham8.active .middle {
  transform: rotate(90deg);
}
.ham8.active .bottom {
  stroke-dashoffset: -64px;
}
</style>
