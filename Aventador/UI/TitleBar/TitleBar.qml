import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

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



    //主程序ico
    Image   {
        id                                  : icon;
        visible                             : (winMode !== Qt.Window);
        width                               : 28*dp;
        height                              : 28*dp;
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
        text                                : qsTr("NBS 客户端");
    }

    /* 快捷操作 */
    function qlbResetAll(){
         for(var i = 0;i<qlbtnGroup.buttons.length;++i){
             if(settings.curStackView!==qlbtnGroup.buttons[i].idName)
                 qlbtnGroup.buttons[i].reset();
         }
    }

    function qlbtnGroupClicked (name){
//         for(var i = 0;i<qlbtnGroup.buttons.length;++i){
//             if(name !==qlbtnGroup.buttons[i].idName)
//                 qlbtnGroup.buttons[i].reset();
//         }
//         settings.curStackView = name;
    }

    ButtonGroup {
        id                                      : qlbtnGroup;
    }

    Rectangle   {
        id                                  : quickOperRect;
        anchors.left                        : appTitle.right;
        anchors.verticalCenter              : parent.verticalCenter;
        width                               : 102*dp;
        height                              : parent.height;
        //color                               : settings.rossoMarsColor;
        anchors  {
            left                            : (winMode === Qt.Window) ? root.left : appTitle.right;
            leftMargin                      : (winMode === Qt.Window) ? 0*dp : 20*dp;
        }

        QuickLabelBtn   {
            id                              : homeQLBtn;
            anchors.left                    : parent.left;
            _normalBgColor                  : root.color;
            width                           : (parent.width)/2;
            idName                          : qsTr("INDEX");
            labelText                       : "主页";
            selected                        : true;
            ButtonGroup.group               : qlbtnGroup;
        }
        QuickLabelBtn   {
            id                              : imQLBtn;
            anchors.left                    : homeQLBtn.right;
            _normalBgColor                  : root.color;
            width                           : (parent.width)/2;
            idName                          : "IMMENU";
            labelText                       : "聊天";
            ButtonGroup.group               : qlbtnGroup;
        }

    }


    Rectangle {
        id                                      : titleMidRectID;
        anchors.centerIn                        : parent;
        width                                   : 300*dp;
        height                                  : parent.height;
        color                                   : settings.rossoBiaColor;
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
                wBtnWidth                       : 21*dp;
                wBtnHeight                      : 21*dp;
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
