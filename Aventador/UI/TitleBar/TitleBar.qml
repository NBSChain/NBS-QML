import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4 as Controls_1_4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.3

import "../AddFile"

/**
 * @file    TitleBar.qml
 * @version 1.0
 * @brief
 * @date    2018-09-06
 * @author  lanbery
 * @section LICENSE Copyright (c) 2018 - 2025 lanbery,NBS Chain Co.
 */
Rectangle {
    id                                      : root;
    property color      titleColor          : foregroundColor;

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


    Rectangle {
        id                                      : titleMidRectID;
        anchors.centerIn                        : parent;
        width                                   : 320*dp;
        height                                  : parent.height;
        color                                   : root.color;

        //搜索框
        Rectangle   {
            id                                  : searcherBar;
            width                               : 280*dp;
            height                              : 20*dp;
            anchors {
                left                            : parent.left;
                leftMargin                      : 10*dp;
                verticalCenter                  : parent.verticalCenter;
            }
            radius                              : 12*dp;
            color                               : settings.neroHeleneColor;

            Controls_1_4.TextField  {
                id                              : searchText;
                width                           : parent.width - 20*dp;
                height                          : parent.height;
                anchors.left                    : parent.left;
                anchors.leftMargin              : 10*dp;

                font.family                     : aweFont.name;
                font.pixelSize                  : 12*dp;
                verticalAlignment               : TextInput.AlignVCenter;
                placeholderText                 : qsTr("输入hash58，回车搜索...");
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
                            width               : 20*dp;
                            anchors {
                                right           : parent.right;
                                rightMargin     : -5*dp;
                                verticalCenter  : parent.verticalCenter;
                            }
                            font.family         : aweFont.name;
                            font.pixelSize      : 16*dp;
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
            anchors.verticalCenter              : parent.verticalCenter;
            _normalBGColor                      : parent.color;
            _activedBGColor                     : parent.color;
            _normalFontColor                    : settings.itemBtnForceFontColor;
            _activedFontColor                   : settings.rossoMarsColor;

            iconText                            : "\uf196";
            iconTipText                         : qsTr("添加文件到NBS网络");
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
         switch(name){
         case "index":
             mainViewRouter("qrc:/UI/PageViews/PageViews.qml",{});
             settings.curStackView = name;
             break;
         case "chatMenu":
             mainViewRouter("qrc:/UI/PageViews/ChatPage.qml",{});
             settings.curStackView = name;
             break;
         default:
             break;
         }
    }
    ButtonGroup {
        id                                      : qlbtnGroup;
    }

    Rectangle   {
        id                                      : iconTitleRectID;
        anchors.left                            : parent.left;
        anchors.leftMargin                      : 0*dp;
        height                                  : parent.height;

        //主程序ico
        Image   {
            id                                  : icon;
            visible                             : (winMode !== Qt.Window);
            width                               : 26*dp;
            height                              : 26*dp;
            source                              : "qrc:/logo.ico";
            anchors {
                left                            : parent.left;
                leftMargin                      : 5*dp;
                verticalCenter                  : parent.verticalCenter;
            }
        }

        Label    {
            id                                  : appTitle;
            anchors {
                left                            : icon.right;
                leftMargin                      : 5*dp;
                verticalCenter                  : parent.verticalCenter;
            }

            font    {
                family                          : aweFont.name;
                pixelSize                       : 16*dp;
                bold                            : true;
            }
            color                               : foregroundColor;
            text                                : settings.appTitleName;
        }

        Rectangle   {
            id                                  : quickOperRect;
            anchors.left                        : appTitle.right;
            anchors.verticalCenter              : parent.verticalCenter;
            width                               : 102*dp;
            height                              : parent.height;
            anchors  {
                left                            : (winMode === Qt.Window) ? root.left : appTitle.right;
                leftMargin                      : (winMode === Qt.Window) ? 0*dp : 10*dp;
            }

            QuickLabelBtn   {
                id                              : homeQLBtn;
                anchors.left                    : parent.left;
                _normalBgColor                  : root.color;
                width                           : (parent.width)/2;
                idName                          : "index";
                labelText                       : "主页";
                selected                        : true;
                ButtonGroup.group               : qlbtnGroup;
            }
            QuickLabelBtn   {
                id                              : imQLBtn;
                anchors.left                    : homeQLBtn.right;
                _normalBgColor                  : root.color;
                width                           : (parent.width)/2;
                idName                          : "chatMenu";
                labelText                       : "聊天";
                ButtonGroup.group               : qlbtnGroup;
            }

        }
    }

    /* 窗口操作 */
    Rectangle {
        id                                      : windToolRectID;

        width                                   : 140*dp;
        height                                  : parent.height;
        color                                   : root.color;
        anchors.right                           : parent.right;
        Row {
            anchors.right                           : parent.right;
            anchors.rightMargin                     : 1*dp;
            height                                  : parent.height;
            spacing                                 : 4*dp;

            WindButton      {
                id                              : msgIcon;
                anchors.verticalCenter          : parent.verticalCenter;
                bgColor                         : root.color;
                wBtnWidth                       : 20*dp;
                wBtnHeight                      : 20*dp;
                fontColor                       : "#ffffff";
                wBtnText                        : "\uf535";      //消息
                fontSize                        : 20*dp;
                toolTip                         : qsTr("消息");

                btnClicked                      : function(){

                }
            }

            WindButton      {
                id                              : profileBtn;
                anchors.verticalCenter          : parent.verticalCenter;
                bgColor                         : root.color;
                fontColor                       : "#ffffff";
                wBtnWidth                       : 22*dp;
                wBtnHeight                      : 22*dp;
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
                visible                         : (winMode !== Qt.Window )
                anchors.verticalCenter          : parent.verticalCenter;
                bgColor                         : root.color;
                fontColor                       : "#ffffff";
                wBtnWidth                       : 22*dp;
                wBtnHeight                      : 22*dp;

                wBtnText                        : "\uf4e4";     //窗口图标
                fontSize                        : 20*dp;
                toolTip                         : qsTr("最小化");

                btnClicked                      : function(){
                    windState = Qt.WindowMinimized;
                    mainWindow.visibility = Window.Minimized;
                }
            }

            WindButton      {
                id                              : toggleBtn;
                visible                         : (winMode !== Qt.Window )
                anchors.verticalCenter          : parent.verticalCenter;
                bgColor                         : root.color;
                fontColor                       : "#ffffff";
                wBtnWidth                       : 18*dp;
                wBtnHeight                      : 18*dp;
                wBtnText                        : windState !== Qt.WindowFullScreen ?  "\uf502" : "\uf503";     //窗口图标

                fontSize                        : 18*dp;
                toolTip                         : windState !== Qt.WindowFullScreen ?  qsTr("最大化") : qsTr("还原");
                btnClicked                      : function(){

                    if(windState !== Qt.WindowFullScreen){
                        toggleBtn.toolTip = qsTr("还原");
                        toggleBtn.wBtnText = "\uf503";
                        windState = Qt.WindowFullScreen;
                        mainWindow.showFullScreen();
                    }else {
                        toggleBtn.toolTip = qsTr("最大化");
                        toggleBtn.wBtnText = "\uf502";
                         windState = Qt.WindowNoState;
                        mainWindow.showNormal();
                    }
                     resizeWin();
                }
            }

            WindButton      {
                id                              : closeBtn;
                visible                         : (winMode !== Qt.Window )
                anchors.verticalCenter          : parent.verticalCenter;
                wBtnWidth                       : 22*dp;
                wBtnHeight                      : 22*dp;
                bgColor                         : root.color;
                fontColor                       : "#ffffff";

                wBtnText                        : "\uf4e6";     //窗口图标
                fontSize                        : 20*dp;
                toolTip                         : qsTr("关闭");

                btnClicked                      : function(){
                    Qt.quit();
                }
            }
        }

    }

    Component.onCompleted                   : {

    }
}
