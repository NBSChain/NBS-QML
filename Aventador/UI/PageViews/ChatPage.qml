import QtQuick 2.11
import QtQuick.Controls 2.2

/**
 * @file    PageViews.qml
 * @version 1.0
 * @brief
 * @date    2018-09-07
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle {
    id                                          : root;
    anchors.centerIn                            : parent;
    Label   {
        font    {
            family                              : aweFont.name
            pixelSize                           : 40*dp;
        }
        color                                   : foregroundColor;
        text                                    : qsTr("聊天");
    }
}

