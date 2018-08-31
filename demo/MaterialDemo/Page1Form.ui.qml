import QtQuick 2.11
import QtQuick.Controls 2.4

Page {
    width: 600
    height: 400

    title: qsTr("Page 1")

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }

    Image {
        id: image
        opacity: 0.7
        anchors.fill: parent
        source: "about_ic.png"
    }
}
