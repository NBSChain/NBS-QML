import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

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
    anchors.fill                                : parent;
    color                                       : settings.neroHeleneColor;
    Label   {
        font    {
            family                              : aweFont.name
            pixelSize                           : 40*dp;
        }
        color                                   : foregroundColor;
        text                                    : qsTr("PageViews");
    }
    Text {
        anchors {
            right: parent.right;
            bottom: parent.bottom;
        }

        color : "white";
        text: "parent.h="+parent.height+";mainH="+mainWindow.height+";my="+root.height;
    }
}
