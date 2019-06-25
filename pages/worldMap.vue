<template>
  <div class="worldMap">
<audio class="musique" loop autoplay :src="require('@/assets/music/musique.mp3')"></audio>
    <StepsMenu/>
    <div id="chartdiv"></div>
    <div class="home__button">
      <SoundButton/>
      <Logo/>
    </div>
    <div class="console">
      <P></P>
    </div>
    <div class="steps">
      <p
        :id="step.id"
        v-for="step in stepList"
        :key="step.id"
        :data-description="step.description"
        :data-long="step.longitude"
        :data-lat="step.latitude"
        :data-title="step.title"
        :data-id="step.id"
      ></p>
    </div>
  </div>
</template>

<script>
import StepsMenu from "~/components/StepsMenu.vue";
import SoundButton from "~/components/SoundButton.vue";
import Logo from "~/components/Logo.vue";
import { returnStatement } from "babel-types";

if (process.client) {
  if (!localStorage.getItem('user')) window.location.href = '/nameChoice';

  let audiotime = document.querySelector('.musique');
  audiotime.currentTime = localStorage.getItem('audioTime');

    window.addEventListener('click', () => {
      let audiotime = document.querySelector('.musique');
      localStorage.setItem('audioTime',audiotime.currentTime);
  })
  
  let consoleWelcome = document.querySelector(".console p");
  consoleWelcome.innerHTML =
    "Hey " +
    JSON.parse(localStorage.getItem("user"))[0]["name"] +
    ",  Welcome to the Sea-Shepherd experience.";
  
  
  
  // Colors
  let countriesColor = "#576370";
  let countriesHoverColor = "#ffffff";
  let outlineColor = "#fff";

  let dotsColor = "#EECB29";
  let dotsStrokeColor = "#fff";
  let dotHoverColor = "#df7e00";

  let seaColor = "#193350";

  // Imports
  am4core.useTheme(am4themes_animated);
  am4core.useTheme(am4themes_dark);

  //! Creating the map
  let map = am4core.create("chartdiv", am4maps.MapChart);
  map.geodata = am4geodata_worldLow;
  map.projection = new am4maps.projections.Orthographic();

  //Disabling double-click zoom
  map.seriesContainer.events.disableType("doublehit");
  map.chartContainer.background.events.disableType("doublehit");
  map.maxZoomLevel = 0;
  map.minZoomCount = 0;
  map.seriesContainer.draggable = false;
  map.seriesContainer.resizable = false;

  // Background:
  map.backgroundSeries.mapPolygons.template.polygon.fill = am4core.color(
    seaColor
  );
  map.backgroundSeries.mapPolygons.template.polygon.fillOpacity = 1;

  // Rotate map on drag
  map.panBehavior = "rotateLongLat";

  // Adding outlines
  let polygonSeries = new am4maps.MapPolygonSeries();
  polygonSeries.useGeodata = true;
  map.series.push(polygonSeries);

  // Configure series
  let polygonTemplate = polygonSeries.mapPolygons.template;
  polygonTemplate.fill = am4core.color(countriesColor);

  polygonTemplate.propertyFields.fill = "fill";

  var hs = polygonTemplate.states.create("hover");
  hs.properties.fill = am4core.color(countriesHoverColor);
  // Map init end
  // ------------

  // Points

  let cities = map.series.push(new am4maps.MapImageSeries());
  cities.mapImages.template.nonScaling = true;

  // City style
  let city = cities.mapImages.template.createChild(am4core.Circle);
  city.radius = 6;
  city.fill = am4core.color(dotsColor);
  city.strokeWidth = 4;
  city.stroke = am4core.color(dotsStrokeColor);

  /**
   * This function is used to create a new city point on the map
   *
   * @param {Object} coords An object with a latitude and a longitude
   * @param {String} title City name
   * @returns the city
   */
  function addCity(coords, title) {
    let city = cities.mapImages.create();
    city.latitude = coords.latitude;
    city.longitude = coords.longitude;
    // city.tooltipText = '<div class="title">'+title+'</div>';
    return city;
  }

  //! Instanciating cities

  // let paris = addCity({ latitude: 48.8567, longitude: 2.351 }, "Paris");
  // let toronto = addCity({ latitude: 43.8163, longitude: -79.4287 }, "Toronto");
  // let la = addCity({ latitude: 34.3, longitude: -118.15 }, "Los Angeles");
  // let havana = addCity({ latitude: 23, longitude: -82 }, "Havana");

  // Animations on hover

  function addAnimation(city) {
    let bulletAlertCircle = city.createChild(am4core.Circle);
    bulletAlertCircle.longitude = 2.351;
    bulletAlertCircle.latitude = 48.8567;
    bulletAlertCircle.fillOpacity = 0;
    bulletAlertCircle.stroke = am4core.color(dotHoverColor);
    bulletAlertCircle.strokeOpacity = 1;
    bulletAlertCircle.radius = 5;
    bulletAlertCircle.strokeWidth = 3;
    bulletAlertCircle.visible = false;
    let bulletAlertAnimation = bulletAlertCircle
      .animate(
        [
          { property: "radius", to: 30 },
          { property: "strokeOpacity", to: 0, from: 0.8 }
        ],
        1500
      )
      .loop();

    city.events.on("over", () => {
      bulletAlertCircle.visible = true;
    });
    city.events.on("out", () => {
      setTimeout(() => {
        bulletAlertCircle.visible = false;
      }, 2000);
    });

    city.events.on("hit", () => {
      // Remove the other tooltip if existing
      let oldTooltips = document.querySelectorAll('.tooltip');
      if (oldTooltips.length > 0) {
        oldTooltips.forEach(tooltip => document.querySelector('body').removeChild(tooltip));
      }

      // Get mouse position 
      var x = event.clientX - 100 ;     // Get the horizontal coordinate
      var y = event.clientY + 20;     // Get the vertical coordinate

      // Get the step infos
      let id = city.dom.className.baseVal
      let titleText = ''
      let descriptionText = ''
      let stepLink = ''
      id =  String(id).substring(5,id.length);
      let infos = document.querySelectorAll('p');
      
      infos.forEach(info => {
        if (info.id === id) {
          descriptionText = info.getAttribute('data-description')
          titleText = info.getAttribute('data-title')
          stepLink = 'http://localhost:3000/steps/' + id
        }
      })

      // Create a new tooltip
      let tooltip =  document.createElement('div');
      tooltip.classList.add('tooltip');

      let title = document.createElement('p');
      title.classList.add('tooltip__title');
      title.innerHTML = titleText

      let description = document.createElement('p');
      description.classList.add('tooltip__description');
      description.innerHTML = descriptionText

      let link = document.createElement('a');
      link.classList.add('tooltip__link');
      link.innerHTML = 'BEGIN';
      link.setAttribute('href', stepLink);

      let deleteButton = document.createElement('p');
      deleteButton.classList.add('delete');

      deleteButton.addEventListener('click', () => {
        document.querySelector('body').removeChild(tooltip);
      })

      tooltip.appendChild(title)
      tooltip.appendChild(description)
      tooltip.appendChild(link)
      tooltip.appendChild(deleteButton)

      tooltip.style.left = x + "px"
      tooltip.style.top = y + "px"

      document.querySelector('body').appendChild(tooltip);
      /*
      <div class="tooltip">
      <p class="tooltip__title">Step 1</p>
      <p class="tooltip__description">Boarding and departure</p>
      <a href="#" class="tooltip__link">BEGIN</a>
    </div>
     */
    });
  }

  // addAnimation(paris);
  // addAnimation(toronto);
  // addAnimation(la);
  // addAnimation(havana);

  //! Lines

  // Add lines
  let lineSeries = map.series.push(new am4maps.MapLineSeries());
  lineSeries.mapLines.template.line.strokeWidth = 2;
  lineSeries.mapLines.template.line.strokeOpacity = 0.5;
  lineSeries.mapLines.template.line.stroke = city.fill;
  lineSeries.mapLines.template.line.nonScalingStroke = true;
  lineSeries.mapLines.template.line.strokeDasharray = "1,1";
  lineSeries.zIndex = 10;

  let shadowLineSeries = map.series.push(new am4maps.MapLineSeries());
  shadowLineSeries.mapLines.template.line.strokeOpacity = 0;
  shadowLineSeries.mapLines.template.line.nonScalingStroke = true;
  shadowLineSeries.mapLines.template.shortestDistance = false;
  shadowLineSeries.zIndex = 5;

  function addLine(from, to) {
    let line = lineSeries.mapLines.create();
    line.imagesToConnect = [from, to];
    line.line.controlPointDistance = -0.3;

    let shadowLine = shadowLineSeries.mapLines.create();
    shadowLine.imagesToConnect = [from, to];

    return line;
  }

  // Instanciating lines
  // addLine(paris, toronto);
  // addLine(toronto, la);
  // addLine(la, havana);

  // Dynamic points on the map
  setTimeout(() => {
    let steps = document.querySelectorAll(".steps p");
    steps.forEach(step => {
      let id = step.getAttribute("data-id");
      let title = step.getAttribute("data-title");
      let longitude = Number(step.getAttribute("data-lat"));
      let latitude = Number(step.getAttribute("data-long"));

      let point = addCity(
        {
          latitude: longitude,
          longitude: latitude
        },
        title
      );
      point.dom.classList.add('step-'+id);
      addAnimation(point);
    });
  }, 100);
}

