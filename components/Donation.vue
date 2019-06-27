<template>
  <a class="donation" href="http://seashepherd.fr/index.php/Soutenez-Nous/dons-ponctuels/">DONATE</a>
</template>

<script>
export default {
  methods: {
  }
};
</script>


<style lang="scss">

.donation{
  cursor: pointer;
  padding: 5px 20px 5px 20px;
  border: white solid 1px;
  border-radius: 50px;
  position: fixed;
  right: 5.86%;
  top: 5.33%;
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
