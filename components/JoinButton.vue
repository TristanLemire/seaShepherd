<template>
  <a class="join" href="https://seashepherd.org/get-involved/crewing-at-sea/">CREWING AT SEA</a>
</template>

<script>
export default {
  methods: {
  }
};
</script>


<style lang="scss">

.join{
  cursor: pointer;
  padding: 5px 20px 5px 20px;
  border: white solid 1px;
  border-radius: 50px;
  position: absolute;
  right: 50%;
  bottom: 5.33%;
  transform: translateX(50%);
  background-color: transparent;
  color: white;
  letter-spacing: 0.1em;
  font-size: 12px;
  font-family: 'Poppins', sans-serif;
  transition: background-color .5s color .5s  border .5;
  z-index: 2;

  &:hover {
    background-color: white;
    color: #0d1b2a;
    border: white solid 1px;
  }
}
</style>