import QtQuick 2.11
import QtQuick.Scene3D 2.0
import QtQuick.Window 2.3
import "./IndexPage"
import "./IndexPage/planets.js" as Planets
//import NbsIo 1.0

/**
 * @file    IndexPage.qml
 * @version 1.0
 * @brief   NBS星际入口
 * @date    2018-09-17
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Item {
    id                                          : indexNBSSystem;
    anchors.fill                                : parent;

    property int    focusedPlanet               : 100;
    property int    oldPlanet                   : 0;
    property int    frames                      : 0;
    property int    silderLength                : (width>height) ? width/2 : height/2;
    property real   textSize                    : silderLength/20;
    property real   planetButtonSize            : (height<2200) ? (height/14) : 140*dp;

//    Connections {
//        target  : networkController;
//        onCommandAccepted   : {
//            var focusedItem = mainView.Window.window.activeFocusItem;

//            if(focusedItem && focusedItem.panningEnabled){
//                focusedItem.panningEnabled = false;
//            }
//        }
//    }

//    NetworkController {
//        id              : networkController;
//    }

    //![0]
    Scene3D {
        anchors.fill                            : parent;
        aspects                                 : ["render","logic","input"];

    }


    Rectangle {
        anchors.centerIn: parent;


        Text {
            color: "white";
            text : "index";
        }
    }
}
