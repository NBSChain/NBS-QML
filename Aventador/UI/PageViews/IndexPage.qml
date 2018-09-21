import QtQuick 2.11
//import QtQuick.Scene3D 2.0
import QtQuick.Window 2.3




/**
 * @file    IndexPage.qml
 * @version 1.0
 * @brief   NBS星际入口
 * @date    2018-09-17
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Item {
    id                                          : nnsView;
    anchors.fill                                : parent;

    property int    focusedPlanet               : 100;
    property int    oldPlanet                   : 0;
    property int    frames                      : 0;
    property int    silderLength                : (width>height) ? width/2 : height/2;
    property real   textSize                    : silderLength/20;
    property real   planetButtonSize            : (height<2200) ? (height/16) : 120*dp;


    Text {
        text: "INdex";
        color: "white"
        font {
            family: aweFont.name;
            pixelSize: 36*dp;
        }
    }
}
