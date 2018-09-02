import QtQuick 2.7
import QtQuick.Controls 2.2
/**
 * @file    WindButton.qml
 * @version 1.0
 * @brief
 * @date    2018-09-01
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Label   {
    property var        btnClicked                  : (function(){});                       //点击触发的事件函数

    property bool       ishovered                   : false;                                //是否hover状态
    property bool       _showToolTip                : true;
    property color      hoveredColor                : settings.rossoMarsColor;            //
    property color      bgColor                     : settings.grigioLynxColor;
    property color      fontColor;                  //

    property real       wBtnWidth;
    property real       wBtnHeight;
    property real       fontSize;

    property string     wBtnText;
    property string     toolTip;

    /* */
    id                                              : btn;
    width                                           : wBtnWidth;
    height                                          : wBtnHeight;

    text                                            : wBtnText;
    verticalAlignment                               : Text.AlignHCenter;
    horizontalAlignment                             : Text.horizontalCenter;

    font.family                                     : icomoonFont.name;
    font.pixelSize                                  : fontSize;
    color                                           : fontColor;

    background                                      : Rectangle {
        anchors.fill                                : parent;
        color                                       : bgColor;
    }

    ToolTip.visible                                 : ishovered;
    ToolTip.delay                                   : 500;
    ToolTip.text                                    : toolTip;

    MouseArea       {
        anchors.fill                                : parent;
        hoverEnabled                                : _showToolTip;
        cursorShape                                 : Qt.PointingHandCursor;

        onEntered   :   {
            btn.color       = hoveredColor;
            ishovered       = true;
        }

        onExited    :   {
            btn.color       = fontColor;
            ishovered       = false;
        }

        onClicked   :   {
            btnClicked();
        }
    }

}
