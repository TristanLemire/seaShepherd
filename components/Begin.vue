<template>
  <a class="start" href="http://localhost:3000/steps/1">START</a>
</template>

<script>
export default {
  methods: {
  }
};
</script>


<style lang="scss">

.start{
  cursor: pointer;
  padding: 5px 20px 5px 20px;
  border: white solid 1px;
  border-radius: 50px;
  position: fixed;
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
