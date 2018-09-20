import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Scene3D 2.0
import "planets.js" as Planets

Item {
    id                          : planetRoot;
    anchors.fill                : parent;
    property int focusedPlanet  : 100
    property int oldPlanet: 0
    property int frames: 0
    property int sliderLength: (width < height) ? width / 2 : height / 2
    property real textSize: sliderLength / 20
    property real planetButtonSize: (height < 2200) ? (height / 13) : 200

    Connections {
        target: networkController

        onCommandAccepted: {
            var focusedItem = mainview.Window.window.activeFocusItem
            if (focusedItem && focusedItem.panningEnabled) {
                focusedItem.panningEnabled = false
            }

            switch (command) {
            case "selectPlanet":
                mainview.focusedPlanet = Planets.planetId(decodeURIComponent(value))
                planetButtonView.forceActiveFocus()
                planetButtonView.currentIndex = Planets.planetIndex(value)
                break
            case "setRotationSpeed":
                rotationSpeedSlider.forceActiveFocus()
                rotationSpeedSlider.value = rotationSpeedSlider.minimumValue +
                        ((rotationSpeedSlider.maximumValue - rotationSpeedSlider.minimumValue) * value)
                break
            case "setViewingDistance":
                viewingDistanceSlider.forceActiveFocus()
                viewingDistanceSlider.value = viewingDistanceSlider.minimumValue +
                        ((viewingDistanceSlider.maximumValue - viewingDistanceSlider.minimumValue) * value)
                break
            case "setPlanetSize":
                planetSizeSlider.forceActiveFocus()
                planetSizeSlider.value = planetSizeSlider.minimumValue +
                        ((planetSizeSlider.maximumValue - planetSizeSlider.minimumValue) * value)
                break
            }
        }
    }

    //! [0]
    Scene3D {
        anchors.fill: parent
        aspects: ["render", "logic", "input"]

        SolarSystem { id: solarsystem }
    }
    //! [0]

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked:
            focusedPlanet = 100
    }

    //! [1]
    onFocusedPlanetChanged: {
        if (focusedPlanet == 100) {
            info.opacity = 0
            updatePlanetInfo()
        } else {
            updatePlanetInfo()
            info.opacity = 1
        }

        solarsystem.changePlanetFocus(oldPlanet, focusedPlanet)
        oldPlanet = focusedPlanet
    }
    //! [1]

    ListModel {
        id: planetModel

        ListElement {
            name: "Core"
            radius: "159.2 TB"
            temperature: "5 778 "
            orbitalPeriod: ""
            distance: ""
            planetImageSource: "qrc:/UI/Planets/images/nbsstar.png"
            planetNumber: 0
        }
        ListElement {
            name: "Mercury"
            radius: "10 GB"
            temperature: "80-700"
            orbitalPeriod: "87.969 d"
            distance: "QmYHk2VWWNAbc4zU5oyemfadBYMtNmutqXHjSDV8hm5E7g"
            planetImageSource: "qrc:/UI/Planets/images/mercury.png"
            planetNumber: 1
        }
        ListElement {
            name: "Venus"
            radius: "20 GB"
            temperature: "737 "
            orbitalPeriod: "224.701 d"
            distance: "QmdnwtnNwmHHpnyLS38MihF3ZAh92D4QEnFRH8WGkHHGrq"
            planetImageSource: "qrc:/UI/Planets/images/venus.png"
            planetNumber: 2
        }
        ListElement {
            name: "Earth"
            radius: "4 GB"
            temperature: "184-330 "
            orbitalPeriod: "365.256 d"
            distance: "QmdnwtnNwmHHpnyLS38MihF3ZAh92D4QEnFRH8WGkHHGrq"
            planetImageSource: "qrc:/UI/Planets/images/earth.png"
            planetNumber: 3
        }
        ListElement {
            name: "Mars"
            radius: "2 GB"
            temperature: "130-308"
            orbitalPeriod: "686.971 d"
            distance: "QmdnwtnNwmHHpnyLS38MihF3ZAh92D4QEnFRH8WGkHHGrq"
            planetImageSource: "qrc:/UI/Planets/images/mars.png"
            planetNumber: 4
        }
        ListElement {
            name: "Jupiter"
            radius: "20 GB"
            temperature: "112-165"
            orbitalPeriod: "4332.59 d"
            distance: "QmdnwtnNwmHHpnyLS38MihF3ZAh92D4QEnFRH8WGkHHGrq"
            planetImageSource: "qrc:/UI/Planets/images/jupiter.png"
            planetNumber: 5
        }
        ListElement {
            name: "Saturn"
            radius: "1 GB"
            temperature: "84-134"
            orbitalPeriod: "10759.22 d"
            distance: "QmdnwtnNwmHHpnyLS38MihF3ZAh92D4QEnFRH8WGkHHGrq"
            planetImageSource: "qrc:/UI/Planets/images/saturn.png"
            planetNumber: 6
        }
        ListElement {
            name: "Uranus"
            radius: "2 GB"
            temperature: "49-76 K"
            orbitalPeriod: "30687.15 d"
            distance: "QmdnwtnNwmHHpnyLS38MihF3ZAh92D4QEnFRH8WGkHHGrq"
            planetImageSource: "qrc:/UI/Planets/images/uranus.png"
            planetNumber: 7
        }
        ListElement {
            name: "Neptune"
            radius: "10 GB"
            temperature: "55-72"
            orbitalPeriod: "60190.03 d"
            distance: "QmdnwtnNwmHHpnyLS38MihF3ZAh92D4QEnFRH8WGkHHGrq"
            planetImageSource: "qrc:/UI/Planets/images/neptune.png"
            planetNumber: 8
        }
        ListElement {
            name: "NBS Chain"
            planetImageSource: ""
            planetNumber: 100 // Defaults to solar system
        }
    }

    Component {
        id: planetButtonDelegate
        PlanetButton {
            source  : planetImageSource
            text    : name
            focusPlanet: planetNumber
            planetSelector: planetRoot
            buttonSize: planetButtonSize
            fontSize: textSize

            scale: activeFocus ? 1.4 : 1.0

            Behavior on scale {
                PropertyAnimation {
                    duration: 200
                }
            }

            signal swipeUp()
            signal swipeDown()
            signal swipeLeft()

            onSwipeUp: {
                if (planetButtonView.currentIndex > 0) {
                    planetButtonView.currentIndex--
                } else {
                    rotationSpeedSlider.forceActiveFocus()
                }
            }

            onSwipeDown: {
                if (planetButtonView.currentIndex < planetButtonView.count - 1) {
                    planetButtonView.currentIndex++
                } else {
                    planetSizeSlider.forceActiveFocus()
                }
            }

            onSwipeLeft: {
                if (index <= planetButtonView.count / 2) {
                    rotationSpeedSlider.forceActiveFocus()
                } else {
                    planetSizeSlider.forceActiveFocus()
                }
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Select) {
                    planetSelector.focusedPlanet = focusPlanet
                }
            }
        }
    }

    ListView {
        id: planetButtonView
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: planetButtonSize / 2
        height: childrenRect.height
        spacing: planetButtonSize / 6
        width: planetButtonSize * 1.4
        interactive: false
        model: planetModel
        delegate: planetButtonDelegate
    }

    InfoSheet {
        id: info
        width: 380
        anchors.right: planetButtonView.left
        anchors.rightMargin: 10*dp;
        opacity: 1

        // Set initial information for Solar System
        planet: "NBS Chain"
        exampleDetails: "<p>NBS致力于将数字资产以分布式存储的形式进行加密保存，</p>"+
                        "<p>以区块链记账的方式实现数字资产所有权的登记</p>"+
                        "<p>以有差异化的token价值来体现不同数字资产的不同使用权，</p>"+
                        "<p>并促进其快速分发与流转。</p></br>"+
                        "<p>Copyright (c) By lambor,NBS Chain co.</p><br>" +
                        "<a href=\"http://nbsio.net/\">"+
                        "http://nbsio.net/</a>";
    }

    function updatePlanetInfo() {
        info.width = 380

        if (focusedPlanet !== 100) {
            info.planet = planetModel.get(focusedPlanet).name
            info.radius = planetModel.get(focusedPlanet).radius
            info.temperature = planetModel.get(focusedPlanet).temperature
            info.orbitalPeriod = planetModel.get(focusedPlanet).orbitalPeriod
            info.distance = planetModel.get(focusedPlanet).distance
        }else{
            info.planet = planetModel.get(focusedPlanet).name;
            info.exampleDetails = "<p>NBS致力于将数字资产以分布式存储的形式进行加密保存，</p>"+
                    "<p>以区块链记账的方式实现数字资产所有权的登记</p>"+
                    "<p>以有差异化的token价值来体现不同数字资产的不同使用权，</p>"+
                    "<p>并促进其快速分发与流转。</p></br>"+
                    "<p>Copyright (c) By lambor,NBS Chain co.</p><br>" +
                    "<a href=\"http://nbsio.net/\">"+
                    "http://nbsio.net/</a>";
        }
    }

    Row {
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        spacing: 10
        scale: rotationSpeedSlider.activeFocus ? 1.4 : 1.0
        opacity: rotationSpeedSlider.activeFocus ? 1.0 : 0.5

        Behavior on scale {
            PropertyAnimation {
                duration: 200
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter

            font.family: "Helvetica"
            font.pixelSize: textSize
            font.weight: Font.Light
            color: rotationSpeedSlider.panningEnabled ? "#80c342" : "#ffffff"
            text: "Rotation Speed"
        }

        StyledSlider {
            id: rotationSpeedSlider
            anchors.verticalCenter: parent.verticalCenter
            width: sliderLength
            value: 0.2
            minimumValue: 0
            maximumValue: 1
            onValueChanged: solarsystem.changeSpeed(value)

            focus: Qt.platform.os === "tvos" ? true : false

            property bool panningEnabled: false
            signal swipeDown()
            signal swipeLeft()
            signal swipeRight()
            signal pannedHorizontally(real p)
            signal pannedVertically(real p)

            onSwipeDown: {
                planetSizeSlider.forceActiveFocus()
            }

            onSwipeLeft: {
                viewingDistanceSlider.forceActiveFocus()
            }

            onSwipeRight: {
                planetButtonView.currentIndex = 0
                planetButtonView.forceActiveFocus()
            }

            onPannedHorizontally: {
                var step = (maximumValue - minimumValue) / 30

                if (p > 0) {
                    value += step
                } else {
                    value -= step
                }
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Select) {
                    panningEnabled = !panningEnabled
                }
            }
        }
    }

    Column {
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10
        scale: viewingDistanceSlider.activeFocus ? 1.4 : 1.0
        opacity: viewingDistanceSlider.activeFocus ? 1.0 : 0.5

        Behavior on scale {
            PropertyAnimation {
                duration: 200
            }
        }

        StyledSlider {
            id: viewingDistanceSlider

            anchors.horizontalCenter: parent.horizontalCenter
            orientation: Qt.Vertical
            height: sliderLength
            value: 1
            minimumValue: 1
            maximumValue: 2
            //! [2]
            onValueChanged: solarsystem.changeCameraDistance(value)
            //! [2]

            property bool panningEnabled: false
            signal swipeUp()
            signal swipeDown()
            signal swipeRight()
            signal pannedHorizontally(real p)
            signal pannedVertically(real p)

            onSwipeUp: {
                rotationSpeedSlider.forceActiveFocus()
            }

            onSwipeDown: {
                planetSizeSlider.forceActiveFocus()
            }

            onSwipeRight: {
                planetButtonView.currentIndex = 0
                planetButtonView.forceActiveFocus()
            }

            onPannedVertically: {
                var step = (maximumValue - minimumValue) / 30

                if (p > 0) {
                    value += step
                } else {
                    value -= step
                }
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Select) {
                    panningEnabled = !panningEnabled
                }
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter

            font.family: "Helvetica"
            font.pixelSize: textSize
            font.weight: Font.Light
            color: viewingDistanceSlider.panningEnabled ? "#80c342" : "#ffffff"
            text: "Viewing\nDistance"
        }
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        spacing: 10
        scale: planetSizeSlider.activeFocus ? 1.4 : 1.0
        opacity: planetSizeSlider.activeFocus ? 1.0 : 0.5

        Behavior on scale {
            PropertyAnimation {
                duration: 200
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Helvetica"
            font.pixelSize: textSize
            font.weight: Font.Light
            color: planetSizeSlider.panningEnabled ? "#80c342" : "#ffffff"
            text: "Planet Size"
        }

        StyledSlider {
            id: planetSizeSlider
            anchors.verticalCenter: parent.verticalCenter
            width: sliderLength
            value: 600
            minimumValue: 1
            maximumValue: 2000
            onValueChanged: solarsystem.changeScale(value, false)

            property bool panningEnabled: false
            signal swipeUp()
            signal swipeLeft()
            signal swipeRight()
            signal pannedHorizontally(real p)
            signal pannedVertically(real p)

            onSwipeUp: {
                rotationSpeedSlider.forceActiveFocus()
            }

            onSwipeLeft: {
                viewingDistanceSlider.forceActiveFocus()
            }

            onSwipeRight: {
                planetButtonView.currentIndex = planetButtonView.count - 1
                planetButtonView.forceActiveFocus()
            }

            onPannedHorizontally: {
                var step = (maximumValue - minimumValue) / 30

                if (p > 0) {
                    value += step
                } else {
                    value -= step
                }
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Select) {
                    panningEnabled = !panningEnabled
                }
            }
        }
    }

    // FPS display, initially hidden, clicking will show it
    FpsDisplay {
        id: fpsDisplay
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: 32
        height: 64
        hidden: true
    }

    Timer {
        interval: 1000
        repeat: true
        running: !fpsDisplay.hidden
        onTriggered: {
            fpsDisplay.fps = frames
            frames = 0
        }
        onRunningChanged: frames = 0
    }

    Loader {
        anchors.fill: parent

        source: Qt.platform.os === "tvos" ? "AppleTVInput.qml" : ""
    }
}
