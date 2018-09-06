import QtQuick 2.11
import Qt.labs.settings 1.0
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import "TitleBar"

/**
 * @file    AppMain.qml
 * @version 1.0
 * @brief   新布局入口
 * @date    2018-08-31
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
window {
    id                                              : mainWindow;

    TitleBar    {
        id                                          : titleBar;

    }




    /* Global Settings */
    Settings    {
        id                                          : settings;
        property real   dp                          : Screen.pixelDensity;

        readonly property real  topHeight           : 40.*dp;                //顶部标题栏高度
        readonly property real  winWidth            : 840.*dp;               //
        readonly property real  winHeight           : 520.*dp;               //
        readonly property real  splitHeight         : 2.*dp;

    }
}
