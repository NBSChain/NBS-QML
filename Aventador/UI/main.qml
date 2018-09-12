import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import "./TitleBar"
import "./SilingBar"
import "./BottomStatus"
import "./PageViews"

Window {
    id                                                          : mainWindow;
    readonly property real      dpi2kMax                        : 2560.*dp;
    property real               windState                       : Qt.WindowNoState;
    property alias              dp                              : settings.dp;
    property alias              winMode                         : settings.winMode;
    property color              bgColor                         : settings.neroHeleneColor;             //主背景色
    property color              foregroundColor                 : settings.foregroundColor;             //主前景色
    property color              activedForeFontColor            : settings.rossoMarsColor;              //activedForeFontColor
    property color              noramlFontColor                 : settings.itemBtnForceFontColor;
    property color              normalBgColor                   : settings.grigioLynxColor;
    property string             currentViewName                 : "index";

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
       id                                                       : aweFont;
       source                                                   : "qrc:/font/fontawesome-webfont.ttf";
    }
    //用户titlebar
    FontLoader {
       id                                                       : icomoonFont;
       source                                                   : "qrc:/font/icomoon.ttf";
    }
    /* 布局开始 */
    ColumnLayout   {
        id                                                      : mainLayoutID;
        anchors.fill                                            : parent;
        spacing                                                 : 0;

        Rectangle   {
            id                                                  : topRectID;
            height                                              : settings.titleHeight+2*dp;
            Layout.preferredHeight                              : settings.titleHeight+2*dp;
            Layout.minimumHeight                                : settings.titleHeight+2*dp;
            Layout.maximumHeight                                : settings.titleHeight+2*dp;
            Layout.fillWidth                                    : true;
            Layout.fillHeight                                   : true;
            color                                               : settings.grigioLynxColor;

            TitleBar    {
                id                                              : titleBar;
                color                                           : settings.silingBarBgColor;
                height                                          : settings.titleHeight;
                width                                           : parent.width;
            }
            //skyline 分割线
            Rectangle   {
                id                                              : skyline;
                anchors.top                                     : titleBar.bottom;
                color                                           : settings.rossoBiaColor;
                width                                           : parent.width;
                height                                          : 2*dp;
                anchors.left                                    : parent.left;
                anchors.leftMargin                              : 1*dp;
            }
        }

        /* 主展示区 */
        Rectangle {
            id                                                  : midRect;
            color                                               : bgColor;
            Layout.fillHeight                                   : true;
            Layout.fillWidth                                    : true;
            Layout.preferredHeight                              : settings.midMinHeight;
            Layout.minimumHeight                                : settings.midMinHeight;
            Layout.preferredWidth                               : settings.winWidth;

            Loader  {
                id                                              : midPageViewID;
                anchors.fill                                    : parent;
                source                                          : "qrc:/UI/PageViews/DappSettingPage.qml";//"qrc:/UI/PageViews/ChatPage.qml";
            }
        }
    }



    /* 主窗口内容展示 */
    function mainViewRouter(url,properties){
        midPageViewID.setSource(url,properties);
    }

    /*  */
    Drawer  {
        id                                          : menuDrawer;
        y                                           : skyline.y+skyline.height;
        visible                                     : false;
        modal                                       : false;
        clip                                        : true;
        edge                                        : Qt.RightEdge;
        closePolicy                                 : Popup.CloseOnEscape | Popup.CloseOnPressOutside;

        width                                       : (mainWindow.width*0.12)*dp;
        height                                      : (mainWindow.height - settings.titleHeight-2)*dp;

        background                                  : Rectangle {
            anchors.fill                            : parent;
            color                                   : settings.grigioLynxColor;
            opacity                                 : 0.6;
        }
        SilingBar                  {
            id                                      : silingToolar;
            anchors.fill                            : parent;
            scrollBarHeight                         : parent.height;
        }
    }

    function resizeWin(){
        if(windState === Qt.WindowFullScreen){
            silingToolar.setSilingScrollViewHeight((menuDrawer.height-142)*dp);
        }else{
            silingToolar.setSilingScrollViewHeight((520-164)*dp);
        }
    }

    /* App Settings */
    Settings    {
       id                                                   : settings;
       readonly property string     appTitleName            : qsTr("客户端");
       readonly property real       winMode                 : Qt.FramelessWindowHint | Qt.Window;
       readonly property real       dpScale                 : 1.5;
       readonly property real       dp                      : Math.max(Screen.pixelDensity*25.4/160*dpScale);

       readonly property real       titleHeight             : 32.*dp;
       readonly property real       winWidth                : 840.*dp;
       readonly property real       winHeight               : 520.*dp;
       readonly property real       statusBarHeight         : 26.*dp;
       readonly property real       midMinHeight            : (520-32-2)*dp;
       readonly property real       prefectRate             : 0.618;


       readonly property color      foregroundColor         : "#ffffff";    //白色前景
       readonly property color      normalFontColor         : "#ffffff";    //#FFFFFF
       readonly property color      rossoMarsColor          : "#cc0805";    //火星红
       readonly property color      rossoBiaColor           : "#a00a00";    // 酒红#F04155

       readonly property color      neroHeleneColor         : "#050505";    //土卫黑 bg main #050505
       readonly property color      neroNoctisColor         : "#000000";    //神秘黑
       readonly property color      grigioLynxColor         : "#2e2e2d";    //bg toolBar

       //font
       readonly property color      itemBtnForceFontColor   : "#B0B0AE";    //
       readonly property color      silingBarBgColor        : "#1A1B1F";    //
       readonly property color      hoveredBgColorGray      : "#a9a9a9";

       property string              curStackView            : "";

    }
}
