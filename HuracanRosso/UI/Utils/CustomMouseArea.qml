import QtQuick 2.11
import QtQuick.Controls 2.2
/**
 * @file    CoustomMouseArea.qml
 * @version 1.0
 * @brief   鼠标区域
 * @date    2018-09-01
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
MouseArea   {
    property int    _cursorShape                : Qt.PointingHandCursor;    //鼠标形状
    property var    _onEnteredFunction          : function(){};             //鼠标进入
    property var    _onExitedFuncton            : function(){};             //
    property var    _onClickedFunction          : function(){};             //

    property string toolTip                     : "";                       //
    property bool   ishovered                   : false;                    //是否hovered
    property bool   isToolTip                   : true;                     //

    anchors.fill                                : parent;
    hoverEnabled                                : true;
    cursorShape                                 : _cursorShape;

    ToolTip.visible                             : ishovered;
    ToolTip.delay                               : 500;
    ToolTip.text                                : toolTip;

    onEntered                                   : {
        _onEnteredFunction();
        if(isToolTip)
            ishovered = true;
    }

    onExited                                    : {
        _onExitedFuncton();
        if(isToolTip)
            ishovered = false;
    }

    onClicked                                   : {
        _onClickedFunction();
    }

}
