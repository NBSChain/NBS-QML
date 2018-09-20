import QtQuick 2.11
//import QtQuick.Scene3D 2.0
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
    property real   planetButtonSize            : (height<2200) ? (height/16) : 120*dp;

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
                planetButtonView.forceActiveFocus();
                planetButtonView.currentIndex = Planets.planetIndex(value)
                break;
            case "setRotationSpeed":
//                rotationSpeedSlider.forceActiveFocus()
//                rotationSpeedSlider.value = rotationSpeedSlider.minimumValue +
//                        ((rotationSpeedSlider.maximumValue - rotationSpeedSlider.minimumValue) * value)
                break;
            case "setViewDistance":
                break;
            case "setPlanetSize":
                break;
            }
        }
    }

    //![0]
//    Scene3D {
//        anchors.fill                            : parent;
//        aspects                                 : ["render","logic","input"];
//        NBSNetSystem    {id : nnSystem;}
//    }
    //![0]

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
            infoPanel.opacity = 0;
            updatePlanetInfo();
        }else{
            updatePlanetInfo();
            infoPanel.opacity = 1;
        }

        oldPlanet = focusedPlanet;

    }//![1]

    //listModel
    NbsNetStarModel {
        id                          : planetModel;
    }

//    ListModel {
//        id                          : planetModel;
//        ListElement {
//            name                    : "Core";
//            planetImageSource       : "http://nbsio.net/image/nbs_circle.png";
//            planetNumber            : 0;
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            storageSize             : "12.59 TB";
//            onlineNums              : "899 Peers";
//            descriptions            : "NBS 星际文件系统核心";
//        }

//        ListElement {
//            name                    : "Mercury";
//            planetImageSource       : "qrc:/images/stars/mercury.png";
//            planetNumber            : 1;
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            nickName                : "";//暂未用到
//            storageSize             : "10.0 GB";
//            locations               : "水星";
//            onlineNums              : "899 Peers";
//            gcperiod                : "1 h";
//            descriptions            : "";
//        }
//        ListElement {
//            name                    : "Venus";
//            planetImageSource       : "qrc:/images/stars/venus.png";
//            planetNumber            : 2;
//            hash58                  : "QmYHk2VWWNAbc4zU5oyemfadBYMtNmutqXHjSDV8hm5E7g";
//            nickName                : "";//暂未用到
//            storageSize             : "12.59 GB";
//            locations               : "金星";
//            onlineNums              : "899 Peers";
//            gcperiod                : "12 h";
//            descriptions            : "";
//        }
//        ListElement {
//            name                    : "Earth";
//            planetImageSource       : "qrc:/images/stars/earth.png";
//            planetNumber            : 3;
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            nickName                : "";//暂未用到
//            storageSize             : "3.0 GB";
//            locations               : "";
//            onlineNums              : "899 Peers";
//            gcperiod                : "10 h";
//            descriptions            : "";
//        }
//        ListElement {
//            name                    : "Mars";
//            planetImageSource       : "qrc:/images/stars/mars.png";
//            planetNumber            : 4;
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            nickName                : "";//暂未用到
//            storageSize             : "5 GB";
//            locations               : "火星";
//            onlineNums              : "76 Peers";
//            gcperiod                : "24 h";
//            descriptions            : "";
//        }
//        ListElement {
//            name                    : "Jupiter";
//            planetImageSource       : "qrc:/images/stars/jupiter.png";
//            planetNumber            : 5;
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            nickName                : "";//暂未用到
//            storageSize             : "2 GB";
//            locations               : "木星";
//            onlineNums              : "899 Peers";
//            gcperiod                : "100 h";
//            descriptions            : "";
//        }
//        ListElement {
//            name                    : "Saturn";
//            planetImageSource       : "qrc:/images/stars/saturn.png";
//            planetNumber            : 6
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            nickName                : "";//暂未用到
//            storageSize             : "10 GB";
//            locations               : "土星";
//            onlineNums              : "899 Peers";
//            gcperiod                : "1 h";
//            descriptions            : "";
//        }
//        ListElement {
//            name                    : "Uranus";
//            planetImageSource       : "qrc:/images/stars/uranus.png";
//            planetNumber            : 7;
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            nickName                : "";//暂未用到
//            storageSize             : "2.59 GB";
//            locations               : "天王星";
//            onlineNums              : "22 Peers";
//            gcperiod                : "1 h";
//            descriptions            : "";
//        }
//        ListElement {
//            name                    : "Neptune";
//            planetImageSource       : "qrc:/images/stars/neptune.png";
//            planetNumber            : 8;
//            hash58                  : "QmbZHNEgipahPYMbugdfFbLVEdXDmxGLLy3vYC4WP98Lqi";
//            nickName                : "";//暂未用到
//            storageSize             : "10.0 GB";
//            locations               : "海王星";
//            onlineNums              : "22 Peers";
//            gcperiod                : "84 h";
//            descriptions            : "";
//        }


