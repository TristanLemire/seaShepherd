<template>
  <div>
    <div class="menuSteps">
      <ul>
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
    <svg @click="showStepsMenu" class="book" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M39.2247 8.03876C39.222 8.03876 39.2194 8.03876 39.2169 8.03876H36.5885V7.13936C36.6026 6.78338 36.3724 6.46346 36.0302 6.36402C34.2055 5.88582 32.3264 5.64605 30.44 5.6507C27.3386 5.6507 23.113 6.34851 19.9884 9.52742C16.887 6.3175 12.6304 5.6507 9.53673 5.6507C7.65032 5.64605 5.77127 5.88582 3.9465 6.36402C3.60438 6.46346 3.3741 6.78338 3.38825 7.13936V8.03101H0.775344C0.34716 8.03101 0 8.37817 0 8.80635V33.5708C0 33.999 0.34716 34.3462 0.775344 34.3462C0.908509 34.3458 1.03935 34.3111 1.15526 34.2454C1.2328 34.2066 8.98624 29.9655 19.81 32.6947H19.9263H19.9961C20.058 32.7022 20.1204 32.7022 20.1822 32.6947C31.037 29.9422 38.7905 34.1756 38.837 34.2454C39.0769 34.3839 39.3725 34.3839 39.6123 34.2454C39.8507 34.1078 39.9984 33.8539 40 33.5786V8.8141C40 8.38592 39.6529 8.03876 39.2247 8.03876ZM1.55069 32.338V9.58945H3.40376V29.0351C3.39891 29.4633 3.7421 29.8143 4.17028 29.8191C4.21215 29.8196 4.25402 29.8167 4.29541 29.8104C5.8994 29.5655 7.5188 29.4359 9.14131 29.4227C11.3888 29.3838 13.627 29.7218 15.7627 30.4229C10.9396 29.8397 6.04739 30.4989 1.55069 32.338ZM9.14131 27.8798C7.73105 27.883 6.32245 27.9736 4.92343 28.1512V7.75188C6.43303 7.41558 7.97461 7.24394 9.52122 7.24016C12.421 7.24016 16.4218 7.90695 19.1975 11.0393L19.2208 30.3532C17.6081 29.2987 14.4602 27.8798 9.14131 27.8798ZM20.7715 11.0393C23.5472 7.93797 27.548 7.24016 30.4478 7.24016C31.9943 7.24471 33.5359 7.41626 35.0456 7.75188V28.1512C33.6544 27.972 32.2535 27.8787 30.8509 27.8721C25.5631 27.8721 22.4074 29.2909 20.7715 30.3454V11.0393ZM38.4416 32.338C33.9353 30.4939 29.0318 29.8346 24.1985 30.4229C26.3443 29.7193 28.5931 29.3812 30.8509 29.4227C32.4836 29.4319 34.1135 29.5588 35.7279 29.8027C36.1512 29.8669 36.5465 29.5758 36.6108 29.1524C36.6171 29.1111 36.62 29.0692 36.6195 29.0273V9.58945H38.4726L38.4416 32.338Z" fill="white"/>
</svg>

  </div>
</template>

<script>
export default {
  methods: {
    showStepsMenu() {
      let menuSteps = document.querySelector(".menuSteps");
      menuSteps.classList.toggle("open");
    }
  }
};
</script>


<style lang="scss">
.menuSteps {
  background: red;
  width: 100%;
  height: 100vh;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
  opacity: 0;
  transition: opacity .5s ;
  z-index: -1;

  &.open {
      z-index: 2;
      opacity: 1;
  }

  ul {
    position: absolute;
    display: flex;
    flex-direction: column;
    align-items: left;
    justify-content: space-around;
    height: 40vh;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);

    li {
      a {
        font-family: "Poppins", sans-serif;
        color: white;
        text-decoration: none;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        background-image: linear-gradient(180deg, transparent 65%, #fcf113 0);
        background-repeat: no-repeat;
        background-size: 0 100%;
        transition: background-size 0.4s ease;
      }
      a:hover {
        background-size: 100% 100%;
      }
    }
  }
}

.book {
  cursor: pointer;
  position: absolute;
  right: 5.86%;
  top: 28px;
  z-index: 2;

}
</style>
