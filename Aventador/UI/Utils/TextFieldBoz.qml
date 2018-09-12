import QtQuick 2.11
import QtQuick.Controls 2.2

/**
 * @file    TextFieldBoz.qml
 * @version 1.0
 * @brief
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
TextField {
    property color      fontColor           : noramlFontColor;
    property real       pixFontSize         : 12*dp;

    property real       preferWidth         : 90*dp;
    id                                      : root;
    width                                   : 90*dp;
    color                                   : fontColor;
    font {
        family                              : aweFont.name;
        pixelSize                           : 12*dp;
    }
    focusReason                             : Qt.TabFocus;

}
