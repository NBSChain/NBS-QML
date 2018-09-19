import QtQuick 2.11 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0

import "planets.js" as Planets
/**
 * @file    NbsNetSystem.qml
 * @version 1.0
 * @brief   NNS 网络系统 TODO
 * @date    2018-09-18
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Entity {
    id                                              : sceneRoot;

    property bool       ready                       : false;
    property real       cameraNear                  : 0;            //镜头远近
    property real       xLookAtOffset               : 0;            //x
    property real       yLookAtOffset               : 0;            //y
    property real       zLookAtOffset               : 0;            //z

    property real       xCameraOffset               : 0;            //x
    property real       yCameraOffset               : 0;            //y
    property real       zCameraOffset               : 0;            //z

    property var        planetData;
    property var        planets                     : [];           //NBS节点集合

    property vector3d   defautUp                    : Qt.vector3d(0,1,0);
    property vector3d   defaultCameraPos            : Qt.vector3d(
                                                        Planets.solarDistance,Planets.solarDistance,Planets.solarDistance);

    property vector3d   tiltAxis                    : Qt.vector3d(0,0,1);
    property vector3d   rollAxis                    : Qt.vector3d(0,1,0);

    property real       cameraDistance              : 1;
    property vector3d   oldCameraPosition;
    property vector3d   oldFocusedPlanetPosition;

    property color      ambientStrengthStarfield    : "#000000";
    property color      ambientStrengthSun          : "#ffffff";
    property color      ambientStrengthClouds       : "#000000";

    property color      ambientStrengthRing         : "#111111";
    property color      ambientStrengthPlanet       : "#2222222";

    property real       shininessSpecularMap        : 50.0;
    property real       shininessClouds             : 10.0;
    property real       shininessBasic              : 1.0;

    property real       saturnRingInnerRadius;                          //土星内环半径
    property real       saturnRingOuterRadius;                          //土星外环半径
    property real       uranusRingInnerRadius;                          //天王星内环
    property real       uranusRingOuterRadius;                          //天王星外环半径

    /*时间变量: 用于控制*/
    property int        year                        : 2000;
    property int        month                       : 1;
    property int        day                         : 1;

    /*时间尺度*/
    // Time scale formula based on http://www.stjarnhimlen.se/comp/ppcomp.html
    property real       startD                      : 367*year - 7*(year+(month+9)/12)/4 + 275*month/9+day-730530;
    property real       oldTimeD                    : startD;
    property real       currTimeD                   : startD;
    property real       deltaTimeD                  : 0;
    property real       daysPerFrame;
    property real       daysPerFrameScale;

    property real       planetScale;

    property bool       focusedScaling              : false;
    property int        focusedMinimumScale         : 20;
    property real       actualScale;


    FrameAction {
        onTriggered: {
            frames++;
            animate(focusedPlanet)
        }
    }

    PlanetsLight {
        id      : light;
        ratio   : width /height;
    }

    Camera {
        id                      : camera;
        projectionType          : CameraLens.PerspectiveProjection;
        fieldOfView             : 45;
        aspectRatio             : width/height;
        nearPlane               : 2500000.0;
        farPlane                : 20000000.0;
        position                : defaultCameraPos;
        upVector                : defautUp;
        viewCenter              : Qt.vector3d(xLookAtOffset,yLookAtOffset,zLookAtOffset);
    }

    FirstPersonCameraController {camera: camera; }

    components: [
        PlanetFrameGraph {
            id                  : framegraph;
            viewCamera          : camera;
            lightCamera         : light.lightCamera;
        },
        InputSettings {

        }
    ]

    PlanetEffect {
        id                      : effectD;
        light                   : light;
    }

    PlanetEffect {
        id                      : effectDB;
        light                   : light;
        vertexES                : "qrc:/UI/PageViews/IndexPage/shaders/es2/planetDB.vert";
        fragmentES              : "qrc:/UI/PageViews/IndexPage/shaders/es2/planetDB.frag";
        vertexGL                : "qrc:/UI/PageViews/IndexPage/shaders/gl3/planetDB.vert";
        framentGL               : "qrc:/UI/PageViews/IndexPage/shaders/gl3/planetDB.frag";
    }

    PlanetEffect {
        id                      : effectDSB;
        light                   : light;
        vertexES                : "qrc:/UI/PageViews/IndexPage/shaders/es2/planetDB.vert";
        fragmentES              : "qrc:/UI/PageViews/IndexPage/shaders/es2/planetDSB.frag";
        vertexGL                : "qrc:/UI/PageViews/IndexPage/shaders/gl3/planetDB.vert";
        framentGL               : "qrc:/UI/PageViews/IndexPage/shaders/gl3/planetDSB.frag";
    }

    PlanetEffect {
        id                      : cloudEffect;
        light                   : light;
        vertexES                : "qrc:/UI/PageViews/IndexPage/shaders/es2/planetD.vert";
        fragmentES              : "qrc:/UI/PageViews/IndexPage/shaders/es2/planetDS.frag";
        vertexGL                : "qrc:/UI/PageViews/IndexPage/shaders/gl3/planetD.vert";
        framentGL               : "qrc:/UI/PageViews/IndexPage/shaders/gl3/planetDS.frag";
    }

    SunEffect {
        id                      : sunEffect;
    }

    ShadowEffect {
        id                      : shadowMapEffect;
        shadowTexture           : framegraph.shadowTexture;
        light                   : light;
    }

    //![2]
    QQ2.Component.onCompleted: {
        planetData = Planets.loadPlanetData();

        //push in the correct order
        planets.push(sun);
        planets.push(mercury);
        planets.push(venus);
        planets.push(earth);
        planets.push(mars);
        planets.push(jupiter);
        planets.push(saturn);
        planets.push(uranus);
        planets.push(neptune);
        planets.push(moon);

        saturnRingOuterRadius = planetData[Planets.SATURN].radius + Planets.saturnOuterRadius;
        saturnRingInnerRadius = planetData[Planets.SATURN].radius + 6.630;
        uranusRingOuterRadius = planetData[Planets.URANUS].radius + Planets.uranusOuterRadius;
        uranusRingInnerRadius = planetData[Planets.URANUS].radius + 2;

        ready = true;
        changeScale(1200);
        changeSpeed(0.2);
        setLookAtOffset(Planets.SUN);
    }
    //![2]


    //![0]
    QQ2.NumberAnimation {
        id                              : lookAtOffsetAnimation;
        target                          : sceneRoot;
        properties                      : "xLookAtOffset, yLookAtOffset, zLookAtOffset";
        to                              : 0;
        easing.type                     : Easing.InOutQuint;
        duration                        : 1250;
    }
    QQ2.NumberAnimation {
        id                              :cameraOffsetAnimation;
        target                          : sceneRoot;
        properties                      : "xCameraOffset, yCameraOffset, zCameraOffset";
        to                              : 0;
        easing.type                     : Easing.InOutQuint;
        duration                        : 2500;
    }

    //![0]

    QQ2.Behavior on cameraNear {
        QQ2.PropertyAnimation {
            easing.type                 : Easing.InOutQuint;
            duration                    : 2500;
        }
    }

    /**
     * @version 1.0
     * @brief
     * @date    2018-09-19
     * @author  lanbery
     * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
    */
    function changePlanetFocus(oldPlanet, focusedPlanet) {
        setOldPlanet(oldPlanet,focusedPlanet);
        setLookAtOffset(focusedPlanet);
        setCameraOffset(oldPlanet,focusedPlanet);

        lookAtOffsetAnimation.restart();
        cameraOffsetAnimation.restart();
    }

    function setOldPlanet(oldPlanet , focusedPlanet){
        oldCameraPosition = camera.position;

        var planet = 0;
        if(oldPlanet !== Planets.NBS_SYSTEM)
            planet = oldPlanet;

        oldFocusedPlanetPosition = Qt.vector3d(
                    planets[planet].x,planets[planet].y,planets[planet].z);
        checkScaling(focusedPlanet);
    }

    /* */
    function setScale(value,focused){
        //
        if(!focused)
            actualScale = value;

        if(value <= focusedMinimumScale && (focusedScaling || focused)){
            planetScale = focusedMinimumScale
        }else{
            planetScale = actualScale;
        }
        return planetScale;
    }

    function checkScaling (focusedPlanet){
        if(focusedPlanet !== Planets.NBS_SYSTEM) {
            // Limit minimum scaling in focus mode to avoid jitter caused by rounding errors
            if(actualScale <= focusedMinimumScale) {
                planetScale = focusedMinimumScale;
                changeScale(focusedMinimumScale,true);
            }
            focusedScaling = true;
        }else if(focusedScaling === true){
            //Restore normal scaling
            focusedScaling  = true;
            changeScale(actualScale,false);
        }
    }

    /**
     * @version 1.0
     * @brief   设置视角
     * @date    2018-09-19
     * @author  lanbery
     * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
     */
    function setLookAtOffset (focusedPlanet) {
        var offset = oldFocusedPlanetPosition;

        var planet = 0;
        if(focusedPlanet !== Planets.NBS_SYSTEM)
            planet = focusedPlanet;

        var focusedPlanetPosition = Qt.vector3d(
                    planets[planet].x,planets[planet].y,planets[planet].z);
        offset = offset.minus(focusedPlanetPosition);
        xLookAtOffset = offset.x;
        yLookAtOffset = offset.y;
        zLookAtOffset = offset.z;
    }

    /**
     * @version 1.0
     * @brief   设置镜头视角
     * @date    2018-09-19
     * @author  lanbery
     * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
     */
    function setCameraOffset(oldPlanet,focusedPlanet) {
        var offset = oldCameraPosition;

        var planet = 0;
        if(focusedPlanet !== Planets.NBS_SYSTEM)
            planet = focusedPlanet;

        var newCameraPosition = getNewCameraPosition(focusedPlanet,Planets.getOuterRadius(planet));

        if(focusedPlanet !== Planets.SUN){
            offset = offset.minus(newCameraPosition);
        }

        if(oldPlanet === Planets.NBS_SYSTEM && focusedPlanet === Planets.SUN) {
            xCameraOffset = Math.abs(offset.x);
            yCameraOffset = Math.abs(offset.y);
            zCameraOffset = Math.abs(offset.z);
        }else {
            xCameraOffset = offset.x;
            yCameraOffset = offset.y;
            zCameraOffset = offset.z;
        }
    }

    /**
     * @version 1.0
     * @brief
     * @date    2018-09-19
     * @author  lanbery
     * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
     */
    function getNewCameraPosition(focusedPlanet,radius) {
        var position;
        if(focusedPlanet === Planets.NBS_SYSTEM){
            position = defaultCameraPos;
            position = position.times(cameraDistance);
        }else if(focusedPlanet === Planets.SUN) {
            position = Qt.vector3d(
                        radius * planetScale *2,radius * planetScale*2,radius*planetScale*2);
            position = position.times(cameraDistance);
        }else {
            var vec1 = Qt.vector3d(
                        planets[focusedPlanet].x,planets[focusedPlanet].y,planets[focusedPlanet].z);

            var vec2 = defautUp;

            vec1 = vec1.normalized();
            vec2 = vec2.crossProduct(vec1);
            vec2 = vec2.times(radius*planetScale*cameraDistance*4);
            vec2 = vec2.plus(Qt.vector3d(
                                 planets[focusedPlanet].x,planets[focusedPlanet].y,planets[focusedPlanet].z));

            vec1 = Qt.vector3d(0,radius*planetScale,0);
            vec2 = vec2.plus(vec1);
            position = vec2;

        }
        return position;
    }

    function advanceTime(focusedPlanet){
        if(focusedPlanet === Planets.NBS_SYSTEM)
            daysPerFrame = daysPerFrameScale*10;
        else
            daysPerFrame = daysPerFrameScale*planetData[focusedPlanet].period/100.0;
        //Advance the time in days
        oldTimeD = currTimeD;
        currTimeD = currTimeD + daysPerFrame;
        deltaTimeD = currTimeD - oldTimeD;
    }

    function positionPlanet(i){
        var planet = planetData[i];
        var target = planets[i];
        if(i !== Planets.SUN) {
            //计算 星际轨道上当前 元素
            var N = (planet.N1 + planet.N2*currTimeD) * Math.PI / 180;
            var iPlanet = (planet.i1+planet.i2*currTimeD) * Math.PI / 180;
            var w = (planet.w1 + planet.w2*currTimeD) * Math.PI / 180;
            var a = planet.a1 + planet.a2*currTimeD;
            var e = planet.e1 + planet.e2*currTimeD;
            var M = (planet.M1 + planet.M2*currTimeD) * Math.PI /180;

            var E = M + e * Math.sin(M)*(1.0 + e * Math.cos(E));

            var xv = a * (Math.cos(E) -e);
            var yv = a * (Math.sqrt(1.0 - e*e) * Math.sin(E));
            var v = Math.atan2(yv,xv);

            //Calculate the distance (radius)
            var r = Math.sqrt(Math.pow(xv,2)+Math.pow(yv,2));

            // From http://www.davidcolarusso.com/astro/
            var xh = r * (Math.cos(N)*Math.cos(v+w) - Math.sin(N)*Math.sin(v+w) * Math.cos(iPlanet));

            var zh = r * (Math.sin(N)*Math.cos(v+w) + Math.cos(N)*Math.sin(v+w)*Math.cos(iPlanet));

            var yh = r * (Math.sin(w+v)*Math.sin(iPlanet));

            var centerOfOrbit = planet.centerOfOrbit;
            target.x = planets[centerOfOrbit].x + xh * Planets.auScale;
            target.y = planets[centerOfOrbit].y + yh * Planets.auScale;
            target.z = planets[centerOfOrbit].z + zh * Planets.auScale;
        }
        target.roll += (deltaTimeD /planet.period) * 360;
    }

    function changeScale(scale,focused) {
        if(!ready)
            return;

        var scaling = setScale(scale,focused);

        sun.r = planetData[Planets.SUN].radius * scaling / 100;
        mercury.r = planetData[Planets.MERCURY].radius * scaling;
        venus.r = planetData[Planets.VENUS].radius * scaling;
        earth.r = planetData[Planets.EARTH].radius * scaling;
        earthClouds.r = planetData[Planets.EARTH].radius * scaling * 1.02;
        moon.r = planetData[Planets.MOON].radius * scaling;

        mars.r = planetData[Planets.MARS].radius * scaling;

        jupiter.r = planetData[Planets.JUPITER].radius * scaling;

        saturn.r = planetData[Planets.SATURN].radius * scaling;
        saturnRing.outerRadius = saturnRingOuterRadius * scaling;
        saturnRing.innerRadius = saturnRingInnerRadius * scaling;

        uranus.r  = planetData[Planets.URANUS].radius * scaling;
        uranusRing.outerRadius = uranusRingOuterRadius * scaling;
        uranusRing.innerRadius = uranusRingInnerRadius * scaling;

        neptune.r = planetData[Planets.NEPTUNE].radius * scaling;
    }

    function changeSpeed(speed){
        daysPerFrameScale = speed;
    }

    function changeCameraDistance(distance){
        cameraDistance = distance;
    }

    function animate(focusedPlanet){
        if(!ready)
            return;

        advanceTime(focusedPlanet);

        for(var i=0;i<=Planets.NUM_SELECTABLE_PLANETS;i++)
            positionPlanet(i);

        updateCamera(focusedPlanet);
    }

    function updateCamera(focusedPlanet){
        var outerRadius = Planets.getOuterRadius(focusedPlanet);
        cameraNear = outerRadius;
        camera.nearPlane = cameraNear;
        light.near = cameraNear;

        //
        var cameraPosition = getNewCameraPosition(focusedPlanet,outerRadius);
        var cameraOffset = Qt.vector3d(xCameraOffset,yCameraOffset,zCameraOffset);
        cameraPosition = cameraPosition.plus(cameraOffset);

        var lookAtPlanet = Planets.SUN;
        if(focusedPlanet !== Planets.NBS_SYSTEM){
            lookAtPlanet = focusedPlanet;
        }
        var cameraLookAt = Qt.vector3d(
                    planets[lookAtPlanet].x,planets[lookAtPlanet].y,planets[lookAtPlanet].z);

        var lookAtOffset = Qt.vector3d(
                    xLookAtOffset,yLookAtOffset,zLookAtOffset);

        cameraLookAt = cameraLookAt.plus(lookAtOffset);

        //
        camera.viewCenter = cameraLookAt;
        camera.position = Qt.vector3d(cameraPosition.x,cameraPosition.y,cameraPosition.z);
        camera.upVector = defautUp;
    }

    /* StartField */
    Entity {
        id                          : starfieldEntity;

        Mesh {
            id                      : starfield;
            source                  : "qrc:/UI/PageViews/IndexPage/meshes/starfield.obj"
        }

        PlanetMaterial {
            id                      : materialStarfield;
            effect                  : effectD;
            ambientLight            : ambientStrengthStarfield;
            specularColor           : Qt.rgba(0.0,0.0,0.0,1.0);
            diffuseMap              : "";  //TODO
            shininess               : 1000000.0;
        }
        property Transform transformStarfield: Transform {
            scale                   : 8500000;
            translation             : Qt.vector3d(0,0,0);
        }
        components : [starfield,materialStarfield,transformStarfield ]
    }

    /* SUN */
    Entity {
        id                          : sunEntity;
        Planet {
            id                      : sun;
            tilt                    : planetData[Planets.SUN].tilt;
        }

        PlanetMaterial {
            id                      : materialSun;
            effect                  : sunEffect;
            ambientLight            : ambientStrengthSun;
            diffuseMap              : "";//TODO
        }

        property Transform transformSun : Transform {
            matrix : {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(sun.x,sun.y,sun.z));
                m.rotate(sun.tilt,tiltAxis);
                m.rotate(sun.roll,rollAxis);
                m.scale(sun.r);
                return m;
            }
        }

        components: [sun,materialSun,transformSun ]
    }

    /*Planets*/
    /* MERCURY */
    Entity {
        id                          : mercuryEntity;

        Planet {
            id                      : mercury;
            tilt                    : planetData[Planets.MERCURY].tilt
        }

        PlanetMaterial {
            id                      : materialMercury;
            effect                  : effectDB;
            ambientLight            : ambientStrengthPlanet;
            specularColor           : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap              : "";//TODO
            normalMap               : "";//TODO
            shininess               : shininessSpecularMap;
        }

        property Transform transformMercury : Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(mercury.x,mercury.y,mercury.z));
                m.rotate(mercury.tilt,tiltAxis);
                m.rotate(mercury.roll,rollAxis);
                m.scale(mercury.r);
                return m;
            }
        }
        components: [mercury,materialMercury,transformMercury ]
    }

    /* VENUS */
    Entity {
        id                          : venusEntity;
        Planet {
            id                      : venus;
            tilt                    : planetData[Planets.VENUS].tilt
        }

        PlanetMaterial {
            id                      : materialVenus;
            effect                  : effectDB;
            ambientLight            : ambientStrengthPlanet;
            specularColor           : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap              : "";//
            normalMap               : "";//
            shininess               : shininessSpecularMap;
        }

        property Transform transformVenus: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(venus.x,venus.y,venus.z));
                m.rotate(venus.tilt,tiltAxis);
                m.rotate(venus.roll,rollAxis);
                m.scale(venus.r);
                return m;
            }
        }

        components: [venus,materialVenus,transformVenus ]
    }

    /* EARTH */
    Entity {
        id                          : earthEntity;

        Planet {
            id                      : earth;
            tilt                    : planetData[Planets.EARTH].tilt;
        }

        PlanetMaterial {
            id                      : materialEarth;
            effect                  : effectDSB;
            ambientLight            : ambientStrengthPlanet;
            diffuseMap              : ""; //TODO
            specularMap             : ""; //
            normalMap               : "";
            shininess               : shininessSpecularMap;
        }

        property Transform transformEarth: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(earth.x,earth.y,earth.z));
                m.rotate(earth.tilt,tiltAxis);
                m.rotate(earth.roll,rollAxis);
                m.scale(earth.r);
                return m;
            }
        }

        components: [earth,materialEarth,transformEarth]
    }

    /* EARTH CLOUDS */
    Entity {
        id                          : earthCloudsEntity;

        Planet {
            id                      : earthClouds;
            tilt                    : planetData[Planets.EARTH].tilt
        }

        PlanetMaterial  {
            id                      : materialEarthClouds;
            effect                  : cloudEffect;
            ambientLight            : ambientStrengthClouds;
            diffuseMap              : ""; //
            specularMap             : ""; //
            shininess               : shininessClouds;
            opacity                 : 0.2;
        }

        property Transform transformEarthClouds : Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(earth.x,earth.y,earth.z));
                m.rotate(earth.tilt,tiltAxis);
                m.rotate(earth.roll/2,rollAxis);
                m.scale(earthClouds.r);
                return m;
            }
        }

        components: [earthClouds,materialEarthClouds,transformEarthClouds];
    }

    /* MOON */
    Entity {
        id                          : moonEntity;

        Planet {
            id                      : moon;
            tilt                    : planetData[Planets.MOON].tilt;
        }

        PlanetMaterial {
            id                      : materialMoon;
            effect                  : effectDB;
            ambientLight            : ambientStrengthPlanet;
            specularColor           : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap              : "";//
            normalMap               : "";//
            shininess               : shininessSpecularMap;
        }

        property Transform transformMoon: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(moon.x,moon.y,moon.z));
                m.rotate(moon.tilt,tiltAxis);
                m.rotate(moon.roll,rollAxis);
                m.scale(moon.r);
                return m;
            }
        }

        components: [moon,materialMoon,transformMoon ]
    }

    /* MARS */
    Entity {
        id                          : marsEntity;

        Planet {
            id                      : mars;
            tilt                    : planetData[Planets.MARS].tilt;
        }

        PlanetMaterial {
            id                      : materialMars;
            effect                  : effectDB;
            ambientLight            : ambientStrengthPlanet;
            specularColor           : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap              : "";
            normalMap               : "";
            shininess               : shininessSpecularMap;
        }

        property Transform transformMars: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(mars.x,mars.y,mars.z));
                m.rotate(mars.tilt,tiltAxis);
                m.rotate(mars.roll,rollAxis);
                m.scale(mars.r);
                return m;
            }
        }

        components: [mars,materialMars,transformMars]
    }

    /* JUPITER */
    Entity {
        id                      : jupiterEntity;

        Planet {
            id                  : jupiter;
            tilt                : planetData[Planets.JUPITER].tilt;
        }

        PlanetMaterial {
            id                  : materialJupiter;
            effect              : effectD;
            ambientLight        : ambientStrengthPlanet;
            specularColor       : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap          : "";//
            shininess           : shininessBasic;
        }

        property Transform transformJupiter: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(jupiter.x,jupiter.y,jupiter.z));
                m.rotate(jupiter.tilt,tiltAxis);
                m.rotate(jupiter.roll,rollAxis);
                m.scale(jupiter.r);
                return m;
            }
        }

        components: [jupiter,materialJupiter,transformJupiter];
    }

    /* SATURN */
    Entity {
        id                      : saturnEntity;

        Planet {
            id                  : saturn;
            tilt                : planetData[Planets.URANUS].tilt;
        }

        PlanetMaterial {
            id                  : materialSaturn;
            effect              : shadowMapEffect;
            ambientLight        : ambientStrengthPlanet;
            specularColor       : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap          : "";//
            shininess           : shininessBasic;
        }

        property Transform transformSaturn: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(saturn.x,saturn.y,saturn.z));
                m.rotate(saturn.tilt,tiltAxis);
                m.rotate(saturn.roll,rollAxis);
                m.scale(saturn.r);
                return m;
            }
        }

        components: [saturn,materialSaturn,transformSaturn];
    }

    //saturn ring
    Entity {
        id                      : saturnRingEntity;

        Ring {
            id                  : saturnRing;
            innerRadius         : saturnRingInnerRadius;
            outerRadius         : saturnRingOuterRadius;
        }

        PlanetMaterial {
            id                  : materialSaturnRing;
            effect              : shadowMapEffect;
            ambientLight        : ambientStrengthRing;
            specularColor       : Qt.rgba(0.01,0.01,0.01,1.0);
            diffuseMap          : "";//
            shininess           : shininessBasic;
            opacity             : 0.4;
        }

        property Transform transformSaturnRing: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(saturn.x,saturn.y,saturn.z));
                m.rotate(saturn.tilt,tiltAxis);
                m.rotate(saturn.roll/10,rollAxis);
                m.scale((saturnRing.innerRadius + saturnRing.outerRadius) / 1.75);
                return m;
            }
        }

        components: [saturnRing,materialSaturnRing,transformSaturnRing];
    }

    /* URANUS*/
    Entity {
        id                      : uranusEntity;

        Planet {
            id                  : uranus;
            tilt                : planetData[Planets.URANUS].tilt;
        }

        PlanetMaterial {
            id                  : materialUranus;
            effect              : shadowMapEffect;
            ambientLight        : ambientStrengthPlanet;
            specularColor       : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap          : "";//
            shininess           : shininessBasic;
        }

        property Transform transformUranus: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(uranus.x,uranus.y,uranus.z));
                m.rotate(uranus.tilt,tiltAxis);
                m.rotate(uranus.roll,rollAxis);
                m.scale(uranus.r);
                return m;
            }
        }

        components: [uranus,materialUranus,transformUranus]
    }

    //uranus ring
    Entity {
        id                      : uranusRingEntity;

        Ring {
            id                  : uranusRing;
            innerRadius         : uranusRingInnerRadius;
            outerRadius         : uranusRingOuterRadius;
        }

        PlanetMaterial {
            id                  : materialUranusRing;
            effect              : shadowMapEffect;
            ambientLight        : ambientStrengthRing;
            specularColor       : Qt.rgba(0.01,0.01,0.01,1.0);
            diffuseMap          : "";//
            shininess           : shininessBasic;
            opacity             : 0.4;
        }

        property Transform transformUranusRing : Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(uranus.x,uranus.y,uranus.z));
                m.rotate(uranus.tilt,tiltAxis);
                m.rotate(uranus.roll/10,rollAxis);
                m.scale((uranusRing.innerRadius + uranusRing.outerRadius)/1.75)
                return m;
            }
        }
        components: [uranusRing,materialUranusRing,transformUranusRing]
    }

    //NEPTUNE
    Entity {
        id                      : neptuneEntity;

        Planet {
            id                  : neptune;
            tilt                : planetData[Planets.NEPTUNE].tilt;
        }

        PlanetMaterial {
            id                  : materialNeptune;
            effect              : effectD;
            ambientLight        : ambientStrengthPlanet;
            specularColor       : Qt.rgba(0.2,0.2,0.2,1.0);
            diffuseMap          : "";//
            shininess           : shininessBasic;
        }

        property Transform transformNeptune: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(Qt.vector3d(neptune.x,neptune.y,neptune.z));
                m.rotate(neptune.tilt,tiltAxis);
                m.rotate(neptune.roll,rollAxis);
                m.scale(neptune.r);
                return m;
            }
        }

        components: [neptune,materialNeptune,transformNeptune]
    }
}
