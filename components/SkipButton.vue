<template>
  <a class="button" href="/nameChoice">SKIP</a>
</template>

<script>
export default {
  methods: {
  }
};
</script>


<style lang="scss">

.button{
  cursor: pointer;
  padding: 10px 24px 10px 24px;
  border: white solid 1px;
  border-radius: 50px;
  position: absolute;
  right: 5.86%;
  bottom: 5.33%;
  background-color: transparent;
  color: white;
  letter-spacing: 0.1em;
  font-weight: 600;
  font-size: 14px;
  font-family: 'Poppins', sans-serif;
  transition: background-color .5s, color .5s;
  z-index: 2;

  &:hover {
    background-color: white;
    color: #0d1b2a;
    border: white solid 1px;
  }
}
</style>
