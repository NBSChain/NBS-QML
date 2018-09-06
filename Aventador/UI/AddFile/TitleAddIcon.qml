import QtQuick 2.11
import QtQuick.Controls 2.2


/**
 * @file    TitleAddIcon.qml
 * @version 1.0
 * @brief   标题栏，添加文件图标操作
 * @date    2018-09-03
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle   {
    property bool   ishovered                   : false;                                //
    property color  _normalFontColor            : settings.foregroundColor;       //
    property color  _normalBGColor              : settings.grigioLynxColor;       //
    property color  _activedFontColor           : settings.rossoMarsColor;       //
    property color  _activedBGColor             : settings.grigioLynxColor;       //
    property string iconText;
    property string iconTipText;
    //anchors.centerIn                            : parent;
    width                                       : 28*dp;
    color                                       : _normalBGColor;

    Label   {
        id                                      : addLabelIcon;
        anchors.fill                            : parent;
        verticalAlignment                       : Label.AlignVCenter;
        horizontalAlignment                     : Label.AlignHCenter;
        text                                    : iconText;
        color                                   : _normalFontColor;
        font {
            family                              : aweFont.name;
            pixelSize                           : 20*dp;
            bold                                : true;
        }

        ToolTip.visible                         : ishovered;
        ToolTip.delay                           : 500;
        ToolTip.text                            : iconTipText;

        MouseArea {
            id                                  : quickAddMouseArea;
            anchors.fill                        : parent;
            hoverEnabled                        : true;
            cursorShape                         : Qt.PointingHandCursor;

            onEntered   : {
                ishovered               = true;
                addLabelIcon.color      = _activedFontColor;
            }

            onExited    : {
                addLabelIcon.color      = _normalFontColor;
                ishovered               = false;
            }

            onClicked   : {

            }
        }
    }
}
