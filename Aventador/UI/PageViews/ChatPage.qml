import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./ChatRect"

/**
 * @file    PageViews.qml
 * @version 1.0
 * @brief
 * @date    2018-09-07
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
RowLayout   {
    id                                          : rootChatLayoutID;
    anchors.fill                                : parent;
    spacing                                     : 0*dp;

    /* Left */
    LeftPeerViewRect   {
        id                                      : leftPeersRectID;
        Layout.fillWidth                        : true;
        Layout.fillHeight                       : true;
        Layout.minimumWidth                     : 260*dp;
        Layout.preferredWidth                   : 260*dp;
        Layout.maximumWidth                     : 260*dp;
    }

    Rectangle   {
        id                                      : rightMessageRectID;
        color                                   : Qt.lighter(bgColor);
        Layout.fillWidth: true;
        Layout.fillHeight: true;
        Layout.minimumWidth: 580*dp;
        Layout.preferredWidth: 580*dp;

        RightChatRect   {
            id                                  : rightLayoutRect;
            anchors.fill                        : parent;
        }
    }
}



