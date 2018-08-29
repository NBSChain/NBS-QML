import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Window 2.11

import "./components"

Window {
    visible                                         : true
    width                                           : 900
    height                                          : 620

    BaseButton {
        id                                          : aboutPage
        x                                           : 20
        y                                           : 20
        text                                        : qsTr("测试");

        onClicked                                   : {
            status.text = "Button Clicked."
        }
    }

    Text    {
        id                                          : status
        x                                           : 20
        y                                           : 76
        width                                       : 116
        height                                      : 26
        text                                        : qsTr("waiting...");
        horizontalAlignment                         : Text.AlignHCenter
    }

    Row     {
        anchors.centerIn                            : parent
        spacing                                     : 20

        Text    {
            color                                   : Qt.rgba(0,160,226,0.98)
            font.family                             : "FontAwesome"
            font.pointSize                          : 32
            text                                    : "\uf2a1"
        }
    }
}
