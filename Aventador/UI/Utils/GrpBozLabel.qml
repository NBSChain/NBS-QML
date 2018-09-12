import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
/**
 * @file    GrpBozLabel.qml
 * @version 1.0
 * @brief
 * @date    2018-09-12
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Label {
    property alias  bold                    : root.font.bold;
    property color  fontColor               : settings.itemBtnForceFontColor;
    property real   fonsSize                : 16*dp;
    id                                      : root;

    font {
        family                              : aweFont.name;
        pixelSize                           : fonsSize;
        bold                                : true;
    }
}
