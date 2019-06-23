<template>
  <button class="back" href @click="goToPageAction">
    <svg
      class="fleche_back"
      width="40"
      height="40"
      viewBox="0 0 40 40"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        d="M26.3599 9.24001L15.3199 20.6L26.3599 32L25.9999 32.6L14.3599 20.6L25.9999 8.60001L26.3599 9.24001Z"
        fill="white"
      ></path>
    </svg>
    <!-- <p>BACK</p> -->
  </button>
</template>

<script>
if (process.client) {
}
export default {
  methods: {
    goToPageAction() {
      let lastPageName = document.referrer;
      let lastPageNameArray = lastPageName.split("");
      let lastChar = lastPageNameArray[lastPageNameArray.length - 1];
      let NameChoice =
        lastPageNameArray[lastPageNameArray.length - 10] +
        lastPageNameArray[lastPageNameArray.length - 9] +
        lastPageNameArray[lastPageNameArray.length - 8] +
        lastPageNameArray[lastPageNameArray.length - 7] +
        lastPageNameArray[lastPageNameArray.length - 6] +
        lastPageNameArray[lastPageNameArray.length - 5] +
        lastPageNameArray[lastPageNameArray.length - 4] +
        lastPageNameArray[lastPageNameArray.length - 3] +
        lastPageNameArray[lastPageNameArray.length - 2] +
        lastPageNameArray[lastPageNameArray.length - 1];
      if (lastChar != "/" && NameChoice != "nameChoice") {
        window.location.href = "/worldMap";
      } else if (NameChoice == "nameChoice") {
        window.location.href = "/nameChoice";
      } else {
        window.location.href = "/";
      }
    }
  }
};
</script>

<style lang="scss">
.back {
  cursor: pointer;
  background: transparent;
  border: none;
  display: flex;
  font-size: 14px;
  align-items: center;
  color: #fff;
  z-index: 2;

  &:after {
    font-family: "Poppins", sans-serif;
    content: "BACK";
    font-size: 14px;
    text-decoration: none;
    color: white;
  }
  &:hover {
    color: inherit;
  }
}
</style>



