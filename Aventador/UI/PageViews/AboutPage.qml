import QtQuick 2.11
import QtQuick.Controls 2.2


/**
 * @file    AboutPage.qml
 * @version 1.0
 * @brief   关于NBS
 * @date    2018-09-07
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle {
    id                                          : root;
    anchors.centerIn                            : parent;
    color                                       : settings.neroHeleneColor;
    Label   {
        font    {
            family                              : aweFont.name
            pixelSize                           : 40*dp;
        }
        color                                   : foregroundColor;
        text                                    : qsTr("About Page");
    }
}
