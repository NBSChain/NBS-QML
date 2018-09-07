import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

/**
 * @file    PageViews.qml
 * @version 1.0
 * @brief
 * @date    2018-09-07
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
//Rectangle {
//    id:root;
//    anchors.fill: parent;

    RowLayout   {
        id                                          : rootChatLayoutID;
        anchors.fill                                : parent;
        spacing:0*dp;

        /* Left */
        Rectangle   {
            id                                      : leftPeersRectID;
            color                                   : bgColor;
            Layout.fillWidth                        : true;
            Layout.fillHeight                       : true;
            Layout.minimumWidth                     : 260*dp;
            Layout.preferredWidth                   : 260*dp;
            Layout.maximumWidth                     : dpi2kMax;
            Layout.minimumHeight                    : settings.midMinHeight*dp;
            Layout.maximumHeight                    : dpi2kMax;

            Text    {
                anchors.centerIn: parent;
                text : parent.width+"px";
            }
        }

        Rectangle   {
            id                                      : rightMessageRectID;
            color   :"#0cc10f";
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            Layout.minimumWidth: 580*dp;
            Layout.preferredWidth: 580*dp;
            Layout.maximumWidth: dpi2kMax;
            Layout.minimumHeight: settings.midMinHeight*dp;
            Layout.maximumHeight: dpi2kMax;

            Text    {
                anchors.centerIn: parent;
                text : parent.width+"px"+parent.height;
            }
        }
    }
//}


