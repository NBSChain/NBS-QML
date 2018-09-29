import QtQuick 2.11
import QtCanvas3D 1.1

import "../../canvas3d"
import "../../canvas3d/controls"

import "../../canvas3d/planets.js" as GLCode
Item {

    property int focusedPlanet: 100
    property int oldPlanet: 0
    property real xLookAtOffset: 0
    property real yLookAtOffset: 0
    property real zLookAtOffset: 0
    property real xCameraOffset: 0
    property real yCameraOffset: 0
    property real zCameraOffset: 0
    property real cameraNear: 0
    property int sliderLength: (width < height) ? width / 2 : height / 2
    property real textSize: (sliderLength < 320) ? (sliderLength / 20) : 16
    property real planetButtonSize: (height < 768) ? (height / 11) : 70

    id : starView;

    anchors.fill: parent;

    NumberAnimation {
        id: lookAtOffsetAnimation
        target: starView
        properties: "xLookAtOffset, yLookAtOffset, zLookAtOffset"
        to: 0
        easing.type: Easing.InOutQuint
        duration: 1250
    }

    NumberAnimation {
        id: cameraOffsetAnimation
        target: starView
        properties: "xCameraOffset, yCameraOffset, zCameraOffset"
        to: 0
        easing.type: Easing.InOutQuint
        duration: 2500
    }

    Behavior on cameraNear {
        PropertyAnimation {
            easing.type: Easing.InOutQuint
            duration: 2500
        }
    }
    //! [1]
    onFocusedPlanetChanged: {
        if (focusedPlanet == 100) {
            info.opacity = 0;
            updatePlanetInfo();
        } else {
            updatePlanetInfo();
            info.opacity = 0.5;
        }

        GLCode.prepareFocusedPlanetAnimation();

        lookAtOffsetAnimation.restart();
        cameraOffsetAnimation.restart();
    }
    //! [1]
    //! [0]
    Canvas3D {
        id: canvas3d
        anchors.fill: parent
        //! [4]
        onInitializeGL: {
            GLCode.initializeGL(canvas3d, eventSource, starView);
        }
        //! [4]
        onPaintGL: {
            GLCode.paintGL(canvas3d);
            fpsDisplay.fps = canvas3d.fps;
        }

        onResizeGL: {
            GLCode.onResizeGL(canvas3d);
        }
        //! [3]
        ControlEventSource {
            anchors.fill: parent
            focus: true
            id: eventSource
        }
        //! [3]
    }

    PeersIndexModel {
        id              : planetModel;
    }

    Component {
        id: planetButtonDelegate
        PlanetButton {
            source: planetImageSource
            text: name
            focusPlanet: planetNumber
            planetSelector: starView
            buttonSize: planetButtonSize
            fontSize: textSize
        }
    }

    ListView {
        id: planetButtonView
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: planetButtonSize / 5
        anchors.bottomMargin: planetButtonSize / 7
        spacing: planetButtonSize / 7
        width: planetButtonSize * 1.4
        interactive: false
        model: planetModel
        delegate: planetButtonDelegate
    }

    InfoSheet {
        id: info
        width: 400
        anchors.right: planetButtonView.left
        anchors.rightMargin: 10
        opacity: 0.5

        // Set initial information for Solar System
        planet: "Solar System"
        remark: "<h3>区块存续历史，创新链接未来</h3></br></p>" +
                        "<p>NBS致力于将数字资产以分布式存储的形式进行加密保存</p>" +
                        "<p>以区块链记账的方式实现数字资产所有权的登记，</p>" +
                        "<p>以有差异化的token价值来体现不同数字资产的不同使用权，</p>" +
                        "<p>并促进其快速分发与流转.</p>" +
                        "</br>" +
                        "<p> Copyright (c) by lanbery NBSChain co.</p>" +
                        "<a href=\"http://nbsio.net\">" +
                        "http://nbsio.net</a>"
    }

    function updatePlanetInfo() {
        info.width = 260;
        if (focusedPlanet !== 100) {
            info.planet = planetModel.get(focusedPlanet).name
            info.hash = planetModel.get(focusedPlanet).hash
            info.storage = planetModel.get(focusedPlanet).storage
            info.gcPeriod = planetModel.get(focusedPlanet).gcPeriod
            info.connectedPeers = planetModel.get(focusedPlanet).connectedPeers
        }
    }

    StyledSlider {
        id: speedSlider
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: sliderLength
        value: 0.2
        minimumValue: 0
        maximumValue: 1
        onValueChanged: GLCode.onSpeedChanged(value);
    }
    Text {
        anchors.right: speedSlider.left
        anchors.verticalCenter: speedSlider.verticalCenter
        anchors.rightMargin: 10
        font.family: "Helvetica"
        font.pixelSize: textSize
        font.weight: Font.Light
        color: "white"
        text: "Rotation Speed"
    }

    StyledSlider {
        id: scaleSlider
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: sliderLength
        value: 1200
        minimumValue: 1
        maximumValue: 2000
        onValueChanged: GLCode.setScale(value);
    }
    Text {
        anchors.right: scaleSlider.left
        anchors.verticalCenter: scaleSlider.verticalCenter
        anchors.rightMargin: 10
        font.family: "Helvetica"
        font.pixelSize: textSize
        font.weight: Font.Light
        color: "white"
        text: "Planet Size"
    }

    StyledSlider {
        id: distanceSlider
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        orientation: Qt.Vertical
        height: sliderLength
        value: 1
        minimumValue: 1
        maximumValue: 2
        //! [2]
        onValueChanged: GLCode.setCameraDistance(value);
        //! [2]
    }
    Text {
        y: distanceSlider.y + distanceSlider.height + width + 10
        x: distanceSlider.x + 30 - textSize
        transform: Rotation {
            origin.x: 0;
            origin.y: 0;
            angle: -90
        }
        font.family: "Helvetica"
        font.pixelSize: textSize
        font.weight: Font.Light
        color: "white"
        text: "Viewing Distance"
    }

    // FPS display, initially hidden, clicking will show it
    FpsDisplay {
        id: fpsDisplay
        anchors.left: parent.left
        anchors.top: parent.top
        width: 32
        height: 64
        hidden: true
    }
}


