import QtQuick 2.0
/**
 * @file    planetButton.qml
 * @version 1.0
 * @brief
 * @date    2018-09-22
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle {
    id: planetButton

    property alias text: planetText.text
    property alias source: planetImage.source
    property alias focusPlanet: planetImage.focusPlanet
    property Item planetSelector: parent.parent
    property int buttonSize: 70
    property int fontSize: 16

    width: buttonSize
    height: buttonSize
    color: "transparent"

    Image {
        id: planetImage
        anchors.fill: parent
        property int focusPlanet

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: { planetSelector.focusedPlanet = focusPlanet }
            onEntered: PropertyAnimation { target: planetText; property: "opacity"; to: 1 }
            onExited: PropertyAnimation {
                target: planetText
                property: "opacity"
                to: {
                    if (planetText.text != "Solar System")
                       0
                    else
                       1
                }
            }
        }
    }

    Text {
        id: planetText
        anchors.centerIn: parent
        font.family: "Helvetica"
        font.pixelSize: fontSize
        font.weight: Font.Light
        color: "white"
        opacity: {
            if (text == "Solar System" || (Qt.platform.os === "tvos" && planetButton.activeFocus))
                opacity = 1
            else
                opacity = 0
        }
    }
}
