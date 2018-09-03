import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Window 2.3

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
