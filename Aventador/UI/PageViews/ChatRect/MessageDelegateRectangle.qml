import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

/**
 * @file    MessageDelegateRectangle.qml
 * @version 1.0
 * @brief   Delegate消息
 * @date    2018-09-11
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
ItemDelegate {
    property color      bgColor                                 : settings.silingBarBgColor;
    property bool       isSelf                                  : model.self | false;
    id                                                          : root;

    width                                                       : parent ? parent.width : 0;

    leftPadding                                                 : 2*dp;
    rightPadding                                                : 2*dp;

    contentItem : RowLayout {
        spacing                                                 : 5*dp;

        Rectangle {
            id                                                  : textRect;

            Text {
                color   : "white";
                text    : model.content | "";
            }
        }


    }



}
