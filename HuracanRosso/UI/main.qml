import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Window 2.11

import "./TitleBar"

/**
 * @file    mian.qml
 * @version 1.0
 * @brief   主窗口
 * @date    2018-08-29
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Window {
    property bool   winAventador                    : false;        //aventador 是否最大化
    property color  normalFontColor                 : "#ffffff";    //#FFFFFF
    property color  rossoMarsColor                  : "#cc0805";    //火星红
    property color  rossoBiaColor                   : "#a00a00";    // 酒红#F04155

    property color  neroHeleneColor                 : "#050505";    //土卫黑 bg main
    property color  neroNoctisColor                 : "#000000";    //神秘黑
    property color  grigioLynxColor                 : "#2e2e2d";    //bg toolBar

    id                                              : mainWindow;
    visible                                         : true;
    property real           dpScale                 : 1.5;//不同分辨率窗口伸缩比例
    readonly property real  dp                      : Math.max(Screen.pixelDensity*25.4/200*dpScale);
    color                                           : neroHeleneColor;
    minimumWidth                                    : 840;
    minimumHeight                                   : 520;
    width                                           : 840*dp; //h=w*0.618
    height                                          : 520*dp;
    flags                                           : Qt.FramelessWindowHint | Qt.Window;

    //增加字体库
    FontLoader  {
       id                                           : aweFont;
       source                                       : "../font/fontawesome-webfont.ttf";
    }
    //用户titlebar
    FontLoader {
       id                                           : icomoonFont;
       source                                       : "../font/icomoon.ttf";
    }

    /**********************************************************
      Main View Begin
    ***********************************************************/
    TitleBar    {
        id                                          : titleBar;
        width                                       : parent.width -2*dp;
        height                                      : 40*dp;
        anchors.left                                : parent.left;
        anchors.leftMargin                          : 1*dp;
        anchors.top                                 : parent.top;
        anchors.topMargin                           : 1*dp;
    }

    Rectangle   {
        id                                          : skyline;
        color                                       : rossoBiaColor;
        width                                       : parent.width -2*dp;
        height                                      : 2*dp;
        anchors.left                                : parent.left;
        anchors.leftMargin                          : 1*dp;
        anchors.top                                 : titleBar.bottom;
    }


}
