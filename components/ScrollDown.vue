<template>
  <div class="scroll-down">
    <span class="left">Scroll</span>
    <span class="mouse"></span>
    <span class="right">Down</span>
  </div>
</template>

<script>
  if (process.client) {
    let scroll = document.querySelector('.scroll-down');

    window.addEventListener('scroll', function () {
      setTimeout(function() {
        scroll.style.opacity = 0;
      }, 100);
      setTimeout(function() {
        scroll.style.opacity = 1;
      }, 500)
    })
  }
</script>


<style lang="scss">
  $dark-gray: #fff;
  $mouse-width: 12px;

  .scroll-down {
    position: fixed;
    left: 50%;
    top: 94%;
    transform: translate(-50%,-94%);
    transition: opacity .25s ease-in-out;
  }

  .mouse {
    display: inline-block;
    vertical-align: middle;
    width: $mouse-width;
    height: 22px;
    position: relative;
    border: 2px solid $dark-gray;
    border-radius: $mouse-width;
    
    &:before {
      content: '';
      display: inline-block;
      width: 2px;
      height: 6px;
      position: absolute;
      top: 5px;
      left: 3px;
      background-color: $dark-gray;
      animation: mouse-animation 2.75s ease-in-out infinite;
    }
  }

  @keyframes mouse-animation {
    0% {
    transform: scale(1,0);
    transform-origin: 50% 0;
    }
    20%, 80% {
    transform: scale(1,1);
    }
    81% {
    transform-origin: 50% 100%;  
    }
    100% {
    transform: scale(1,0);
    transform-origin: 50% 100%; 
    }
  }

  .left,
  .right {
    display: inline-block;
    vertical-align: middle;
    padding: 0 18px;
    font-size: 13px;
    font-weight: bold;
    color: $dark-gray;
    text-transform: uppercase;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  }
</style>