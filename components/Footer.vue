<template>
  <footer>
    <div class="input__content">
      <form action="">
        <label for="answer">Do you know how to swim?</label>
        <input type="text" name="answer" id="answer" @input="checkAnswer">
        <input id="submit" value="CONTINUE THE ADVENTURE" disabled @click="redirection()">
      </form>
    </div>
    <svg class="boat" width="1113" height="231" viewBox="0 0 1113 231" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M33.5 69.4997C240 5.99979 475.624 18.1938 602.5 95.5C760 191.466 873.5 274.999 1081.5 198.5" stroke="white" stroke-width="4" stroke-dasharray="10 10" id="moove"/>
      <circle cx="29.5" cy="74.5" r="28.5" fill="white"/>
      <circle cx="29.5" cy="74.5" r="15.5" fill="#0D1B2A"/>
      <circle cx="1084.5" cy="200.5" r="28.5" fill="white"/>
      <circle cx="1084.5" cy="200.5" r="15.5" fill="#1B263B"/>
      <g id="journey" clip-path="url(#clip0)">
        <animateMotion dur="4s" repeatCount=1 rotate="auto" begin="indefinite">
          <mpath xlink:href="#moove"></mpath>
        </animateMotion>
        <path d="M51.3987 41.6301C51.3987 42.478 50.8141 43.1651 50.0928 43.1651C49.3715 43.1651 48.7869 42.478 48.7869 41.6301C48.7869 40.7823 49.3715 40.0952 50.0928 40.0952C50.8141 40.0952 51.3987 40.7823 51.3987 41.6301Z" fill="url(#paint20_linear)"/>
        <path d="M43.5633 41.6297C43.5633 42.4775 42.9787 43.1646 42.2574 43.1646C41.5361 43.1646 40.9515 42.4775 40.9515 41.6297C40.9515 40.7818 41.5361 40.0947 42.2574 40.0947C42.9787 40.0947 43.5633 40.7818 43.5633 41.6297Z" fill="url(#paint21_linear)"/>
        <path d="M35.728 41.6301C35.728 42.478 35.1434 43.1651 34.4221 43.1651C33.7008 43.1651 33.1162 42.478 33.1162 41.6301C33.1162 40.7823 33.7008 40.0952 34.4221 40.0952C35.1434 40.0952 35.728 40.7823 35.728 41.6301Z" fill="url(#paint22_linear)"/>
        <path d="M27.8926 41.6301C27.8926 42.478 27.308 43.1651 26.5867 43.1651C25.8654 43.1651 25.2808 42.478 25.2808 41.6301C25.2808 40.7823 25.8654 40.0952 26.5867 40.0952C27.308 40.0952 27.8926 40.7823 27.8926 41.6301Z" fill="url(#paint23_linear)"/>
        <path d="M20.0572 41.6301C20.0572 42.478 19.4726 43.1651 18.7513 43.1651C18.03 43.1651 17.4454 42.478 17.4454 41.6301C17.4454 40.7823 18.03 40.0952 18.7513 40.0952C19.4726 40.0952 20.0572 40.7823 20.0572 41.6301Z" fill="url(#paint24_linear)"/>
        <path d="M66.5471 55.4442C65.3285 55.4442 64.2088 54.7786 63.0227 54.0741C62.1851 53.5771 61.2782 53.038 60.2666 52.7029L67.7229 34.5691C67.9188 34.0937 67.8923 33.5331 67.6535 33.0858C67.4148 32.6379 66.997 32.3663 66.5476 32.3663L59.2346 32.3663L59.2346 24.6916C59.2346 23.8438 58.6495 23.1567 57.9287 23.1567C57.2074 23.1567 56.6228 23.8438 56.6228 24.6916L56.6228 32.3663H54.7502L43.9526 11.2137C43.5812 10.487 42.7793 10.2513 42.161 10.6872C41.5423 11.1237 41.3418 12.0663 41.7127 12.7936L44.6524 18.5519L31.8103 18.5519L31.8103 12.2072C32.2005 11.9416 32.4633 11.4457 32.4633 10.8773C32.4633 10.0295 31.8787 9.34238 31.1574 9.34238H30.5044C29.7831 9.34238 29.1985 10.0295 29.1985 10.8773L29.1985 18.5519H23.975L23.9749 1.66774C23.9749 0.819932 23.3903 0.132813 22.669 0.132813L14.8337 0.132813C14.1124 0.132813 13.5278 0.819932 13.5278 1.66774L13.5278 18.5519H10.916C10.1947 18.5519 9.61013 19.2391 9.61014 20.0869L9.61015 32.3663H2.29715C1.88294 32.3663 1.49321 32.5977 1.24734 32.9892C1.00095 33.3808 0.927498 33.8862 1.04891 34.3515L6.51787 53.7995C6.36178 53.8846 6.2067 53.9698 6.05367 54.0543C4.759 54.769 3.53626 55.4442 2.29719 55.4442C1.57589 55.4442 0.991296 56.1313 0.991297 56.9791C0.991299 57.8269 1.57589 58.514 2.29719 58.514C4.72585 58.514 6.68162 56.9881 8.59761 56.0779C9.51735 55.6396 10.2325 55.4442 10.9161 55.4442C12.1123 55.4442 13.0831 56.0683 14.2073 56.7908C15.4638 57.5984 16.888 58.514 18.7514 58.514C20.6149 58.514 22.0391 57.5984 23.2955 56.7908C24.4198 56.0677 25.3906 55.4442 26.5868 55.4442C27.783 55.4442 28.7538 56.0683 29.8781 56.7908C31.1345 57.5984 32.5587 58.514 34.4222 58.514C36.2856 58.514 37.7099 57.5984 38.9663 56.7908C40.0906 56.0677 41.0613 55.4442 42.2575 55.4442C43.4537 55.4442 44.4245 56.0683 45.5488 56.7908C46.8052 57.5984 48.2294 58.514 50.0929 58.514C51.9339 58.514 53.454 57.611 54.7956 56.8142C55.9816 56.1097 57.1013 55.4442 58.32 55.4442C59.5387 55.4442 60.6589 56.1097 61.8444 56.8142C63.186 57.611 64.7061 58.514 66.5471 58.514C67.2684 58.514 67.853 57.8269 67.853 56.9791C67.853 56.1313 67.2684 55.4442 66.5471 55.4442V55.4442ZM16.1396 3.20267L21.3631 3.20267L21.3632 18.5519H16.1396L16.1396 3.20267ZM12.2219 21.6218L46.2195 21.6218L51.7043 32.3663H43.5634L43.5634 29.2964C43.5634 28.4492 42.9788 27.7615 42.2575 27.7615C41.5362 27.7615 40.9516 28.4492 40.9516 29.2964L40.9516 32.3663H35.728L35.728 29.2964C35.728 28.4492 35.1434 27.7615 34.4221 27.7615C33.7008 27.7615 33.1162 28.4492 33.1162 29.2964L33.1162 32.3663H27.8927L27.8927 29.2964C27.8927 28.4492 27.3081 27.7615 26.5868 27.7615C25.8655 27.7615 25.2809 28.4492 25.2809 29.2964L25.2809 32.3663H12.2219L12.2219 21.6218ZM53.6173 54.0741C52.4318 54.7786 51.3115 55.4442 50.0929 55.4442C48.8972 55.4442 47.9259 54.82 46.8021 54.0975C45.5452 53.2899 44.1215 52.3743 42.2575 52.3743C40.3941 52.3743 38.9698 53.2899 37.7134 54.0975C36.5891 54.82 35.6184 55.4442 34.4222 55.4442C33.2265 55.4442 32.2552 54.82 31.1314 54.0975C29.8745 53.2899 28.4508 52.3743 26.5868 52.3743C24.7233 52.3743 23.2991 53.2899 22.0427 54.0975C19.259 55.8872 18.2995 55.9226 15.4607 54.0975C14.2043 53.2899 12.78 52.3743 10.9166 52.3743C10.208 52.3743 9.54438 52.511 8.96132 52.6945L4.06419 35.4361H64.4658L57.4737 52.4397C56.0051 52.6585 54.7472 53.4032 53.6173 54.0741V54.0741Z" fill="url(#paint25_linear)"/>
        <path d="M38.3397 10.8772C38.3397 11.725 37.7551 12.4122 37.0338 12.4122C36.3125 12.4122 35.7279 11.725 35.7279 10.8772C35.7279 10.03 36.3125 9.34229 37.0338 9.34229C37.7551 9.34229 38.3397 10.03 38.3397 10.8772Z" fill="url(#paint26_linear)"/>
      </g>
      <defs>
        <linearGradient id="paint20_linear" x1="48.7869" y1="40.0952" x2="51.8603" y2="42.5982" gradientUnits="userSpaceOnUse">
          <stop stop-color="#E8E22E"/>
          <stop offset="1" stop-color="#F5B223"/>
        </linearGradient>
        <linearGradient id="paint21_linear" x1="40.9515" y1="40.0947" x2="44.025" y2="42.5977" gradientUnits="userSpaceOnUse">
          <stop stop-color="#E8E22E"/>
          <stop offset="1" stop-color="#F5B223"/>
        </linearGradient>
        <linearGradient id="paint22_linear" x1="33.1162" y1="40.0952" x2="36.1897" y2="42.5982" gradientUnits="userSpaceOnUse">
          <stop stop-color="#E8E22E"/>
          <stop offset="1" stop-color="#F5B223"/>
        </linearGradient>
        <linearGradient id="paint23_linear" x1="25.2808" y1="40.0952" x2="28.3542" y2="42.5982" gradientUnits="userSpaceOnUse">
          <stop stop-color="#E8E22E"/>
          <stop offset="1" stop-color="#F5B223"/>
        </linearGradient>
        <linearGradient id="paint24_linear" x1="17.4454" y1="40.0952" x2="20.5189" y2="42.5982" gradientUnits="userSpaceOnUse">
          <stop stop-color="#E8E22E"/>
          <stop offset="1" stop-color="#F5B223"/>
        </linearGradient>
        <linearGradient id="paint25_linear" x1="0.991211" y1="0.132812" x2="60.4257" y2="65.2893" gradientUnits="userSpaceOnUse">
          <stop stop-color="#E8E22E"/>
          <stop offset="1" stop-color="#F5B223"/>
        </linearGradient>
        <linearGradient id="paint26_linear" x1="35.7279" y1="9.34229" x2="38.8014" y2="11.8453" gradientUnits="userSpaceOnUse">
          <stop stop-color="#E8E22E"/>
          <stop offset="1" stop-color="#F5B223"/>
        </linearGradient>
        <clipPath id="clip0">
          <rect width="66.862" height="78.5885" fill="white" transform="matrix(1 0 1.52222e-06 1 0 0)"/>
        </clipPath>
      </defs>
    </svg>


    <svg width="1366" height="508" viewBox="0 0 1366 508" fill="none" xmlns="http://www.w3.org/2000/svg" class="waves">
      <g filter="url(#filter0_d)">
      <path d="M632.72 40.4763C422.489 29.8788 69.8697 198.787 2 282.86V435H1367V81.5481C948.08 201.872 923.752 55.1469 632.72 40.4763Z" fill="url(#paint0_linear)"/>
      </g>
      <g filter="url(#filter1_d)">
      <path d="M736.28 71.4763C946.511 60.8788 1299.13 229.787 1367 313.86V466H2V112.548C420.92 232.872 445.248 86.1469 736.28 71.4763Z" fill="url(#paint1_linear)"/>
      </g>
      <g filter="url(#filter2_d)">
      <path d="M541.53 181.502C327.907 171.926 69.9648 301.639 1 377.608V538H1367V212.449C941.321 321.176 837.257 194.759 541.53 181.502Z" fill="url(#paint2_linear)"/>
      </g>
      <g filter="url(#filter3_d)">
      <path d="M734.28 284.476C944.511 273.879 1297.13 442.787 1365 526.86V679H0V325.548C418.92 445.872 443.248 299.147 734.28 284.476Z" fill="url(#paint3_linear)"/>
      </g>
      <g filter="url(#filter4_d)">
      <path d="M631.72 351.476C421.489 340.879 68.8697 509.787 1 593.86V746H1366V392.548C947.08 512.872 922.752 366.147 631.72 351.476Z" fill="url(#paint4_linear)"/>
      </g>
      <defs>
      <filter id="filter0_d" x="2" y="0" width="1435" height="435" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
      <feFlood flood-opacity="0" result="BackgroundImageFix"/>
      <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
      <feOffset dx="50" dy="-20"/>
      <feGaussianBlur stdDeviation="10"/>
      <feColorMatrix type="matrix" values="0 0 0 0 0.0509804 0 0 0 0 0.105882 0 0 0 0 0.164706 0 0 0 0.1 0"/>
      <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
      <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
      </filter>
      <filter id="filter1_d" x="2" y="31" width="1435" height="435" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
      <feFlood flood-opacity="0" result="BackgroundImageFix"/>
      <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
      <feOffset dx="50" dy="-20"/>
      <feGaussianBlur stdDeviation="10"/>
      <feColorMatrix type="matrix" values="0 0 0 0 0.0509804 0 0 0 0 0.105882 0 0 0 0 0.164706 0 0 0 0.1 0"/>
      <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
      <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
      </filter>
      <filter id="filter2_d" x="1" y="141" width="1436" height="397" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
      <feFlood flood-opacity="0" result="BackgroundImageFix"/>
      <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
      <feOffset dx="50" dy="-20"/>
      <feGaussianBlur stdDeviation="10"/>
      <feColorMatrix type="matrix" values="0 0 0 0 0.0509804 0 0 0 0 0.105882 0 0 0 0 0.164706 0 0 0 0.1 0"/>
      <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
      <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
      </filter>
      <filter id="filter3_d" x="0" y="244" width="1435" height="435" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
      <feFlood flood-opacity="0" result="BackgroundImageFix"/>
      <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
      <feOffset dx="50" dy="-20"/>
      <feGaussianBlur stdDeviation="10"/>
      <feColorMatrix type="matrix" values="0 0 0 0 0.0509804 0 0 0 0 0.105882 0 0 0 0 0.164706 0 0 0 0.1 0"/>
      <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
      <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
      </filter>
      <filter id="filter4_d" x="1" y="311" width="1435" height="435" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
      <feFlood flood-opacity="0" result="BackgroundImageFix"/>
      <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
      <feOffset dx="50" dy="-20"/>
      <feGaussianBlur stdDeviation="10"/>
      <feColorMatrix type="matrix" values="0 0 0 0 0.0509804 0 0 0 0 0.105882 0 0 0 0 0.164706 0 0 0 0.1 0"/>
      <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
      <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape"/>
      </filter>
      <linearGradient id="paint0_linear" x1="1291.81" y1="133.757" x2="100.834" y2="403.137" gradientUnits="userSpaceOnUse">
      <stop stop-color="#1B263B"/>
      <stop offset="1" stop-color="#0D1B2A"/>
      </linearGradient>
      <linearGradient id="paint1_linear" x1="41.3305" y1="103.988" x2="1417.51" y2="594.23" gradientUnits="userSpaceOnUse">
      <stop stop-color="#1B263B"/>
      <stop offset="1" stop-color="#415A77"/>
      </linearGradient>
      <linearGradient id="paint2_linear" x1="1211.25" y1="265.792" x2="32.3771" y2="368.667" gradientUnits="userSpaceOnUse">
      <stop stop-color="#778DA9"/>
      <stop offset="1" stop-color="#415A77"/>
      </linearGradient>
      <linearGradient id="paint3_linear" x1="39.3305" y1="316.988" x2="1415.51" y2="807.23" gradientUnits="userSpaceOnUse">
      <stop stop-color="#1B263B"/>
      <stop offset="1" stop-color="#415A77"/>
      </linearGradient>
      <linearGradient id="paint4_linear" x1="1290.81" y1="444.757" x2="99.8335" y2="714.137" gradientUnits="userSpaceOnUse">
      <stop stop-color="#1B263B"/>
      <stop offset="1" stop-color="#0D1B2A"/>
      </linearGradient>
      </defs>
    </svg>

  </footer>
