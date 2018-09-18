/**
 * @file    planets.js
 * @version 1.0
 * @brief   星际文件系统JS
 * @date    2018-09-17
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
.pragma library
var SUN = 0;
var MERCURY = 1;
var VENUS = 2;
var EARTH = 3;
var MARS = 4;
var JUPITER = 5;
var SATURN = 6;
var URANUS = 7;
var NEPTUNE = 8;
var NUM_SELECTABLE_PLANETS = 9;
var MOON = 9;
var NBS_SYSTEM = 100;

/**
 * 根据名称获取值
 * @version 1.0
 * @brief   选中函数
 * @date    2018-09-17
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
function planetId(planetName) {
    switch(planetName){
    case "SUN":
        return SUN;
    case "MERCURY":
        return MERCURY;
    case "VENUS":
        return VENUS;
    case "EARTH":
        return EARTH;
    case "MARS":
        return MARS;
    case "JUPITER":
        return JUPITER;
    case "SATURN":
        return SATURN;
    case "URANUS":
        return URANUS;
    case "NEPTUNE":
        return NEPTUNE;
    case "MOON":
        return MOON;
    case "NBS Chain":
        return NBS_SYSTEM;
    default:
        return NBS_SYSTEM;
    }
}

/**
 * @version 1.0
 * @brief
 * @date    2018-09-17
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
function planetIndex(planetName){
    switch(planetName){
    case "SUN":
        return 0;
    case "MERCURY":
        return 1;
    case "VENUS":
        return 2;
    case "EARTH":
        return 3;
    case "MARS":
        return 4;
    case "JUPITER":
        return 5;
    case "SATURN":
        return 6;
    case "URANUS":
        return 7;
    case "NEPTUNE":
        return 8;
    case "MOON":
        return MOON;
    case "NBS Chain":
        return 100;
    default:
        return 100;
    }
}

var planets = [];
var solarDistance = 2600000;
var saturnOuterRadius = 120.700;
var uranusOuterRadius = 40;

var auScale = 149596.870700; //AU in

/**
 * @version 1.0
 * @brief   初始化星际图TODO
 * @date    2018-09-17
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
function loadPlanetData(){
    var NbsChain = {
        radius:694.439,
        x:0,y:0,z:0,roll:0,
    }

    planets.push(NbsChain);
}

/**
 * @version 1.0
 * @brief
 * @date    2018-09-17
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
function getOuterRadius(planet){
    var outerRadius = solarDistance;
    if(planet !== solarDistance){
        outerRadius = planets[planet]["radius"];
        if(planet === SATURN){
            outerRadius =+ saturnOuterRadius;
        }else if(planet === URANUS){
            outerRadius =+ uranusOuterRadius;
        }else if(planet === SUN){
            outerRadius = planets[planet]["radius"]/100;
        }
    }
    return outerRadius;
}
