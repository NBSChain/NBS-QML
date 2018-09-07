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
Rectangle {
    id                                          : root;
    height                                      : parent.height;
    width                                       : parent.width;
    anchors {
        centerIn                                : parent;
    }
    color                                       : bgColor;
    Row {
        anchors.centerIn                        : parent;
        spacing: 26*dp;
        Label   {
            font    {
                family                              : aweFont.name
                pixelSize                           : 26*dp;
            }
            color                                   : foregroundColor;
            text                                    : "\uf109";                         //\uf109;\uf108
            verticalAlignment                       : Label.AlignVCenter;
            horizontalAlignment                     : Label.AlignHCenter;
        }

        Label   {
            font    {
                family                              : aweFont.name
                pixelSize                           : 24*dp;
            }
            color                                   : foregroundColor;
            text                                    : qsTr("正在开发中,尽请期待...");
            verticalAlignment                       : Label.AlignVCenter;
            horizontalAlignment                     : Label.AlignHCenter;
        }

    }


}