export default {
  head() {
    return {
      script: [
        { src: "https://www.amcharts.com/lib/4/core.js" },
        { src: "https://www.amcharts.com/lib/4/charts.js" },
        { src: "https://www.amcharts.com/lib/4/maps.js" },
        { src: "http://www.amcharts.com/lib/4/geodata/continentsLow.js" },
        { src: "http://www.amcharts.com/lib/4/themes/animated.js" },
        { src: "http://www.amcharts.com/lib/4/themes/dark.js" },
        { src: "http://www.amcharts.com/lib/4/geodata/worldLow.js" }
      ]
    };
  },
  components: {
    SoundButton,
    Logo,
    StepsMenu
  },
  asyncData({ params }) {
    return fetch("http://localhost:3000/api/steps", { method: "GET" })
      .then(response => {
        return response.json();
      })
      .then(response => {
        return { stepList: response };
      });
  },
  methods: {
    soundActive: function() {
      let video = document.querySelector("video");
      let active = localStorage.getItem("sound");
      let audios = document.querySelectorAll("audio");
      if (active == "OFF") {
        if (video != null) {
          video.volume = 0;
        }
        if (audios.length > 0) {
          audios.forEach(audio => {
            audio.pause();
          });
        }
      }
    }
  },
  beforeMount() {
    this.soundActive();
  }
};
</script>

