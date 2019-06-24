<template>
  <div></div>
</template>

<script>
if (process.client) {
  let fishes = ["zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob","zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob", "terry","zbeub", "bob",];
  let colors = ['blue', 'green', 'yellow', 'orange', 'dark', 'red', 'violet', 'purple'];


  fishes.forEach(fish => {
    let fishElement = document.createElement("div");
    fishElement.classList.add("fishy");
    let color = Math.round(Math.random() * (colors.length - 1));

    fishElement.classList.add(colors[color]);
    fishElement.innerHTML =
      '<div class="body"></div><div class="eye"></div><div class="tail"><div></div><div></div><div class="fin"></div>';
    
    document.querySelector('body').appendChild(fishElement);
    let topPos = Math.random() * window.innerHeight;
    let delay = Math.random() * window.innerWidth;
    let speed = Math.random() * 3;
    let leftPos = -30 - delay;
    fishElement.style.top = topPos + "px";
    
    let idInterval = setInterval(() => {
        if (leftPos > window.innerWidth + 40) {
            document.querySelector('body').removeChild(fishElement);
            clearInterval(idInterval);
        } else {
            leftPos += speed;
            fishElement.style.left = leftPos + "px";
        }
    }, 50);
  });
}

export default {};
</script>


<style lang="scss">
.fishy.green {
    .body {
        background-color: rgb(82, 185, 95);
    }
    .tail div {
        background-color: rgb(80, 163, 91);
    }
    .tail div:nth-child(2) {
        background-color: rgb(119, 209, 131);
    }
}
.fishy.blue {
    .body {
        background-color: rgb(82, 152, 185);
    }
    .tail div {
        background-color: rgb(84, 181, 206);
    }
    .tail div:nth-child(2) {
        background-color: rgb(63, 109, 153);
    }
}
.fishy.red {
    .body {
        background-color: rgb(214, 35, 35);
    }
    .tail div {
        background-color: rgb(211, 104, 104);
    }
    .tail div:nth-child(2) {
        background-color: rgb(194, 81, 81);
    }
}
.fishy.yellow {
    .body {
        background-color: rgb(255, 205, 42);
    }
    .tail div {
        background-color: rgb(245, 199, 73);
    }
    .tail div:nth-child(2) {
        background-color: rgb(241, 233, 112);
    }
}
.fishy.violet {
    .body {
        background-color: rgb(217, 67, 223);
    }
    .tail div {
        background-color: rgb(185, 90, 209);
    }
    .tail div:nth-child(2) {
        background-color: rgb(152, 85, 184);
    }
}
.fishy.dark {
    .body {
        background-color: rgb(59, 59, 58);
    }
    .tail div {
        background-color: rgb(104, 102, 99);
    }
    .tail div:nth-child(2) {
        background-color: rgb(116, 116, 116);
    }
}
.fishy {
  position: absolute;
  left: -30px;
  top: 50vh;
  .body {
    height: 20px;
    width: 30px;
    border-radius: 10px 20px;
    background-color: rgb(255, 135, 23);
  }
  .eye {
    top: 3px;
    right: 4px;
    position: absolute;
    height: 10px;
    width: 10px;
    border-radius: 5px;
    background-color: black;
    border: 3px solid white;
  }
  .tail {
    div {
      transform: rotate(-15deg) translate(-6px, 5px);

      border-radius: 4px 30px 10px 40px;
      top: -25px;
      left: -25px;
      position: absolute;
      background-color: rgb(226, 129, 39);
      height: 30px;
      width: 30px;
    }
    div:nth-child(2) {
      background-color: rgb(243, 129, 22);
      transform: rotate(-30deg) translate(-6px, 4px);
      top: -20px;
    }
  }

  .fin {
    bottom: -5px;
    transform: rotate(-5deg);
    left: 7px;
    border-radius: 10px 3px;
    opacity: 0.9;
    height: 10px;
    width: 10px;
    position: absolute;
    background-color: rgb(185, 102, 24);
  }
}
</style>
