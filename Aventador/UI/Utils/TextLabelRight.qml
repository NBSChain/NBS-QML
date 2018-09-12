import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

/**
 * @file    TextLabelRight.qml
 * @version 1.0
 * @brief
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Label {
//    property alias      text                : root.text;
    property bool       isRight             : true;
    property color      fontColor           : noramlFontColor;
    property real       pixFontSize         : 12*dp;

    property real       preferWidth         : 90*dp;

    id                                      : root;
    Layout.preferredWidth                   : preferWidth;
    color                                   : fontColor;
    font {
        family                              : aweFont.name;
        pixelSize                           : pixFontSize;
    }
    horizontalAlignment                     : isRight ? Qt.AlignRight : Qt.AlignLeft;
}
