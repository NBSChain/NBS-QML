import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.3

Slider {
    id: styledSlider

    style: SliderStyle {
        groove: Rectangle {
            implicitWidth: 200
            implicitHeight: 5
            color: "#5d5b59"
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                width: styleData.handlePosition
                height: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#80c342" }
                    GradientStop { position: 1.0; color: "#328930" }
                }
            }
        }
        handle: Rectangle {
            Rectangle {
                anchors.centerIn: parent
                color: "#aeadac"
                border.color: "#1e1b18"
                border.width: 1
                implicitWidth: 8
                implicitHeight: 20
            }
            anchors.centerIn: parent
            color: "transparent"
            border.width: 0
            implicitWidth: 50
            implicitHeight: 50
        }
    }
}
