import QtQuick 2.11 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0

import "planets.js" as Planets
/**
 * @file    NbsNetSystem.qml
 * @version 1.0
 * @brief   NNS 网络系统
 * @date    2018-09-18
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Entity {
    id                                      : sceneRoot;

    property bool       ready               : false;
    property real       cameraNear          : 0;            //镜头远近
    property real       xLookAtOffset       : 0;            //x
    property real       yLookAtOffset       : 0;            //y
    property real       zLookAtOffset       : 0;            //z

    property real       xCameraOffset       : 0;            //x
    property real       yCameraOffset       : 0;            //y
    property real       zCameraOffset       : 0;            //z

    property var        planetData;
    property var        planets             : [];           //NBS节点集合

    property vector3d   defautUp            : Qt.vector3d(0,1,0);
    property vector3d   defaultCameraPos    : Qt.vector3d(
                                                  Planets.solarDistance,Planets.solarDistance,Planets.solarDistance);




}
