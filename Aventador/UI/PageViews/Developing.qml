import QtQuick 2.11
import QtQuick.Controls 2.2


/**
 * @file    Developing.qml
 * @version 1.0
 * @brief   开发中
 * @date    2018-09-07
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */

Label   {
    id                                      : root;
    height                                  : parent.height;
    width: parent.width;
    anchors {
        centerIn                            : parent;
    }

    font    {
        family                              : aweFont.name
        pixelSize                           : 40*dp;
    }
    color                                   : foregroundColor;
    text                                    : qsTr("开发中,尽请期待...");
    background: Rectangle{
        anchors.fill                        : parent;
        color                               : bgColor;
    }

    verticalAlignment                       : Label.AlignVCenter;
    horizontalAlignment                     : Label.AlignHCenter;
}