//        ListElement {
//            name                    : "NBS Chain";
//            planetImageSource       : "";
//            planetNumber            : 100;
//        }

//        function get(index){
//            console.log(index);
//        }
//    }

    //Component
    Component {
        id                          : planetButtonDelegate;
        PlanetButton {
            source                  : planetImageSource;
            text                    : name;
            focusPlanet             : planetNumber;
            planetSelector          : nnsView;
            buttonSize              : planetButtonSize;
            fontSize                : 16*dp;

            scale                   : activeFocus ? 1.2 : 1.0;

            Behavior on scale {
                PropertyAnimation{ duration: 200}
            }

            signal swipeUp();
            signal swipeDown();
            signal swipeLeft();

            onSwipeUp: {
                if(planetButtonView.currentIndex > 0 ){
                    planetButtonView.currentIndex--;
                }else {

                }
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Select) {
                    planetSelector.focusedPlanet = focusPlanet
                }
            }
        }
    }

    //ListView
    ListView {
        id                          : planetButtonView;
        anchors {
            verticalCenter          : parent.verticalCenter;
            right                   : parent.right;
            rightMargin             : planetButtonSize /2;
        }

        height: childrenRect.height;
        spacing : planetButtonSize/6;
        width: planetButtonSize *1.4;
        interactive: false;
        model: planetModel;
        delegate: planetButtonDelegate;
    }

    //InfoSheet
    InfoSheet {
        id                          : infoPanel;
        width                       : 350*dp;
        anchors.right               : planetButtonView.left;
        anchors.rightMargin         : 10*dp;

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
        infoPanel.width = 380*dp;
        if(focusedPlanet !== 100){
            infoPanel.planet            = planetModel.get(focusedPlanet).name;
            infoPanel.hash58            = planetModel.get(focusedPlanet).hash58 | "";
            infoPanel.storageSize       = planetModel.get(focusedPlanet).storageSize | "0 GB";
            infoPanel.onlineNums        = planetModel.get(focusedPlanet).onlineNums | "0";
            infoPanel.gcperiod          = planetModel.get(focusedPlanet).gcperiod | "1 h" ;
            infoPanel.locations         = planetModel.get(focusedPlanet).locations | "";
            infoPanel.descriptions      = planetModel.get(focusedPlanet).descriptions | "";
        }else {
            infoPanel.planet            = "NBS Chain";
            infoPanel.descriptions      = "<p>NBS致力于将数字资产以分布式存储的形式进行加密保存，</p>"+
                                        "<p>以区块链记账的方式实现数字资产所有权的登记</p>"+
                                        "<p>以有差异化的token价值来体现不同数字资产的不同使用权，</p>"+
                                        "<p>并促进其快速分发与流转。</p></br>"+
                                        "<p>Copyright (c) By lambor,NBS Chain co.</p><br>" +
                                        "<a href=\"http://nbsio.net/\">"+
                                        "http://nbsio.net/</a>";
            infoPanel.opacity           = 1.0;
        }
    }

    //ROW
    // FPS display, initially hidden, clicking will show it
//    FpsDisplay {
//        id: fpsDisplay
//        anchors.left: parent.left
//        anchors.bottom: parent.bottom
//        width: 32
//        height: 64
//        hidden: true
//    }
//    Timer {
//        interval: 1000
//        repeat: true
//        running: !fpsDisplay.hidden
//        onTriggered: {
//            fpsDisplay.fps = frames
//            frames = 0
//        }
//        onRunningChanged: frames = 0
//    }

//    Loader {
//        anchors.fill: parent;
//        source: Qt.platform.os === "tvos" ? "qrc:/UI/PageViews/IndexPage/AppleTVInput.qml" : "";
//    }
}
