import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import "./TitleBar"

Window {
    id                                                          : mainWindow;
    property real               windState                       : Qt.WindowNoState;
    property alias              dp                              : settings.dp;
    property alias              winMode                         : settings.winMode;
    property color              bgColor                         : settings.neroHeleneColor;             //主背景色
    property color              foregroundColor                 : settings.foregroundColor;             //主前景色
    property color              activedForeFontColor            : settings.rossoMarsColor;              //activedForeFontColor
    property color              noramlFontColor                 : settings.itemBtnForceFontColor;

    visible                                                     : true;    
    flags                                                       : settings.winMode;


    width                                                       : settings.winWidth;
    height                                                      : settings.winHeight;
    minimumWidth                                                : settings.winWidth;
    minimumHeight                                               : settings.winHeight;
    color                                                       : bgColor;
    opacity                                                     : 0.98;
    //增加字体库
    FontLoader  {
       id                                           : aweFont;
       source                                       : "qrc:/font/fontawesome-webfont.ttf";
    }
    //用户titlebar
    FontLoader {
       id                                           : icomoonFont;
       source                                       : "qrc:/font/icomoon.ttf";
    }

    //title: qsTr("Hello World")
    TitleBar    {
        id                                                      : titleBar;
        color                                                   : settings.silingBarBgColor;
        height                                                  : settings.titleHeight;
        width                                                   : parent.width;
    }
    //skyline 分割线
    Rectangle   {
        id                                          : skyline;
        anchors.top                                 : titleBar.bottom;
        color                                       : settings.rossoBiaColor;
        width                                       : parent.width;
        height                                      : 2*dp;
        anchors.left                                : parent.left;
        anchors.leftMargin                          : 1*dp;

    }


    ColumnLayout    {
        id                                                      : mainLayoutID;
        anchors.top                                             : skyline.bottom;
        spacing                                                 : 0;
        Layout.fillWidth                                        : true;
        Layout.preferredHeight                                  : settings.winHeight-settings.titleHeight-2;
        opacity                                                 : 1;


        Rectangle {
            //color       : settings.rossoBiaColor;
            Layout.fillWidth                         : true;
            Text    {
                text: qsTr("NBS Aventador");
                color: settings.rossoBiaColor;
            }




        }
        Image {
           Layout.fillWidth                         : true;
           source                                  : "qrc:/images/bg.png"
        }
    }



    /* App Settings */
    Settings    {
       id                                                  : settings;
       readonly property real      winMode                 : Qt.FramelessWindowHint | Qt.Window;
       readonly property real      dpScale                 : 1.5;
       readonly property real      dp                      : Math.max(Screen.pixelDensity*25.4/160*dpScale);

       readonly property real      titleHeight             : 32.*dp;
       readonly property real      winWidth                : 840.*dp;
       readonly property real      winHeight               : 520.*dp;
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
