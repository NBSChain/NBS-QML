import QtQuick 2.0
/**
 * @file   infoSheet.qml
 * @version 1.0
 * @brief
 * @date    2018-09-22
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Item {
    id: infoSheet

    width: 380
    height: 450
    anchors.verticalCenter: parent.verticalCenter

    property alias planet: planetText.planet
    property alias radius: infoText.radius
    property alias temperature: infoText.temperature
    property alias orbitalPeriod: infoText.orbitalPeriod
    property alias distance: infoText.distance
    property alias exampleDetails: infoText.exampleDetails
    property alias hash58: infoText.hash58

    Behavior on opacity { PropertyAnimation {} }

    //color: "black"

    Text {
        id: planetText
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        property string planet: ""

        font.family: "Helvetica"
        font.pixelSize: 32
        font.weight: Font.Light
        color: "white"

        text: "<p>" + planet + "</p>"
    }

    Text {
        id: infoText
        anchors.top: planetText.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        property string radius: ""
        property string temperature: ""
        property string orbitalPeriod: ""
        property string distance: ""
        property string exampleDetails: ""
        property string hash58: "";

        font.family: "Helvetica"
        font.pixelSize: 18
        font.weight: Font.Light
        lineHeight: 1.625 * 18
        lineHeightMode: Text.FixedHeight
        color: "white"

        text: {
            if (planet == "NBS Chain") {
                "<p>" + exampleDetails + "</p>"
            } else if (planet == "Sun") {
                "<p>Hash:</p><p style=\"font-size:12px\">" + hash58 + "</p></br>"
                "<p>Total Storages: </p><p>" + radius + "</p></br>"
                + "<p>Total Nodes: </p><p>" + temperature + "</p>"
            } else {
                "<p>Peer Hash:</p><p style=\"font-size:12px\">" + hash58 + "</p></br>"
                + "<p>Peer Storage: " + radius + "</p></br>"
                + "<p>GC Period: " + orbitalPeriod + "</p></br>"
                + "<p>Conntection Peers: " + temperature + "</p>"
            }
        }

        onLinkActivated: Qt.openUrlExternally(link)
    }
}

