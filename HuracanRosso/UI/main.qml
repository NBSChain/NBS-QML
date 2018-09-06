import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Window 2.11
import Qt.labs.settings 1.0

import "./TitleBar"
import "./Utils"
import "./SilingBar"
import "./MainView"
import "./MainView/Pages"

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
    readonly property real  windMode                : Qt.FramelessWindowHint | Qt.Window;    //Qt.FramelessWindowHint | Qt.Window;


    id                                              : mainWindow;
    visible                                         : true;
    property real           dpScale                 : 1.5;//不同分辨率窗口伸缩比例
    readonly property real  dp                      : Math.max(Screen.pixelDensity*25.4/200*dpScale);
    color                                           : settings.neroNoctisColor;
    minimumWidth                                    : 840.;
    minimumHeight                                   : 520.;
    width                                           : 1000*dp; //h=w*0.618
    height                                          : 618*dp;
    flags                                           : windMode;
    //增加字体库
    FontLoader  {
       id                                           : aweFont;
       source                                       : "../font/fontawesome-webfont.ttf";
    }
    //用户titlebar
    FontLoader {
       id                                           : icomoonFont;
       source                                       : "qrc:/font/icomoon.ttf";
    }



    /**********************************************************
      Main View Begin
    ***********************************************************/
    //顶部标题框
    TitleBar    {
        id                                          : titleBar;
        width                                       : parent.width -2*dp;
        height                                      : 40*dp;
        anchors.left                                : parent.left;
        anchors.leftMargin                          : 1*dp;
        anchors.top                                 : parent.top;
        anchors.topMargin                           : 1*dp;
    }
    //skyline 分割线
    Rectangle   {
        id                                          : skyline;
        color                                       : settings.rossoMarsColor;
        width                                       : parent.width -2*dp;
        height                                      : 2*dp;
        anchors.left                                : parent.left;
        anchors.leftMargin                          : 1*dp;
        anchors.top                                 : titleBar.bottom;
    }
    //
    Rectangle   {
        width                                       : parent.width -0*dp;
        height                                      : parent.height -42*dp;
        anchors.top                                 : skyline.bottom;
        anchors.topMargin                           : 1*dp;
        //color                                       : settings.neroHeleneColor;
        opacity                                     : 0.05;
        Image {
            anchors.centerIn                        : parent;
            source                                  : "qrc:/images/huracan.png"
        }
    }

//    Rectangle   {

//    }

//    StackView   {
//        id                                          : stackView;

//    }








    Drawer  {
        id                          : menuDrawer;
        y                           : (titleBar.height+skyline.height-4)*dp;
        width                       : (mainWindow.width*0.15)*dp;
        height                      : (mainWindow.height-titleBar.height)*dp;
        visible                     : false;
        modal                       : false;
        clip                        : true;

        //

        edge                        : Qt.RightEdge;
        closePolicy                 : Popup.CloseOnEscape | Popup.CloseOnPressOutside;

        background                  : Rectangle {
            anchors.fill            : parent;
            color                   : settings.grigioLynxColor;
            opacity                 : 0.9;
        }

        SilingBar                  {
            id                      : silingToolar;
            anchors.fill            : parent;
        }
    }

    /* App Settings */
    Settings    {
        id                                                  : settings;
        readonly property real      headHeight              : 40;
        readonly property real      winWidth                : 1000;
        readonly property real      winHeight               : 618;
        readonly property real      dpScale                 : 1.5;
        readonly property real      prefectRate             : 0.618;


        readonly property color     foregroundColor         : "#ffffff";    //白色前景
        readonly property color     normalFontColor         : "#ffffff";    //#FFFFFF
        readonly property color     rossoMarsColor          : "#cc0805";    //火星红
        readonly property color     rossoBiaColor           : "#a00a00";    // 酒红#F04155

        readonly property color     neroHeleneColor         : "#050505";    //土卫黑 bg main #050505
        readonly property color     neroNoctisColor         : "#000000";    //神秘黑
        readonly property color     grigioLynxColor         : "#2e2e2d";    //bg toolBar

        //font
        readonly property color     itemBtnForceFontColor   : "#B0B0AE";    //
        readonly property color     silingBarBgColor        : "#1A1B1F";    //

        property string             curStackView            : "";

    }

}
