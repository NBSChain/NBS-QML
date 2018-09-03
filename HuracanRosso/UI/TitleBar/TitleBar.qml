import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4 as Controls_1_4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.3
import "../Utils"
import "../AddFile"

/**
 * @file    TitleBar.qml
 * @version 1.0
 * @brief   顶部标题栏
 * @date    2018-08-29
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle   {
    id                                      : root;
    color                                   : settings.grigioLynxColor;

    MouseArea   {
        property real xmouse;//鼠标x,y坐标
        property real ymouse;

        anchors.fill                        : parent;
        acceptedButtons                     : Qt.LeftButton;//只处理鼠标左键事件

        drag.filterChildren                 : true;//拖动

        onPressed                           : {
            xmouse  = mouse.x;
            ymouse  = mouse.y;
        }

        onPositionChanged                   : {
            mainWindow.x = mainWindow.x + (mouse.x - xmouse);
            mainWindow.y = mainWindow.y + (mouse.y - ymouse);
        }
    }
    //主程序ico
    Image   {
        id                                  : icon;
        source                              : "qrc:/logo.ico";
        width                               : 32*dp;
        height                              : 32*dp;
        anchors {
            left                            : parent.left;
            leftMargin                      : 10*dp;
            verticalCenter                  : parent.verticalCenter;
        }
    }

    Label   {
        id                                  : appTitle;
        anchors {
            left                            : icon.right;
            leftMargin                      : 5*dp;
            verticalCenter                  : parent.verticalCenter;
        }
        text                                : qsTr("NBS 客户端");
        color                               : settings.foregroundColor;
        font{
            family                          : aweFont.name;
            pixelSize                       : 20*dp;
            bold                            : true;
        }

    }


    /* 快捷操作 */
    function qlbResetAll(){
        for(var i = 0;i<qlbtnGroup.buttons.length;++i){
            if(settings.curStackView!==qlbtnGroup.buttons[i].idName)
                qlbtnGroup.buttons[i].reset();
        }
    }

    function qlbtnGroupClicked (name){
        for(var i = 0;i<qlbtnGroup.buttons.length;++i){
            if(name !==qlbtnGroup.buttons[i].idName)
                qlbtnGroup.buttons[i].reset();
        }
        settings.curStackView = name;
    }

    ButtonGroup {
        id                                  : qlbtnGroup;
    }

    Rectangle   {
        id                                  : quickOperRect;
        anchors.verticalCenter              : parent.verticalCenter;
        width                               : 122*dp;
        height                              : parent.height;
        //color                               : settings.rossoMarsColor;
        anchors  {
            left                            : appTitle.right;
            leftMargin                      : 20*dp;
        }

        QuickLabelBtn   {
            id                              : homeQLBtn;
            anchors.left                    : parent.left;
            width                           : (parent.width)/2;
            idName                          : "HOMEMENU";
            labelText                       : "主页";
            selected                        : true;
            ButtonGroup.group               : qlbtnGroup;
        }
        QuickLabelBtn   {
            id                              : imQLBtn;
            anchors.left                    : homeQLBtn.right;
            width                           : (parent.width)/2;
            idName                          : "IMMENU";
            labelText                       : "聊天";
            ButtonGroup.group               : qlbtnGroup;
        }

    }

    //搜索框
    Rectangle   {
        id                                  : searcherBar;
        width                               : 340*dp;
        height                              : 25*dp;
        anchors {
            left                            : quickOperRect.right;
            leftMargin                      : 80*dp;
            verticalCenter                  : parent.verticalCenter;
        }
        radius                              : 15*dp;
        color                               : settings.neroHeleneColor;

        Controls_1_4.TextField  {
            id                              : searchText;
            width                           : parent.width - 20*dp;
            height                          : parent.height;
            anchors.left                    : parent.left;
            anchors.leftMargin              : 10*dp;

            font.family                     : aweFont.name;
            font.pixelSize                  : 13*dp;
            verticalAlignment               : TextInput.AlignVCenter;
            placeholderText                 : qsTr("输入hash58，搜索...");
            textColor                       : settings.foregroundColor;
            style                           : TextFieldStyle {
                placeholderTextColor        : settings.itemBtnForceFontColor;
                background                  : Rectangle {
                    anchors.centerIn        : parent;
                    id                      : searchFieldBg;
                    implicitWidth           : searchText.width;
                    implicitHeight          : searchText.height;
                    color                   : settings.neroHeleneColor;
                    Label   {

                        id                  : searchPlusIcon;
                        width               : 25*dp;
                        anchors {
                            right           : parent.right;
                            rightMargin     : -5*dp;
                            verticalCenter  : parent.verticalCenter;
                        }
                        font.family         : aweFont.name;
                        font.pixelSize      : 22*dp;
                        text                : "\uf00e";

                        ToolTip {
                            id              : searchTipID;
                            visible         : false;
                            delay           : 500;
                            text            : qsTr("点击图标或回车搜索");
                        }

                        MouseArea   {
                            anchors.fill    : parent;
                            hoverEnabled    : true;
                            cursorShape     : Qt.PointingHandCursor;

                            onEntered       : {
                                searchTipID.visible     = true;
                                searchPlusIcon.color    = settings.foregroundColor;

                            }

                            onExited        : {
                                searchPlusIcon.color = settings.itemBtnForceFontColor;
                                 searchTipID.visible     = false;
                            }

                            onClicked       : {

                            }
                        }
                    }

                }
            }

        }
    }

    //添加文件
    TitleAddIcon   {
        id                                  : quickAddRect;
        height                              : parent.height;
        anchors.left                        : searcherBar.right;
        anchors.leftMargin                  : 10*dp;
        _normalBGColor                      : parent.color;
        _activedBGColor                     : parent.color;
        _normalFontColor                    : settings.itemBtnForceFontColor;
        _activesFontColor                   : settings.rossoMarsColor;

        iconText                            : "\uf196";
        iconTipText                         : qsTr("添加文件到NBS网络");
    }

    /* 窗口操作 */
    Row         {
        anchors.right                       : parent.right;
        anchors.rightMargin                 : 1*dp;
        height                              : parent.height;
        spacing                             : 4*dp;


        WindButton      {
            id                              : msgIcon;
            anchors.verticalCenter          : parent.verticalCenter;
            wBtnWidth                       : 22*dp;
            wBtnHeight                      : 22*dp;

            wBtnText                        : "\uf535";      //消息
            fontSize                        : 20*dp;
            toolTip                         : qsTr("消息");

            btnClicked                      : function(){

            }
        }

        WindButton      {
            id                              : profileBtn;
            anchors.verticalCenter          : parent.verticalCenter;
            wBtnWidth                       : 24*dp;
            wBtnHeight                      : 24*dp;
            _showToolTip                    : false;
            wBtnText                        : "\uf4e9";     //
            fontSize                        : 22*dp;
            toolTip                         : qsTr("");

            btnClicked                      : function(){
                if(menuDrawer.visible){
                    menuDrawer.close();
                }else{
                    menuDrawer.open();
                }
            }
        }

        WindButton      {
            id                              : miniBtn;
            anchors.verticalCenter          : parent.verticalCenter;
            wBtnWidth                       : 22*dp;
            wBtnHeight                      : 22*dp;

            wBtnText                        : "\uf4e4";     //窗口图标
            fontSize                        : 20*dp;
            toolTip                         : qsTr("最小化");

            btnClicked                      : function(){
                mainWindow.visibility = Window.Minimized;
            }
        }

        WindButton      {
            id                              : toggleBtn;
            anchors.verticalCenter          : parent.verticalCenter;
            wBtnWidth                       : 20*dp;
            wBtnHeight                      : 20*dp;
            wBtnText                        : "\uf502";     //窗口图标

            fontSize                        : 18*dp;
            toolTip                         : qsTr("最大化");
            btnClicked                      : function(){
                if(!mainWindow.winAventador){
                    toggleBtn.toolTip = qsTr("还原");
                    toggleBtn.wBtnText = "\uf503";
                    mainWindow.winAventador = true;
                    mainWindow.showNormal();
                }else{
                    toggleBtn.toolTip = qsTr("最大化");
                    toggleBtn.wBtnText = "\uf502";
                    mainWindow.winAventador = false;
                    mainWindow.showFullScreen();
                }
            }
        }

        WindButton      {
            id                              : closeBtn;
            anchors.verticalCenter          : parent.verticalCenter;
            wBtnWidth                       : 22*dp;
            wBtnHeight                      : 22*dp;

            wBtnText                        : "\uf4e6";     //窗口图标
            fontSize                        : 20*dp;
            toolTip                         : qsTr("关闭");

            btnClicked                      : function(){
                Qt.quit();
            }
        }
    }



}