<style lang="scss">
body {
  background-color: #0d1b2a;
  height: 100vh;
  width: 100%;
}

#chartdiv {
  height: 75vh;
  width: 100%;
  z-index: 1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

div.worldMap {
  overflow: hidden;
  height: 100vh;
  width: 100%;
}

div.console {
  width: 25%;
  position: absolute;
  right: 0;
  bottom: 5.33%;
  padding-left: 30px;
  border-left: 1px solid #415a77;
  color: white;
  font-family: Poppins;
  font-size: 14px;
  line-height: 21px;
  letter-spacing: 2px;
}

.tooltip {
  position: absolute;
  top: 50vh;
  left: 50vw;
  box-shadow: 2px 5px 10px rgba(13, 27, 42, 0.3);
  background-color: #fff;
  width: 200px;
  height: 125px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  z-index: 1;
  transition: transform 0.3s;
  border-radius: 10px;

  &__title {
    text-transform: uppercase;
    font-weight: bold;
    margin-bottom: 10px;
  }

  &__description {
    margin-bottom: 10px;
  }

  &__link {
    font-weight: bold;
    width: 100px;
    text-decoration: none;
    color: black;
    border: 1px solid black;
    border-radius: 30px;
    padding: 5px 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    
    &:hover {
      color: gold;
      border: 1px solid gold;
    }
  }



  .delete {
    top: 10px;
    right: 10px;
    position: absolute;
  }

  &:hover {
    transform: scale(1.05);
  }
}
</style>
