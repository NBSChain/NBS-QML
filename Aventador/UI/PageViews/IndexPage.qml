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
    id                                          : nnsView;
    anchors.fill                                : parent;

    property int    focusedPlanet               : 100;
    property int    oldPlanet                   : 0;
    property int    frames                      : 0;
    property int    silderLength                : (width>height) ? width/2 : height/2;
    property real   textSize                    : silderLength/20;
    property real   planetButtonSize            : (height<2200) ? (height/14) : 140*dp;

    Connections {
        target  : networkController;
        onCommandAccepted   : {
            var focusedItem = nnsView.Window.window.activeFocusItem;

            if(focusedItem && focusedItem.panningEnabled){
                focusedItem.panningEnabled = false;
            }
            switch(command){
            case "selectPlanet":
                nnsView.focusedPlanet = Planets.planetId(decodeURIComponent(value));

                break;
            case "setRotationSpeed":

                break;
            case "setViewDistance":
                break;
            case "setPlanetSize":
                break;
            }
        }
    }

    //![0]
    Scene3D {
        anchors.fill                            : parent;
        aspects                                 : ["render","logic","input"];
        NBSNetSystem    {id : nnSystem;}
    }//![0]

    /*!
     *
     */
    MouseArea {
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;
        onClicked: {focusedPlanet = 100;}
    }

    //![1]
    onFocusedPlanetChanged: {
        if(focusedPlanet == 100){
            info.opacity = 0;

        }else{
            info.opacity = 1;

        }
    }//![1]

    //listModel

    //Component

    //ListView

    //InfoSheet
    InfoSheet {
        id                          : infoPanel;
        width                       : 350*dp;
        anchors.right               : parent.right;
        anchors.rightMargin         : 40*dp;

        opacity                     : 1;

        planet                      : "NBS Chain";
        onlineNums                  : "39277";
        descriptions                : "<p>NBS致力于将数字资产以分布式存储的形式进行加密保存，</p>"+
                                      "<p>以区块链记账的方式实现数字资产所有权的登记</p>"+
                                      "<p>以有差异化的token价值来体现不同数字资产的不同使用权，</p>"+
                                      "<p>并促进其快速分发与流转。</p></br>"+
                                      "<p>Copyright (c) By lambor,NBS Chain co.</p><br>" +
                                      "<a href=\"http://nbsio.net/\">"+
                                      "http://nbsio.net/</a>";
    }

    //function 更新NBS node INFO
    function updatePlanetInfo() {
        infoPanel.width = 200*dp;
        if(focusedPlanet !== 100){
            infoPanel.hash58 = "";//TODO
        }
    }

    //ROW


    Rectangle {
        anchors.centerIn: parent;


        Text {
            color: "white";
            text : "index";
        }
    }
}