</template>

<script>
  if ( process.client ) {
    let step = document.querySelector('#submit');
    let anime = document.querySelector('.boat animateMotion')
    let input = document.querySelector('form')
    let transform = document.querySelector('#journey')

    step.addEventListener('click',function(){
      transform.style.transform = 'translateY(-55px)';
      anime.beginElement();
    },false);
  }

  export default {
    methods: {
      checkAnswer() {
        /* Ceci est un test */
        const inputText = document.querySelector('#answer')
        const submit = document.querySelector('#submit')

        /* inputText.value.toLowerCase().trim() === ('yes') || ('no') ? submit.removeAttribute('disabled') : submit.setAttribute('disabled', '') */
        if ( 
          inputText.value.toLowerCase().trim() === 'yes' ||
          inputText.value.toLowerCase().trim() === 'no'
         ) {
           submit.removeAttribute('disabled')
         } else {
           submit.setAttribute('disabled', '')
         }
      },

      redirection() {
        setTimeout( function() {
          document.location.href=""
        }, 3900)
      }
    }
  }
</script>

<style lang="scss">

  footer {
    height: 100vh;
    width: 100%;
    min-height: 100vh;
    background: #0D1B2A;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    position: relative;

    #journey {
      
    }

    .boat {
      position: absolute;
      z-index: 1;
      height: 35vh;
      top: 55%;
    }

    .input__content {
      width: auto;
      form {
        width: 100%; 
        display: flex;
        flex-direction: column;
        align-items: center;
        position: absolute;
        left: 50%;
        top:60%;
        transform: translate(-50%,-50%);
        width: 40%;
        height: 80vh;
      }
      
      label {
        color: #fff;
        font-size: 32px;
      }

      input[type="text"] {
        margin-top: 40px;
        color: #fff;
        font-size: 32px;
        width: 100%;
        background-color: transparent;
        border: none;
        border-bottom: 2px solid white;
        padding-bottom: 4px;
      }

      #submit {
        cursor: pointer;
        background-color: transparent;
        color: #fff;
        font-size: 16px;
        border-radius: 20px;
        padding: 11px 14px; 
        position: absolute;
        bottom: 7%;
        z-index: 3;
        width:43%;

        &:disabled {
          opacity: 0.6;
        }
      }
    }
  }

  .waves {
    min-width: 100%;
    height: auto;
  }
  

</style>