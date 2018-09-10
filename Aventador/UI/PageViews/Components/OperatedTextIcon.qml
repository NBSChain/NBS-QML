import QtQuick 2.11
import QtQuick.Controls 2.2

/**
 * @file    OperatedTextIcon.qml
 * @version 1.0
 * @brief   摘要
 *
 * @date    2018-09-10
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Text {
    id                                              : rootIconText;
    property var        iconClicked                 : (function (){});  //点击事件
    property bool       isHovered                   : false;
    property real       iconFontSize                : 18*dp;
    property alias      text                        : rootIconText.text;                //
    property color      normalColor;
    property color      hoveredColor;

    color                                           : normalColor;
    anchors.verticalCenter                          : parent.verticalCenter;
    font {
        family                                      : aweFont.name;
        pixelSize                                   : iconFontSize;
    }

    MouseArea {
        anchors.fill                                : parent;
        hoverEnabled                                : true;
        onEntered   : {
            rootIconText.color = hoveredColor;
        }

        onExited    : {
            rootIconText.color = normalColor;
        }
    }
}
