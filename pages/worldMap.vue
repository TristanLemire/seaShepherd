<template>
  <div class="worldMap">
    <Menu/>
    <div id="chartdiv" ></div>
    <div class="home__button">
      <SoundButton/>
      <Logo/>
    </div>
  </div>
</template>

<script>
import Menu from "~/components/Menu.vue";
import SoundButton from "~/components/SoundButton.vue";
import Logo from "~/components/Logo.vue";
import { returnStatement } from "babel-types";

if(process.client){
  // Colors
let countriesColor = '#3d3d3d';
let countriesHoverColor = '#367B25';

let dotsColor = '#fff';
let dotsStrokeColor = '#666';
let dotHoverColor = '#df7e00';

let seaColor = '#004c79';


// Imports
am4core.useTheme(am4themes_animated);
am4core.useTheme(am4themes_dark);

//! Creating the map
let map = am4core.create("chartdiv", am4maps.MapChart);
map.geodata = am4geodata_worldLow;
map.projection = new am4maps.projections.Orthographic();

// Background:
map.backgroundSeries.mapPolygons.template.polygon.fill = am4core.color(seaColor);
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
city.strokeWidth = 2;
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
    return city;
}

//! Instanciating cities

let paris = addCity({ "latitude": 48.8567, "longitude": 2.3510 }, "Paris");
let toronto = addCity({ "latitude": 43.8163, "longitude": -79.4287 }, "Toronto");
let la = addCity({ "latitude": 34.3, "longitude": -118.15 }, "Los Angeles");
let havana = addCity({ "latitude": 23, "longitude": -82 }, "Havana");

// Animations on hover

function addAnimation(city) {
    let bulletAlertCircle = city.createChild(am4core.Circle);
    bulletAlertCircle.longitude = 2.3510;
    bulletAlertCircle.latitude = 48.8567;
    bulletAlertCircle.fillOpacity = 0;
    bulletAlertCircle.stroke = am4core.color(dotHoverColor);
    bulletAlertCircle.strokeOpacity = 1;
    bulletAlertCircle.radius = 5;
    bulletAlertCircle.strokeWidth = 3;
    bulletAlertCircle.visible = false;
    let bulletAlertAnimation = bulletAlertCircle.animate([{ property: "radius", to: 30 }, { property: "strokeOpacity", to: 0, from: 0.8 }], 1500).loop();

    city.events.on('over', () => {
        bulletAlertCircle.visible = true;
    })
    city.events.on('out', () => {
        setTimeout(() => {
            bulletAlertCircle.visible = false;
        }, 2000);
    })
}

addAnimation(paris);
addAnimation(toronto);
addAnimation(la);
addAnimation(havana);

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
addLine(paris, toronto);
addLine(toronto, la);
addLine(la, havana);

}

export default {
    head () {
    return {
      script: [,
        { src: 'https://www.amcharts.com/lib/4/core.js' },
        { src: 'https://www.amcharts.com/lib/4/charts.js' },
        { src: 'https://www.amcharts.com/lib/4/maps.js' },
        { src: 'http://www.amcharts.com/lib/4/geodata/continentsLow.js' },
        { src: 'http://www.amcharts.com/lib/4/themes/animated.js' },
        { src: 'http://www.amcharts.com/lib/4/themes/dark.js' },
        { src: 'http://www.amcharts.com/lib/4/geodata/worldLow.js' },
      ]
    } 
  },
  components: {
    Menu,
    SoundButton,
    Logo
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
            height: 100vh;
            width: 100vw;
            z-index: 30;
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
</style>
